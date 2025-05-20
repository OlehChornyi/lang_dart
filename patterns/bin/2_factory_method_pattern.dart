void main(List<String> args) {
  final animal = AnimalFactory.createAnimal("dog");
  animal.speak();
}

//2. Factory Method Pattern
//Delegate the object creation to subclasses or methods.
abstract class Animal {
  void speak();
}

class Dog implements Animal {
  @override
  void speak() => print("Woof");
}

class Cat implements Animal {
  @override
  void speak() => print("Meow");
}

class AnimalFactory {
  static Animal createAnimal(String type) {
    if (type == "dog") return Dog();
    if (type == "cat") return Cat();
    throw Exception("Unknown animal type");
  }
}