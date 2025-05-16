void main(List<String> args) {
  Animal animal = Dog();
  animal.speak();
  //--------------
  List<Shape> shapes = [Circle(), Square()];
  for (var shape in shapes) {
    shape.draw();
  }
  //--------------
  Vehicle v = Bike();
  v.start();
  //---------------
  Logger logger = ConsoleLogger();
  logger.log("Logging data");

  logger = FileLogger();
  logger.log("Saving to file");
  //---------------
  printAnything(LaserPrinter());
  //--------------
  Employee e;

  e = Manager();
  e.doWork();

  e = Developer();
  e.doWork();
  //--------------
  List<Notification> methods = [Email(), SMS()];
  for (var method in methods) {
    method.send("Welcome!");
  }
  //--------------
  Discount discount = PercentageDiscount();
  print(discount.apply(100));
  //--------------
  Message m = Alert();
  m.show();
  //---------------
  var t = getTransport('plane');
  t.travel();
}

//Below are 10 Dart exercises focused on the Polymorphism principle 
//in Object-Oriented Programming (OOP). These exercises demonstrate 
//method overriding, dynamic dispatch, subtype polymorphism, 
//and runtime behavior of polymorphic objects.

//1. Basic Method Overriding (Runtime Polymorphism)
class Animal {
  void speak() => print("Animal speaks");
}

class Dog extends Animal {
  @override
  void speak() => print("Dog barks");
}

//2. Polymorphic List of Objects
class Shape {
  void draw() => print("Drawing shape");
}

class Circle extends Shape {
  @override
  void draw() => print("Drawing circle");
}

class Square extends Shape {
  @override
  void draw() => print("Drawing square");
}

//3. Polymorphism with Superclass Reference
class Vehicle {
  void start() => print("Vehicle starting");
}

class Bike extends Vehicle {
  @override
  void start() => print("Bike starting");
}

//4. Interface-based Polymorphism
abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) => print("Console: $message");
}

class FileLogger implements Logger {
  @override
  void log(String message) => print("File: $message");
}

//5. Function That Accepts Superclass Parameter
class Printer {
  void printData() => print("Printing from printer");
}

class LaserPrinter extends Printer {
  @override
  void printData() => print("Laser printer printing...");
}

void printAnything(Printer printer) {
  printer.printData();
}

//6. Runtime Decision on Object Type
abstract class Employee {
  void doWork();
}

class Manager extends Employee {
  @override
  void doWork() => print("Managing tasks");
}

class Developer extends Employee {
  @override
  void doWork() => print("Writing code");
}

//7. Polymorphism with Abstract Class and Real Use Case
abstract class Notification {
  void send(String message);
}

class Email extends Notification {
  @override
  void send(String message) => print("Sending Email: $message");
}

class SMS extends Notification {
  @override
  void send(String message) => print("Sending SMS: $message");
}

//8. Using Polymorphism for Extensibility
abstract class Discount {
  double apply(double amount);
}

class NoDiscount extends Discount {
  @override
  double apply(double amount) => amount;
}

class PercentageDiscount extends Discount {
  @override
  double apply(double amount) => amount * 0.9;
}

//9. Late Binding with Polymorphism
class Message {
  void show() => print("Generic message");
}

class Alert extends Message {
  @override
  void show() => print("This is an alert!");
}

//10. Combining Polymorphism with Factory Pattern
abstract class Transport {
  void travel();
}

class Car extends Transport {
  @override
  void travel() => print("Traveling by car");
}

class Plane extends Transport {
  @override
  void travel() => print("Flying on plane");
}

Transport getTransport(String type) {
  if (type == 'car') return Car();
  if (type == 'plane') return Plane();
  throw Exception("Unknown transport");
}
