void main(List<String> args) {
  final animal = AnimalFactory.createAnimal("dog");
  animal.speak();
  //---------------------
  final shape = ShapeFactory.createShape("circle");
  shape.draw(); 
  //---------------------
  var doc = DocumentFactory.createDocument("pdf");
  doc.open(); 
  //---------------------
  var notification = NotificationFactory.create("sms");
  notification.send("Hello!");
  //---------------------
  var payment = PaymentFactory.getPayment("paypal");
  payment.process(75.0);
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

//2.2. Shape Factory
//Use a factory method to create different types of shapes.
abstract class Shape {
  void draw();
}

class Circle implements Shape {
  @override
  void draw() => print("Drawing a Circle");
}

class Square implements Shape {
  @override
  void draw() => print("Drawing a Square");
}

class ShapeFactory {
  static Shape createShape(String type) {
    if (type == "circle") return Circle();
    if (type == "square") return Square();
    throw Exception("Unknown shape type");
  }
}

//2.3. Document Factory
//Create different types of documents using a factory.
abstract class Document {
  void open();
}

class WordDocument implements Document {
  @override
  void open() => print("Opening Word document");
}

class PdfDocument implements Document {
  @override
  void open() => print("Opening PDF document");
}

class DocumentFactory {
  static Document createDocument(String type) {
    switch (type) {
      case 'word':
        return WordDocument();
      case 'pdf':
        return PdfDocument();
      default:
        throw Exception("Unknown document type");
    }
  }
}

//2.4. Notification Factory
//Create a factory for different notification methods.
abstract class Notification {
  void send(String message);
}

class EmailNotification implements Notification {
  @override
  void send(String message) => print("Email: $message");
}

class SmsNotification implements Notification {
  @override
  void send(String message) => print("SMS: $message");
}

class NotificationFactory {
  static Notification create(String channel) {
    return channel == 'email'
        ? EmailNotification()
        : SmsNotification();
  }
}

//2.5. Payment Factory
//Create a factory for different payment processors.
abstract class Payment {
  void process(double amount);
}

class CreditCardPayment implements Payment {
  @override
  void process(double amount) =>
      print("Paid \$${amount} using Credit Card");
}

class PayPalPayment implements Payment {
  @override
  void process(double amount) =>
      print("Paid \$${amount} using PayPal");
}

class PaymentFactory {
  static Payment getPayment(String method) {
    if (method == "paypal") return PayPalPayment();
    return CreditCardPayment();
  }
}