void main(List<String> args) async{
  ApiService service = LoggingApiDecorator(RealApiService());
  await service.fetchData();
  //------------------
  NotificationService service1 = SoundNotificationDecorator(
    BasicNotificationService(),
  );

  service1.notify("New message received");
  //------------------
  final loader = CacheDecorator(RealDataLoader());
  print(loader.loadData());
  print(loader.loadData());
  //------------------
  InputField field = TrimDecorator(LowerCaseDecorator(BasicInputField()));
  final input = "  HELLO Flutter  ";
  final result = field.process(input);

  print("Processed Input: '$result'");
}

//7.1. Logging Decorator for API Service
//Add logging to an API service without modifying its original code.
abstract class ApiService {
  Future<void> fetchData();
}

class RealApiService implements ApiService {
  @override
  Future<void> fetchData() async {
    print("Fetching data from API...");
    await Future.delayed(Duration(seconds: 1));
  }
}

class LoggingApiDecorator implements ApiService {
  final ApiService _inner;

  LoggingApiDecorator(this._inner);

  @override
  Future<void> fetchData() async {
    print("Log: Fetching started");
    await _inner.fetchData();
    print("Log: Fetching ended");
  }
}

//7.2. Notification Service with Sound Decorator
//Add sound to a notification without changing its core logic.
abstract class NotificationService {
  void notify(String message);
}

class BasicNotificationService implements NotificationService {
  @override
  void notify(String message) {
    print("Showing notification: $message");
  }
}

class SoundNotificationDecorator implements NotificationService {
  final NotificationService _inner;

  SoundNotificationDecorator(this._inner);

  @override
  void notify(String message) {
    print("Playing sound...");
    _inner.notify(message);
  }
}

//7.3. Caching Decorator for Data Loader
//Add caching functionality to a data loader class.
abstract class DataLoader {
  String loadData();
}

class RealDataLoader implements DataLoader {
  @override
  String loadData() {
    print("Loading data from source...");
    return "Live Data";
  }
}

class CacheDecorator implements DataLoader {
  final DataLoader _inner;
  String? _cache;

  CacheDecorator(this._inner);

  @override
  String loadData() {
    if (_cache == null) {
      _cache = _inner.loadData();
      print("Caching data...");
    } else {
      print("Returning cached data...");
    }
    return _cache!;
  }
}

//7.4. Input Validation Decorator for Form Field
//Add validation behavior dynamically to form field processing.
abstract class InputField {
  String process(String input);
}

class BasicInputField implements InputField {
  @override
  String process(String input) => input;
}

class TrimDecorator implements InputField {
  final InputField _field;

  TrimDecorator(this._field);

  @override
  String process(String input) {
    return _field.process(input.trim());
  }
}

class LowerCaseDecorator implements InputField {
  final InputField _field;

  LowerCaseDecorator(this._field);

  @override
  String process(String input) {
    return _field.process(input.toLowerCase());
  }
}