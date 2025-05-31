void main(List<String> args) {
  var config1 = AppConfig();
  var config2 = AppConfig();

  config1.apiBaseUrl = 'https://api.production.com';

  print(config2.apiBaseUrl);
  //--------------
  var analytics = AnalyticsService();
  analytics.logEvent('User Signed In');
  //--------------
  var session = UserSession();
  session.userId = 'abc123';
  session.token = 'token_xyz';

  print('Is logged in: ${UserSession().isLoggedIn}');
  //--------------
  CartService().addItem('Phone');
  CartService().addItem('Charger');

  print(CartService().items);
  //--------------
  var notifier = NotificationManager();
  notifier.initialize();
  notifier.sendTestNotification('You have a new message!');
}

//1.1. App Configuration Service
//Create a singleton class to hold configuration values used across the app.
class AppConfig {
  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() => _instance;

  AppConfig._internal();

  String apiBaseUrl = 'https://api.example.com';
  String appVersion = '1.0.0';
}

//1.2. Analytics Service Singleton
//Implement a singleton to simulate logging app events.
class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();

  factory AnalyticsService() => _instance;

  AnalyticsService._internal();

  void logEvent(String event) {
    print('Logging event: $event');
  }
}

//1.3. Singleton for Managing User Session
//Track the current user session using a singleton.
class UserSession {
  static final UserSession _instance = UserSession._internal();

  factory UserSession() => _instance;

  UserSession._internal();

  String? userId;
  String? token;

  bool get isLoggedIn => userId != null && token != null;
}

//1.4. Singleton Shopping Cart
//Manage cart items in a shopping app using a singleton.
class CartService {
  static final CartService _instance = CartService._internal();

  factory CartService() => _instance;

  CartService._internal();

  final List<String> _items = [];

  void addItem(String item) {
    _items.add(item);
  }

  List<String> get items => _items;
}

//1.5. Singleton Push Notification Manager
//Simulate a push notification service that can be accessed globally.
class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();

  factory NotificationManager() => _instance;

  NotificationManager._internal();

  void initialize() {
    print('Push Notification Service Initialized.');
  }

  void sendTestNotification(String message) {
    print('Push Notification: $message');
  }
}