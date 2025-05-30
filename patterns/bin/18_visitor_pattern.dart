void main(List<String> args) {
  var root = Directory("root");
  root.add(File("file1.txt", 100));
  root.add(File("file2.txt", 200));
  var subDir = Directory("sub");
  subDir.add(File("file3.txt", 300));
  root.add(subDir);

  var sizeVisitor = SizeVisitor();
  root.accept(sizeVisitor);
  print("Total size: ${sizeVisitor.totalSize}");

  var nameVisitor = NameVisitor();
  root.accept(nameVisitor);
  print("All names: ${nameVisitor.names}");
  //--------------
  var cart = [
    Book("Dart Guide", 50),
    Fruit("Apple", 2, 3),
  ];

  var taxVisitor = TaxVisitor();
  for (var item in cart) {
    item.accept(taxVisitor);
  }

  print("Total tax: ${taxVisitor.totalTax}");
  //--------------
  List<Animal> animals = [Dog(), Cat()];
  var visitor = SoundVisitor();

  for (var animal in animals) {
    animal.accept(visitor);
  }
  //--------------
  var shapes = [Circle(5), Rectangle(10, 20)];
  var drawer = DrawingVisitor();

  for (var shape in shapes) {
    shape.accept(drawer);
  }
  //--------------
  var items = [Car(20000), House(150)];
  var calculator = PremiumCalculator();

  for (var item in items) {
    item.accept(calculator);
  }

  print("Total premium: ${calculator.totalPremium}");
}

//The Visitor Pattern lets you add new operations to existing object 
//structures without modifying their classes. It separates algorithms 
//from the objects on which they operate.

//18.1. File System Visitor
//Traverse a file system with different visitors for size and name collection.
abstract class FileSystemNode {
  void accept(Visitor visitor);
}

class File implements FileSystemNode {
  final String name;
  final int size;

  File(this.name, this.size);

  @override
  void accept(Visitor visitor) {
    visitor.visitFile(this);
  }
}

class Directory implements FileSystemNode {
  final String name;
  final List<FileSystemNode> children = [];

  Directory(this.name);

  void add(FileSystemNode node) => children.add(node);

  @override
  void accept(Visitor visitor) {
    visitor.visitDirectory(this);
    for (var child in children) {
      child.accept(visitor);
    }
  }
}

abstract class Visitor {
  void visitFile(File file);
  void visitDirectory(Directory directory);
}

class SizeVisitor implements Visitor {
  int totalSize = 0;

  @override
  void visitFile(File file) {
    totalSize += file.size;
  }

  @override
  void visitDirectory(Directory directory) {}
}

class NameVisitor implements Visitor {
  List<String> names = [];

  @override
  void visitFile(File file) {
    names.add(file.name);
  }

  @override
  void visitDirectory(Directory directory) {
    names.add(directory.name);
  }
}

//18.2. Shopping Cart with Tax and Discount Visitors
abstract class Item {
  void accept(CartVisitor visitor);
  double? price;
}

class Book extends Item {
  final String title;
  @override
  double? price;

  Book(this.title, this.price);

  @override
  void accept(CartVisitor visitor) => visitor.visitBook(this);
}

class Fruit extends Item {
  final String name;
  final double weight;
  @override
  double? price;

  Fruit(this.name, this.weight, this.price);

  @override
  void accept(CartVisitor visitor) => visitor.visitFruit(this);
}

abstract class CartVisitor {
  void visitBook(Book book);
  void visitFruit(Fruit fruit);
}

class TaxVisitor implements CartVisitor {
  double totalTax = 0;

  @override
  void visitBook(Book book) {
    totalTax += book.price! * 0.1;
  }

  @override
  void visitFruit(Fruit fruit) {
    totalTax += fruit.price! * fruit.weight * 0.05;
  }
}

//18.3. Animal Sound Simulation
abstract class Animal {
  void accept(AnimalVisitor visitor);
}

class Dog extends Animal {
  @override
  void accept(AnimalVisitor visitor) => visitor.visitDog(this);
}

class Cat extends Animal {
  @override
  void accept(AnimalVisitor visitor) => visitor.visitCat(this);
}

abstract class AnimalVisitor {
  void visitDog(Dog dog);
  void visitCat(Cat cat);
}

class SoundVisitor implements AnimalVisitor {
  @override
  void visitDog(Dog dog) => print("Dog says: Woof!");

  @override
  void visitCat(Cat cat) => print("Cat says: Meow!");
}

//18.4. Drawing Different Shapes
abstract class Shape {
  void accept(ShapeVisitor visitor);
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  void accept(ShapeVisitor visitor) => visitor.visitCircle(this);
}

class Rectangle extends Shape {
  final double width, height;

  Rectangle(this.width, this.height);

  @override
  void accept(ShapeVisitor visitor) => visitor.visitRectangle(this);
}

abstract class ShapeVisitor {
  void visitCircle(Circle circle);
  void visitRectangle(Rectangle rectangle);
}

class DrawingVisitor implements ShapeVisitor {
  @override
  void visitCircle(Circle circle) {
    print("Drawing Circle with radius ${circle.radius}");
  }

  @override
  void visitRectangle(Rectangle rectangle) {
    print("Drawing Rectangle ${rectangle.width}x${rectangle.height}");
  }
}

//18.5. Insurance Premium Calculator
abstract class InsuredItem {
  void accept(PremiumVisitor visitor);
}

class Car extends InsuredItem {
  final double value;

  Car(this.value);

  @override
  void accept(PremiumVisitor visitor) => visitor.visitCar(this);
}

class House extends InsuredItem {
  final double area;

  House(this.area);

  @override
  void accept(PremiumVisitor visitor) => visitor.visitHouse(this);
}

abstract class PremiumVisitor {
  void visitCar(Car car);
  void visitHouse(House house);
}

class PremiumCalculator implements PremiumVisitor {
  double totalPremium = 0;

  @override
  void visitCar(Car car) {
    totalPremium += car.value * 0.02;
  }

  @override
  void visitHouse(House house) {
    totalPremium += house.area * 1.5;
  }
}