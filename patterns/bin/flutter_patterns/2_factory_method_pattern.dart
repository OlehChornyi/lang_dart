import 'dart:io';

void main(List<String> args) {
  PlatformButton button = ButtonFactory.createButton();
  button.render();
  //---------------
  final logger = LoggerFactory.createLogger(isProduction: false);
  logger.log("App started");
  //---------------
  final screen = HomeScreenFactory.create('admin');
  screen.show(); 
  //---------------
  var handler = NotificationFactory.create('sms');
  handler.send("Your order is ready!");
  //---------------
  final theme = ThemeFactory.create(true);
  theme.render();
}

//2.1. Platform-Specific Button Widget
//Create a factory that returns different buttons depending on the platform.
abstract class PlatformButton {
  void render();
}

class AndroidButton implements PlatformButton {
  @override
  void render() => print("Rendering Material (Android) Button");
}

class IOSButton implements PlatformButton {
  @override
  void render() => print("Rendering Cupertino (iOS) Button");
}

class ButtonFactory {
  static PlatformButton createButton() {
    if (Platform.isAndroid) {
      return AndroidButton();
    } else if (Platform.isIOS) {
      return IOSButton();
    }
    // throw UnsupportedError("Unsupported platform");
    return AndroidButton();
  }
}

//2.2. Logger Based on Environment
//Use a factory to create a logger depending on environment (dev/prod).
abstract class Logger {
  void log(String message);
}

class DevLogger implements Logger {
  @override
  void log(String message) => print("DEV: $message");
}

class ProdLogger implements Logger {
  @override
  void log(String message) {
    // In real apps: send to server
    print("PROD log sent: $message");
  }
}

class LoggerFactory {
  static Logger createLogger({required bool isProduction}) {
    return isProduction ? ProdLogger() : DevLogger();
  }
}

//2.3. Widget Factory Based on User Role
//Return different home screens based on the role.
abstract class HomeScreen {
  void show();
}

class AdminHome implements HomeScreen {
  @override
  void show() => print("Admin Home Screen");
}

class UserHome implements HomeScreen {
  @override
  void show() => print("User Home Screen");
}

class HomeScreenFactory {
  static HomeScreen create(String role) {
    if (role == 'admin') return AdminHome();
    return UserHome();
  }
}

//2.4. Notification Handler Factory
//Create different notification handlers (Email/SMS) using a factory.
abstract class NotificationHandler {
  void send(String message);
}

class EmailHandler implements NotificationHandler {
  @override
  void send(String message) => print("Sending Email: $message");
}

class SMSHandler implements NotificationHandler {
  @override
  void send(String message) => print("Sending SMS: $message");
}

class NotificationFactory {
  static NotificationHandler create(String type) {
    switch (type) {
      case 'email':
        return EmailHandler();
      case 'sms':
        return SMSHandler();
      default:
        throw Exception("Unknown notification type");
    }
  }
}

//2.5. Theme Selector Factory
//Return a theme style widget based on dark or light mode.
abstract class ThemeWidget {
  void render();
}

class DarkTheme implements ThemeWidget {
  @override
  void render() => print("Rendering Dark Theme UI");
}

class LightTheme implements ThemeWidget {
  @override
  void render() => print("Rendering Light Theme UI");
}

class ThemeFactory {
  static ThemeWidget create(bool isDarkMode) {
    return isDarkMode ? DarkTheme() : LightTheme();
  }
}