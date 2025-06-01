void main(List<String> args) {
  final list = ProductList(['Shirt', 'Watch', 'Bag'], AlphabeticalSort());
  list.sort();
  print('Sorted A-Z: ${list.products}');

  list.strategy = ReverseSort();
  list.sort();
  print('Sorted Z-A: ${list.products}');
  //---------------------
  final login = LoginContext(EmailLogin());
  login.executeLogin('test@example.com', 'password123');

  login.strategy = GoogleLogin();
  login.executeLogin('test@example.com', '');
  //---------------------
  final receipt = ReceiptGenerator(SimpleReceipt());
  receipt.printReceipt({'Apples': 3, 'Bananas': 2});

  receipt.strategy = DetailedReceipt();
  receipt.printReceipt({'Apples': 3, 'Bananas': 2});
}

//5.1. Sorting Items in a ListView
//Use different sorting strategies for displaying a list of products.
abstract class SortStrategy {
  List<String> sort(List<String> items);
}

class AlphabeticalSort implements SortStrategy {
  @override
  List<String> sort(List<String> items) => [...items]..sort();
}

class ReverseSort implements SortStrategy {
  @override
  List<String> sort(List<String> items) =>
      [...items]..sort((a, b) => b.compareTo(a));
}

class ProductList {
  List<String> products;
  SortStrategy strategy;

  ProductList(this.products, this.strategy);

  void sort() {
    products = strategy.sort(products);
  }
}

//5.2. Theme Switching Strategy
//Change the app theme dynamically using strategies.
abstract class ThemeData {
  static light() => print('Light');
  static dark() => print('Light');
}

abstract class ThemeStrategy {
  ThemeData getTheme();
}

class LightTheme implements ThemeStrategy {
  @override
  ThemeData getTheme() => ThemeData.light();
}

class DarkTheme implements ThemeStrategy {
  @override
  ThemeData getTheme() => ThemeData.dark();
}

class ThemeManager {
  ThemeStrategy _strategy;

  ThemeManager(this._strategy);

  ThemeData get theme => _strategy.getTheme();

  void setStrategy(ThemeStrategy strategy) {
    _strategy = strategy;
  }
}

//5.3. Login Method Strategy (Email vs Google)
//Allow users to log in using different strategies (email, Google, etc.).
abstract class LoginStrategy {
  void login(String username, String password);
}

class EmailLogin implements LoginStrategy {
  @override
  void login(String username, String password) {
    print("Logging in with email: $username");
  }
}

class GoogleLogin implements LoginStrategy {
  @override
  void login(String username, String password) {
    print("Logging in with Google for $username");
  }
}

class LoginContext {
  LoginStrategy strategy;

  LoginContext(this.strategy);

  void executeLogin(String username, String password) {
    strategy.login(username, password);
  }
}

//5.4. Notification Strategy (Snackbar vs Dialog)
//Show different types of notifications based on user preference.
// abstract class NotificationStrategy {
//   void show(BuildContext context, String message);
// }

// class SnackbarNotification implements NotificationStrategy {
//   @override
//   void show(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
// }

// class DialogNotification implements NotificationStrategy {
//   @override
//   void show(BuildContext context, String message) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(title: Text("Notification"), content: Text(message)),
//     );
//   }
// }

// class Notifier {
//   NotificationStrategy strategy;

//   Notifier(this.strategy);

//   void notify(BuildContext context, String message) {
//     strategy.show(context, message);
//   }
// }

//5.5. Receipt Generation Strategy
//Format order receipts in different styles.
abstract class ReceiptStrategy {
  String generate(Map<String, int> items);
}

class SimpleReceipt implements ReceiptStrategy {
  @override
  String generate(Map<String, int> items) {
    return items.entries.map((e) => '${e.key}: ${e.value}').join('\n');
  }
}

class DetailedReceipt implements ReceiptStrategy {
  @override
  String generate(Map<String, int> items) {
    return items.entries
        .map((e) => 'Item: ${e.key}, Quantity: ${e.value}')
        .join('\n---\n');
  }
}

class ReceiptGenerator {
  ReceiptStrategy strategy;

  ReceiptGenerator(this.strategy);

  void printReceipt(Map<String, int> items) {
    print(strategy.generate(items));
  }
}