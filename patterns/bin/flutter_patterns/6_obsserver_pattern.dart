void main(List<String> args) {
  final counter = Counter();
  final widget1 = TextObserver("Widget1");
  final widget2 = TextObserver("Widget2");

  counter.attach(widget1);
  counter.attach(widget2);

  counter.increment();
  //--------------
  final cart = Cart();
  final badge = CartBadge();

  cart.attach(badge);
  cart.addItem("Shoes");
  cart.addItem("Hat");
  //--------------
  final theme = ThemeManager();
  theme.attach(ThemeText("Header"));
  theme.attach(ThemeText("Footer"));

  theme.toggleTheme();
  //--------------
  final service = ConnectivityService();
  final banner = ConnectionBanner();

  service.attach(banner);
  service.setStatus(NetworkStatus.online);
  //--------------
  final form = FormValidator();
  final display = ErrorDisplay();

  form.attach(display);
  form.validate("Hi");
  form.validate("Flutter");
}

//6.1. Basic Counter App with Custom Observer
//Build a counter where multiple widgets get notified when the count changes.
abstract class Observer {
  void update(int count);
}

class Counter {
  int _count = 0;
  final List<Observer> _observers = [];

  void attach(Observer observer) => _observers.add(observer);
  void detach(Observer observer) => _observers.remove(observer);

  void increment() {
    _count++;
    _notify();
  }

  void _notify() {
    for (var o in _observers) {
      o.update(_count);
    }
  }
}

class TextObserver implements Observer {
  final String name;
  TextObserver(this.name);

  @override
  void update(int count) {
    print('$name updated: $count');
  }
}

//6.2. Cart Item Count Notifier
//Notify widgets when items are added to the cart.
abstract class CartObserver {
  void onCartUpdated(int itemCount);
}

class Cart {
  final List<CartObserver> _observers = [];
  final List<String> _items = [];

  void addItem(String item) {
    _items.add(item);
    _notify();
  }

  void attach(CartObserver observer) => _observers.add(observer);

  void _notify() {
    for (var o in _observers) {
      o.onCartUpdated(_items.length);
    }
  }
}

class CartBadge implements CartObserver {
  @override
  void onCartUpdated(int itemCount) {
    print('Cart Badge Updated: $itemCount items');
  }
}

//6.3. Custom Theme Notifier
//Notify components when the theme mode changes.
enum ThemeMode { light, dark }

abstract class ThemeObserver {
  void onThemeChanged(ThemeMode mode);
}

class ThemeManager {
  ThemeMode _current = ThemeMode.light;
  final List<ThemeObserver> _observers = [];

  void attach(ThemeObserver o) => _observers.add(o);

  void toggleTheme() {
    _current = _current == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _notify();
  }

  void _notify() {
    for (var o in _observers) {
      o.onThemeChanged(_current);
    }
  }
}

class ThemeText implements ThemeObserver {
  final String widgetName;
  ThemeText(this.widgetName);

  @override
  void onThemeChanged(ThemeMode mode) {
    print('$widgetName updated to ${mode.name} mode');
  }
}

//6.4. Connectivity Status Listener
//Notify UI components when connectivity status changes.
enum NetworkStatus { online, offline }

abstract class ConnectivityObserver {
  void onStatusChanged(NetworkStatus status);
}

class ConnectivityService {
  final List<ConnectivityObserver> _observers = [];
  NetworkStatus _status = NetworkStatus.offline;

  void attach(ConnectivityObserver o) => _observers.add(o);

  void setStatus(NetworkStatus status) {
    _status = status;
    _notify();
  }

  void _notify() {
    for (var o in _observers) {
      o.onStatusChanged(_status);
    }
  }
}

class ConnectionBanner implements ConnectivityObserver {
  @override
  void onStatusChanged(NetworkStatus status) {
    print("Banner: You're now ${status.name}");
  }
}

//8.5. Form Validation Feedback System
//Notify form fields or error summary when validation state changes.
abstract class ValidationObserver {
  void onValidationChanged(bool isValid);
}

class FormValidator {
  bool _isValid = false;
  final List<ValidationObserver> _observers = [];

  void attach(ValidationObserver o) => _observers.add(o);

  void validate(String value) {
    _isValid = value.length >= 5;
    _notify();
  }

  void _notify() {
    for (var o in _observers) {
      o.onValidationChanged(_isValid);
    }
  }
}

class ErrorDisplay implements ValidationObserver {
  @override
  void onValidationChanged(bool isValid) {
    print(isValid ? "Form valid ✅" : "Form invalid ❌");
  }
}