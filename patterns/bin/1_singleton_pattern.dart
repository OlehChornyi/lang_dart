void main(List<String> args) {
  var logger1 = Logger();
  var logger2 = Logger();
  logger1.log("Hello");
  print(logger1 == logger2); 
  //-----------------
  final config = ConfigManager();
  config.set("theme", "dark");

  final another = ConfigManager();
  print(another.get("theme"));
  //-----------------
  final gen1 = IDGenerator();
  final gen2 = IDGenerator();

  print(gen1.nextId());
  print(gen2.nextId());
  //-----------------
  final db1 = DatabaseConnection();
  final db2 = DatabaseConnection();

  db1.connect();
  print(db1 == db2);
  //-----------------
  final state1 = AppState();
  state1.increment();
  state1.increment();

  final state2 = AppState();
  print(state2.counter);
}

//1. Singleton Pattern
//Ensure a class has only one instance and provide a global access point.
class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  void log(String message) => print("Log: $message");
}

//2. Configuration Manager Singleton
//Store global configuration settings in a singleton.
class ConfigManager {
  static final ConfigManager _instance = ConfigManager._internal();

  factory ConfigManager() => _instance;

  ConfigManager._internal();

  Map<String, String> _settings = {};

  void set(String key, String value) => _settings[key] = value;
  String? get(String key) => _settings[key];
}

//3. Unique ID Generator Singleton
//Ensure unique IDs are generated globally.
class IDGenerator {
  static final IDGenerator _instance = IDGenerator._internal();

  factory IDGenerator() => _instance;

  IDGenerator._internal();

  int _counter = 0;

  int nextId() => ++_counter;
}

//4. Database Connection Singleton
class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  factory DatabaseConnection() => _instance;

  DatabaseConnection._internal();

  void connect() => print("Connected to DB");
}

//5. App State Singleton
//Manage global application state using a singleton class.
class AppState {
  static final AppState _instance = AppState._internal();

  factory AppState() => _instance;

  AppState._internal();

  int counter = 0;

  void increment() => counter++;
}