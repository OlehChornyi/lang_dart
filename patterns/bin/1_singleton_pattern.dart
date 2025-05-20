void main(List<String> args) {
  var logger1 = Logger();
  var logger2 = Logger();
  logger1.log("Hello");
  print(logger1 == logger2); 
}

//1. Singleton Pattern
//Ensure a class has only one instance and provide a global access point.
class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  void log(String message) => print("Log: $message");
}