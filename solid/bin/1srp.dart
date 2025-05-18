void main(List<String> args) {
  var user = User("Alice", "alice@example.com");
  var printer = UserPrinter();
  printer.printUser(user);
  //---------------
  var auth = AuthService();
  if (auth.login("admin", "1234")) {
    var manager = UserManager();
    manager.loadUserData();
  }
  //---------------
  var logger = Logger();
  var processor = PaymentProcessor(logger);
  processor.processPayment(99.99);
  //---------------
  var calc = Calculator();
  var display = Display();
  var total = calc.calculateTotal([10, 20, 30]);
  display.showTotal(total);
  //---------------
  var validator = UserValidator();
  var creator = UserCreator();

  var email = "test@example.com";
  if (validator.isValidEmail(email)) {
    creator.createUser(email);
  }
}

//SINGLE RESPONSIBILITY PRINCIPLE
//Below are 10 Dart exercises that demonstrate the Single
//Responsibility Principle (SRP) from the SOLID principles.
//Each class or method is designed to follow the rule that it
//should have only one reason to change—i.e., only one responsibility.

//1. Separate User Data from User Display
// Data model
class User {
  String name;
  String email;
  User(this.name, this.email);
}

// Responsibility: Display
class UserPrinter {
  void printUser(User user) {
    print("Name: ${user.name}, Email: ${user.email}");
  }
}

//2. Separate Authentication Logic from User Management
class AuthService {
  bool login(String username, String password) {
    return username == "admin" && password == "1234";
  }
}

class UserManager {
  void loadUserData() => print("User data loaded.");
}

//3. Keep Logging Separate from Business Logic
class Logger {
  void log(String message) => print("LOG: $message");
}

class PaymentProcessor {
  final Logger logger;
  PaymentProcessor(this.logger);

  void processPayment(double amount) {
    // business logic
    logger.log("Processed payment of \$$amount");
  }
}

//4. Split Calculation and Display
class Calculator {
  double calculateTotal(List<double> prices) {
    return prices.reduce((a, b) => a + b);
  }
}

class Display {
  void showTotal(double total) {
    print("Total: \$${total.toStringAsFixed(2)}");
  }
}

//5. Separate Input Validation from User Creation
class UserValidator {
  bool isValidEmail(String email) => email.contains("@");
}

class UserCreator {
  void createUser(String email) {
    print("User with email $email created.");
  }
}
