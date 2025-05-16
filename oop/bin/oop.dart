void main(List<String> arguments) {
  print('Hello world of OOP!');
  var p = Person("Alice", 30);
  p.describe(); 
  //---------------
  var s = Student("Bob", 20, "A");
  s.describe();
  //---------------
  var p1 = Person1.anonymous();
  p1.describe(); 
  //--------------
  var acc = BankAccount();
  acc.balance = 100;
  print(acc.balance);
  //--------------
  var c = Circle(3);
  print(c.area().toStringAsFixed(2));

}

//1. Create a Person class with name and age, and a method to display info.
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void describe() {
    print("Name: $name, Age: $age");
  }
}

//2. Use Inheritance: Create a Student class
//Make Student inherit from Person and add a grade.
class Student extends Person {
  String grade;

  Student(String name, int age, this.grade) : super(name, age);

  @override
  void describe() {
    super.describe();
    print("Grade: $grade");
  }
}

//3. Named Constructors
//Add a named constructor to Person that initializes with default values.
class Person1 {
  String name;
  int age;

  Person1(this.name, this.age);

  Person1.anonymous() : name = "Unknown", age = 0;

  void describe() => print("Name: $name, Age: $age");
}

//4. Getters and Setters
//Add getters/setters to control how a property is accessed.
class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  set balance(double amount) {
    if (amount >= 0) _balance = amount;
  }
}

//5. Abstract Class
//Define an abstract class Shape with a method area().
abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}