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
  //-------------
  Logger logger = ConsoleLogger();
  logger.log("Saving...");
  //------------
  var dev = Developer("Alice");
  dev.work();
  //------------
  Plugin plugin = AudioPlugin();
  plugin.load();
  plugin.unload();
  //------------
  var processor = CSVProcessor();
  processor.run();
  //------------
  var repo = StringRepository();
  repo.add("Hello");
  repo.add("World");
  print(repo.getAll()); 

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

//6. Abstract Logger with Different Outputs
//Create a Logger interface with console and file implementations.
abstract class Logger {
  void log(String message);
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) => print("Console: $message");
}

class FileLogger implements Logger {
  @override
  void log(String message) => print("Writing '$message' to file");
}

//7. Abstract Class with Constructor Parameters
abstract class Employee {
  String name;
  Employee(this.name);

  void work();
}

class Developer extends Employee {
  Developer(String name) : super(name);

  @override
  void work() => print("$name writes code");
}

//8. Abstract Class as Plugin Contract
//Create a Plugin interface with load() and unload().
abstract class Plugin {
  void load();
  void unload();
}

class AudioPlugin extends Plugin {
  @override
  void load() => print("Audio plugin loaded");

  @override
  void unload() => print("Audio plugin unloaded");
}

//9. Abstract Class with Template Method
//Use a base class to define a sequence of steps.
abstract class DataProcessor {
  void loadData();
  void processData();

  void run() {
    loadData();
    processData();
  }
}

class CSVProcessor extends DataProcessor {
  @override
  void loadData() => print("Loading CSV data...");

  @override
  void processData() => print("Processing CSV data...");
}

//10. Abstract Repository Pattern
//Define a generic abstract repository for any data model.
abstract class Repository<T> {
  void add(T item);
  List<T> getAll();
}

class StringRepository extends Repository<String> {
  final _items = <String>[];

  @override
  void add(String item) => _items.add(item);

  @override
  List<String> getAll() => _items;
}

//When you use extends, you're creating a subclass that inherits:
//Concrete methods
//Fields
//Behavior (can reuse logic)
//Can override methods

//When you use implements, you're saying:

//"I promise to provide my own implementation of all members"
//You do not inherit implementation
//Used for interface-style abstraction