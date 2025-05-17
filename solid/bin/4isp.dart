void main(List<String> args) {
  HumanWorker().eat(); 
  RobotWorker().work();
  //--------------------
  AudioPlayer().playAudio();
  VideoPlayer()
    ..playAudio()
    ..playVideo();
  //--------------------
  AllInOnePrinter().scanDoc("Report");
  SimplePrinter().printDoc("Invoice");
  //--------------------
  VisaPayment().payWithCard();
  BitcoinPayment().payWithCrypto();
  //--------------------
  LightBulb().dim(50);
  Fan().turnOn();
}

//Clients should not be forced to depend on interfaces they do not use.
//This means creating smaller, more specific interfaces instead of large, 
//general-purpose ones.

//1. Split Fat Interface into Specific Ones
// Before (Violation of ISP)
abstract class Worker {
  void work();
  void eat();
}

// After (Correct per ISP)
abstract class Workable {
  void work();
}

abstract class Eatable {
  void eat();
}

class HumanWorker implements Workable, Eatable {
  @override
  void work() => print("Human is working");

  @override
  void eat() => print("Human is eating");
}

class RobotWorker implements Workable {
  @override
  void work() => print("Robot is working");
}

//2. Separate Interfaces for Media Players
abstract class AudioPlayable {
  void playAudio();
}

abstract class VideoPlayable {
  void playVideo();
}

class AudioPlayer implements AudioPlayable {
  @override
  void playAudio() => print("Playing audio...");
}

class VideoPlayer implements AudioPlayable, VideoPlayable {
  @override
  void playAudio() => print("Playing audio...");

  @override
  void playVideo() => print("Playing video...");
}

//Each class only implements interfaces it needs.

//3. Segregated Interfaces for Printer Functionality
abstract class Printable {
  void printDoc(String doc);
}

abstract class Scannable {
  void scanDoc(String doc);
}

class AllInOnePrinter implements Printable, Scannable {
  @override
  void printDoc(String doc) => print("Printing: $doc");

  @override
  void scanDoc(String doc) => print("Scanning: $doc");
}

class SimplePrinter implements Printable {
  @override
  void printDoc(String doc) => print("Printing: $doc");
}

//4. Clean Interface for Payment Gateways
abstract class CreditCardPayment {
  void payWithCard();
}

abstract class CryptoPayment {
  void payWithCrypto();
}

class VisaPayment implements CreditCardPayment {
  @override
  void payWithCard() => print("Paid with Visa");
}

class BitcoinPayment implements CryptoPayment {
  @override
  void payWithCrypto() => print("Paid with Bitcoin");
}

//Each class sticks to what it needs.

//5. ISP with Device Control Interfaces
abstract class Switchable {
  void turnOn();
  void turnOff();
}

abstract class Dimmable {
  void dim(int level);
}

class LightBulb implements Switchable, Dimmable {
  @override
  void turnOn() => print("Light is on");

  @override
  void turnOff() => print("Light is off");

  @override
  void dim(int level) => print("Dimmed to $level%");
}

class Fan implements Switchable {
  @override
  void turnOn() => print("Fan is on");

  @override
  void turnOff() => print("Fan is off");
}