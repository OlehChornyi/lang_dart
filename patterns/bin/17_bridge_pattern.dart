void main(List<String> args) {
  Shape circle1 = Circle(1, 2, 3, DrawingAPI1());
  Shape circle2 = Circle(5, 7, 9, DrawingAPI2());

  circle1.draw();
  circle2.draw();
  //-------------
  RemoteControl remote = BasicRemote(TV());
  remote.turnOn();
  remote.turnOff();

  remote = BasicRemote(Radio());
  remote.turnOn();
  remote.turnOff();
  //-------------
  Document report = Report("Annual Report", PDFPrinter());
  report.printDoc();

  report = Report("Weekly Summary", LaserPrinter());
  report.printDoc();
  //-------------
  Message urgentEmail = UrgentMessage(EmailSender());
  urgentEmail.send("System down");

  Message urgentSMS = UrgentMessage(SMSSender());
  urgentSMS.send("Security breach");
  //-------------
  Notifier notifier = AlertNotifier(WebNotifier());
  notifier.notify("Session expired");

  notifier = AlertNotifier(MobileNotifier());
  notifier.notify("Battery low");
}

//The Bridge Pattern decouples an abstraction from its implementation 
//so the two can vary independently. This helps avoid a "combinatorial 
//explosion" of classes when you have multiple dimensions of change 
//(e.g., different shapes AND different rendering methods).

//17.1. Drawing Shapes with Different APIs
//Use a bridge between Shape and DrawingAPI.
abstract class DrawingAPI {
  void drawCircle(double x, double y, double radius);
}

class DrawingAPI1 implements DrawingAPI {
  @override
  void drawCircle(double x, double y, double radius) {
    print("API1: Drawing Circle at ($x, $y) with radius $radius");
  }
}

class DrawingAPI2 implements DrawingAPI {
  @override
  void drawCircle(double x, double y, double radius) {
    print("API2: Drawing Circle at ($x, $y) with radius $radius");
  }
}

abstract class Shape {
  void draw();
}

class Circle extends Shape {
  final double x, y, radius;
  final DrawingAPI drawingAPI;

  Circle(this.x, this.y, this.radius, this.drawingAPI);

  @override
  void draw() => drawingAPI.drawCircle(x, y, radius);
}

//17.2. Remote Control and Devices
//Create a remote that controls different devices.
abstract class Device {
  void turnOn();
  void turnOff();
}

class TV implements Device {
  @override
  void turnOn() => print("TV is ON");

  @override
  void turnOff() => print("TV is OFF");
}

class Radio implements Device {
  @override
  void turnOn() => print("Radio is ON");

  @override
  void turnOff() => print("Radio is OFF");
}

abstract class RemoteControl {
  final Device device;

  RemoteControl(this.device);

  void turnOn();
  void turnOff();
}

class BasicRemote extends RemoteControl {
  BasicRemote(Device device) : super(device);

  @override
  void turnOn() => device.turnOn();

  @override
  void turnOff() => device.turnOff();
}

//17.3. Different Printers for Different Formats
//Separate document abstraction from printing strategy.
abstract class Printer {
  void printText(String text);
}

class PDFPrinter implements Printer {
  @override
  void printText(String text) => print("PDF Printer: $text");
}

class LaserPrinter implements Printer {
  @override
  void printText(String text) => print("Laser Printer: $text");
}

abstract class Document {
  final Printer printer;

  Document(this.printer);

  void printDoc();
}

class Report extends Document {
  final String content;

  Report(this.content, Printer printer) : super(printer);

  @override
  void printDoc() => printer.printText(content);
}

//17.4. Messaging System (Email/SMS)
//Send messages using different channels without changing 
//the Message abstraction.
abstract class MessageSender {
  void sendMessage(String message);
}

class EmailSender implements MessageSender {
  @override
  void sendMessage(String message) => print("Email: $message");
}

class SMSSender implements MessageSender {
  @override
  void sendMessage(String message) => print("SMS: $message");
}

abstract class Message {
  final MessageSender sender;

  Message(this.sender);

  void send(String content);
}

class UrgentMessage extends Message {
  UrgentMessage(MessageSender sender) : super(sender);

  @override
  void send(String content) => sender.sendMessage("URGENT: $content");
}

//17.5. Notifications on Multiple Platforms
//Notify users using different UI platforms.
abstract class NotifierPlatform {
  void notifyUser(String message);
}

class WebNotifier implements NotifierPlatform {
  @override
  void notifyUser(String message) => print("Web: $message");
}

class MobileNotifier implements NotifierPlatform {
  @override
  void notifyUser(String message) => print("Mobile: $message");
}

abstract class Notifier {
  final NotifierPlatform platform;

  Notifier(this.platform);

  void notify(String message);
}

class AlertNotifier extends Notifier {
  AlertNotifier(NotifierPlatform platform) : super(platform);

  @override
  void notify(String message) => platform.notifyUser("ALERT: $message");
}