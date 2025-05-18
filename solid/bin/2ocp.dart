void main(List<String> args) {
  processPayment(CreditCardPayment(), 100);
  processPayment(PayPalPayment(), 200);
  //----------------
  var shapes = [Circle(), Rectangle()];
  renderShapes(shapes);
  //----------------
  notifyUser(EmailNotifier(), "Welcome!");
  notifyUser(SMSNotifier(), "Code: 1234");
  //----------------
  checkout(100, NoDiscount());
  checkout(100, PercentageDiscount());
  //----------------
  displayTax(USTax(), 100);
  displayTax(EUTax(), 100);
}

//1. Payment Method Extension (Without Modifying Existing Logic)
abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCardPayment implements PaymentMethod {
  @override
  void pay(double amount) => print("Paid \$${amount} using Credit Card");
}

class PayPalPayment implements PaymentMethod {
  @override
  void pay(double amount) => print("Paid \$${amount} using PayPal");
}

void processPayment(PaymentMethod method, double amount) {
  method.pay(amount);
}

//2. Shape Drawing with Polymorphism
abstract class Shape {
  void draw();
}

class Circle implements Shape {
  @override
  void draw() => print("Drawing a Circle");
}

class Rectangle implements Shape {
  @override
  void draw() => print("Drawing a Rectangle");
}

void renderShapes(List<Shape> shapes) {
  for (var shape in shapes) {
    shape.draw();
  }
}

//Open for extension: Add new shapes (e.g., Triangle)
//Closed for modification: No need to change renderShapes

//3. Notification System (Extensible via Interface)
abstract class Notifier {
  void send(String message);
}

class EmailNotifier implements Notifier {
  @override
  void send(String message) => print("Email: $message");
}

class SMSNotifier implements Notifier {
  @override
  void send(String message) => print("SMS: $message");
}

void notifyUser(Notifier notifier, String message) {
  notifier.send(message);
}

//4. Discount Calculation Strategy
abstract class DiscountStrategy {
  double applyDiscount(double amount);
}

class NoDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double amount) => amount;
}

class PercentageDiscount implements DiscountStrategy {
  @override
  double applyDiscount(double amount) => amount * 0.9;
}

void checkout(double price, DiscountStrategy strategy) {
  print("Final price: \$${strategy.applyDiscount(price)}");
}

//5. Tax Calculation for Different Countries
abstract class TaxCalculator {
  double calculate(double amount);
}

class USTax implements TaxCalculator {
  @override
  double calculate(double amount) => amount * 0.07;
}

class EUTax implements TaxCalculator {
  @override
  double calculate(double amount) => amount * 0.20;
}

void displayTax(TaxCalculator calculator, double amount) {
  print("Tax: \$${calculator.calculate(amount)}");
}