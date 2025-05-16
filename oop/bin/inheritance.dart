void main(List<String> args) {
  var student = Student("Alice");
  student.describe();
  //-----------------
  var cat = Cat();
  cat.makeSound();
  //----------------
  var laptop = Laptop();
  laptop.turnOn();
  laptop.boot();
  laptop.charge();
  //---------------
  var car = Car();
  car.move();
  //----------------
  List<Shape> shapes = [Circle(), Square()];
  for (var shape in shapes) {
    shape.draw();
  }
}

//Below are 5 Dart exercises that focus specifically on the 
//Inheritance principle in Object-Oriented Programming (OOP) — 
//using extends, method overriding, constructor chaining, and polymorphism.

//1. Basic Inheritance and Method Override
//Create a Person class and a Student class that extends it, overriding a method.
class Person {
  String name;
  Person(this.name);

  void describe() {
    print("I am a person named $name");
  }
}

class Student extends Person {
  Student(String name) : super(name);

  @override
  void describe() {
    print("I am a student named $name");
  }
}

//2. Inheritance with Superclass Constructor
//Make an Animal class with a sound property, and a Cat subclass.
class Animal {
  String sound;

  Animal(this.sound);

  void makeSound() {
    print("Animal sound: $sound");
  }
}

class Cat extends Animal {
  Cat() : super("Meow");
}

//3. Multilevel Inheritance
//Use three levels of inheritance: Device → Computer → Laptop.
class Device {
  void turnOn() => print("Device is on");
}

class Computer extends Device {
  void boot() => print("Computer is booting");
}

class Laptop extends Computer {
  void charge() => print("Laptop is charging");
}

//4. Method Overriding with Super Call
//Override a method in the child class but still use the parent method.
class Vehicle {
  void move() => print("Vehicle is moving");
}

class Car extends Vehicle {
  @override
  void move() {
    super.move();
    print("Car is moving on road");
  }
}

//----------------
//5.Polymorphism with Inherited Classes
//Use a parent class reference to call overridden methods.
class Shape {
  void draw() => print("Drawing a shape");
}

class Circle extends Shape {
  @override
  void draw() => print("Drawing a circle");
}

class Square extends Shape {
  @override
  void draw() => print("Drawing a square");
}