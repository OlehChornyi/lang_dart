void main(List<String> args) {
  Dog().makeSound(); 
  //--------------
  var car = Car();
  car.start();
  car.stop();
  //-------------
  var r = Rectangle(4, 5);
  print(r.area());      
  print(r.perimeter());
  //-------------
  PaymentProcessor pp = PaypalPayment();
  pp.pay(50.0);
  //-------------
  Bird bird1 = Eagle();
  Bird bird2 = Parrot();
  bird1.fly();
  bird2.fly();
}

//Below are 10 Dart exercises that focus specifically 
//on the abstraction principle in Object-Oriented 
//Programming (OOP) — using abstract classes, interfaces, 
//and designing clear contracts without exposing internal implementation.

//1. Abstract Class with One Method
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  @override
  void makeSound() => print("Woof!");
}

//2. Abstract Class with Multiple Methods
abstract class Vehicle {
  void start();
  void stop();
}

class Car extends Vehicle {
  @override
  void start() => print("Car started");

  @override
  void stop() => print("Car stopped");
}

//3. Shape Interface with Area & Perimeter
abstract class Shape {
  double area();
  double perimeter();
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;

  @override
  double perimeter() => 2 * (width + height);
}

//4. Abstract Payment Processor
//Design a base PaymentProcessor with a pay() method.
abstract class PaymentProcessor {
  void pay(double amount);
}

class PaypalPayment extends PaymentProcessor {
  @override
  void pay(double amount) {
    print("Paying \$${amount.toStringAsFixed(2)} via PayPal.");
  }
}

//5. Multiple Classes Implementing Same Abstract Base
abstract class Bird {
  void fly();
}

class Eagle extends Bird {
  @override
  void fly() => print("Eagle soars high");
}

class Parrot extends Bird {
  @override
  void fly() => print("Parrot flaps fast");
}