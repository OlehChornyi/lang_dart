void main(List<String> args) {
  makeBirdFly(Sparrow());
  makeBirdFly(Eagle());
  //-----------------
  birdInfo(Crow());
  birdInfo(Ostrich());
  flyBird(Crow());
  // flyBird(Ostrich()); Error: Ostrich doesn’t implement FlyingBird
  //-----------------
  checkout(CreditCard());
  checkout(Bitcoin());
  //-----------------
  notifyUser(EmailNotifier());
  notifyUser(SMSNotifier());
}

//If class S is a subtype of class T, then objects of type T should 
//be replaceable with objects of type S without altering the correctness 
//of the program.
//Subclasses must behave in such a way that they don’t violate the 
//expectations set by their base classes.

//1. Proper Inheritance with Bird Example
abstract class Bird1 {
  void fly();
}

class Sparrow extends Bird1 {
  @override
  void fly() => print("Sparrow is flying");
}

class Eagle extends Bird1 {
  @override
  void fly() => print("Eagle is flying");
}

void makeBirdFly(Bird1 bird) {
  bird.fly();
}

//Subclasses (Sparrow, Eagle) can be substituted for Bird with 
//correct behavior.

//2. Violation Example (Fixed by Separating Interface)
abstract class Bird {
  void makeSound();
}

abstract class FlyingBird extends Bird {
  void fly();
}

class Crow extends FlyingBird {
  @override
  void fly() => print("Crow is flying");

  @override
  void makeSound() => print("Caw!");
}

class Ostrich extends Bird {
  @override
  void makeSound() => print("Boom boom");
}

void birdInfo(Bird bird) {
  bird.makeSound();
}

void flyBird(FlyingBird bird) {
  bird.fly();
}

//3. Correct Substitution in Payment Processing
abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard implements PaymentMethod {
  @override
  void pay(double amount) => print("Paid \$${amount} with Credit Card");
}

class Bitcoin implements PaymentMethod {
  @override
  void pay(double amount) => print("Paid \$${amount} with Bitcoin");
}

void checkout(PaymentMethod method) {
  method.pay(50.0);
}

//Any PaymentMethod subclass can be used without breaking checkout.

//4. Rectangle and Square — LSP Violation & Fix
//Violation Example (Don't do this):
class Rectangle {
  int width = 0;
  int height = 0;

  void setWidth(int w) => width = w;
  void setHeight(int h) => height = h;

  int get area => width * height;
}

class Square extends Rectangle {
  @override
  void setWidth(int w) {
    width = height = w; // Violates user expectation
  }

  @override
  void setHeight(int h) {
    width = height = h;
  }
}

//Fix: Separate Class Without Inheritance
class Rectangle1 {
  int width = 0;
  int height = 0;

  void setWidth(int w) => width = w;
  void setHeight(int h) => height = h;

  int get area => width * height;
}

class Square1 {
  int size = 0;

  void setSize(int s) => size = s;
  int get area => size * size;
}

//Now Square doesn't inherit from Rectangle and LSP is respected.

//5. Valid Substitution with Notification Services
abstract class Notifier {
  void send(String message);
}

class EmailNotifier implements Notifier {
  @override
  void send(String message) => print("Sending Email: $message");
}

class SMSNotifier implements Notifier {
  @override
  void send(String message) => print("Sending SMS: $message");
}

void notifyUser(Notifier notifier) {
  notifier.send("Hello from Dart!");
}