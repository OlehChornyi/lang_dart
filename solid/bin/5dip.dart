void main(List<String> args) {
  final manager = NotificationManager(EmailService());
  manager.notify("Welcome!");
  //-----------------
  Checkout(StripeProcessor()).completePayment(99.99);
  //-----------------
  final service = UserService(ConsoleLogger());
  service.createUser("Alice");
  //-----------------
  final repo = Repository(ApiSource());
  repo.displayData();
  //-----------------
  final monitor = Monitor(TemperatureSensor());
  monitor.display();
}

//Dependency Inversion Principle (DIP)
//High-level modules should not depend on low-level modules.
//Both should depend on abstractions (e.g., interfaces).
//Abstractions should not depend on details; 
//details should depend on abstractions.
//In Dart, this often means injecting dependencies via interfaces, 
//abstract classes, or constructors.

//1. Basic Message Service with Abstraction
// Abstraction
abstract class MessageService {
  void send(String message);
}

// Low-level module
class EmailService implements MessageService {
  @override
  void send(String message) => print("Email sent: $message");
}

// High-level module
class NotificationManager {
  final MessageService service;

  NotificationManager(this.service);

  void notify(String message) {
    service.send(message);
  }
}

//High-level NotificationManager doesn't depend on EmailService directly.

//2. Payment System Using DIP
abstract class PaymentProcessor {
  void process(double amount);
}

class StripeProcessor implements PaymentProcessor {
  @override
  void process(double amount) => print("Processed \$${amount} with Stripe");
}

class Checkout {
  final PaymentProcessor processor;

  Checkout(this.processor);

  void completePayment(double amount) {
    processor.process(amount);
  }
}

//Easily switch to PayPalProcessor or another without changing Checkout.

//3. Logger Injection via Abstraction
abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) => print("LOG: $message");
}

class UserService {
  final Logger logger;

  UserService(this.logger);

  void createUser(String name) {
    logger.log("User $name created");
  }
}

//Swap in FileLogger, DBLogger, etc., without modifying UserService.

//4. Data Access Layer Abstraction
abstract class DataSource {
  String fetchData();
}

class ApiSource implements DataSource {
  @override
  String fetchData() => "Data from API";
}

class Repository {
  final DataSource source;

  Repository(this.source);

  void displayData() {
    print(source.fetchData());
  }
}

//Repository depends only on abstraction DataSource.

//5. Real-Time Monitoring Using Abstraction
abstract class Sensor {
  double readValue();
}

class TemperatureSensor implements Sensor {
  @override
  double readValue() => 22.5;
}

class Monitor {
  final Sensor sensor;

  Monitor(this.sensor);

  void display() {
    print("Sensor value: ${sensor.readValue()} °C");
  }
}