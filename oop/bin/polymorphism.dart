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
