void main(List<String> args) async {
  final service = ApiServiceProxy();

  print(await service.fetchData());
  print(await service.fetchData());
  //----------------
  final adminProxy = AdminProxy(false);
  adminProxy.deleteUser("alice");

  final realAdmin = AdminProxy(true);
  realAdmin.deleteUser("bob");
  //----------------
  final auth = LoggingAuthProxy();
  auth.login("test_user", "password123");
  //----------------

}

//The Proxy Pattern provides a surrogate or placeholder 
//for another object to control access to it. In Flutter, it's useful for:
//lazy loading
//access control
//logging or caching behavior
//network request shielding
//expensive widget loading

//9.1. Lazy Loading Image Proxy
//Load an image only when it's accessed.
// abstract class ImageLoader {
//   Widget loadImage();
// }

// class RealImage implements ImageLoader {
//   final String url;

//   RealImage(this.url) {
//     print("Image downloaded from $url");
//   }

//   @override
//   Widget loadImage() {
//     return Image.network(url);
//   }
// }

// class ImageProxy implements ImageLoader {
//   final String url;
//   RealImage? _realImage;

//   ImageProxy(this.url);

//   @override
//   Widget loadImage() {
//     _realImage ??= RealImage(url);
//     return _realImage!.loadImage();
//   }
// }

// Widget build(BuildContext context) {
//   final imageProxy = ImageProxy("https://example.com/image.jpg");

//   return Scaffold(
//     body: Center(child: imageProxy.loadImage()),
//   );
// }

//9.2. Caching Proxy for API Service
//Prevent repeated API requests by using a cached proxy.
abstract class ApiService {
  Future<String> fetchData();
}

class RealApiService implements ApiService {
  @override
  Future<String> fetchData() async {
    print("Calling real API...");
    await Future.delayed(Duration(seconds: 1));
    return "Live data from API";
  }
}

class ApiServiceProxy implements ApiService {
  final RealApiService _realService = RealApiService();
  String? _cache;

  @override
  Future<String> fetchData() async {
    if (_cache != null) {
      print("Returning cached data");
      return _cache!;
    }
    _cache = await _realService.fetchData();
    return _cache!;
  }
}

//9.3. Access Control Proxy (e.g., Admin vs User)
//Control access to a sensitive action (like deleting data).
abstract class AdminActions {
  void deleteUser(String username);
}

class RealAdminActions implements AdminActions {
  @override
  void deleteUser(String username) {
    print("User $username deleted.");
  }
}

class AdminProxy implements AdminActions {
  final bool isAdmin;
  final RealAdminActions _realAdmin = RealAdminActions();

  AdminProxy(this.isAdmin);

  @override
  void deleteUser(String username) {
    if (!isAdmin) {
      print("Access Denied: You are not an admin.");
      return;
    }
    _realAdmin.deleteUser(username);
  }
}

//9.4. Logging Proxy for User Authentication
//Log login attempts without modifying the real login logic.
abstract class AuthService {
  void login(String username, String password);
}

class RealAuthService implements AuthService {
  @override
  void login(String username, String password) {
    print("Authenticating $username...");
  }
}

class LoggingAuthProxy implements AuthService {
  final RealAuthService _realAuth = RealAuthService();

  @override
  void login(String username, String password) {
    print("Log: Login attempt for $username");
    _realAuth.login(username, password);
  }
}

//9.5. Widget Proxy for Expensive Layout
//Only build a heavy widget when necessary.
// abstract class WidgetBuilderProxy {
//   Widget build();
// }

// class HeavyWidget implements WidgetBuilderProxy {
//   HeavyWidget() {
//     print("Heavy widget initialized.");
//   }

//   @override
//   Widget build() {
//     return Container(
//       height: 200,
//       color: Colors.red,
//       child: Center(child: Text("Heavy Widget")),
//     );
//   }
// }

// class WidgetProxy implements WidgetBuilderProxy {
//   HeavyWidget? _heavyWidget;

//   @override
//   Widget build() {
//     _heavyWidget ??= HeavyWidget();
//     return _heavyWidget!.build();
//   }
// }

// Widget build(BuildContext context) {
//   final proxy = WidgetProxy();

//   return Scaffold(
//     appBar: AppBar(title: Text("Proxy Example")),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Click to load widget"),
//           ElevatedButton(
//             onPressed: () {
//               // Load the widget only when button is pressed
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(content: proxy.build()),
//               );
//             },
//             child: Text("Load Widget"),
//           )
//         ],
//       ),
//     ),
//   );
// }