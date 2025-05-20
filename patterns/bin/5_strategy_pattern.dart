void main(List<String> args) {
  final checkout = Checkout(PayPalPayment());
  checkout.processPayment(100.0);
}

//5. Strategy Pattern
//Goal: Select behavior at runtime.
abstract class PaymentStrategy {
  void pay(double amount);
}

class CreditCardPayment implements PaymentStrategy {
  @override
  void pay(double amount) => print("Paid \$${amount} via Credit Card");
}

class PayPalPayment implements PaymentStrategy {
  @override
  void pay(double amount) => print("Paid \$${amount} via PayPal");
}

class Checkout {
  PaymentStrategy strategy;

  Checkout(this.strategy);

  void processPayment(double amount) {
    strategy.pay(amount);
  }
}