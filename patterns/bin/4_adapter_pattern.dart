void main(List<String> args) {
  final printer = PrinterAdapter(OldPrinter());
  printer.printNew("Using adapter");
  //-------------------
  MediaPlayer player = MediaAdapter();
  player.play("video.mp4");      
  player.play("audio.wav"); 
  //-------------------
  var celsius = CelsiusTemperature(25);
  var adapter = TemperatureAdapter(celsius);

  print("Fahrenheit: ${adapter.getFahrenheit()}");
  //-------------------
  var usb = USB();
  TypeC adapter1= USBToTypeCAdapter(usb);

  adapter1.connectTypeC();
  //-------------------
  var legacyGateway = LegacyPaymentGateway();
  PaymentProcessor processor = PaymentAdapter(legacyGateway);

  processor.pay(150.0);
}

//4. Adapter Pattern
//Convert the interface of a class into another interface clients expect.

class OldPrinter {
  void printDocument(String text) => print("Old: $text");
}

abstract class NewPrinter {
  void printNew(String text);
}

class PrinterAdapter implements NewPrinter {
  final OldPrinter oldPrinter;

  PrinterAdapter(this.oldPrinter);

  @override
  void printNew(String text) => oldPrinter.printDocument(text);
}

//Converts the interface of a class into another interface 
//that clients expect.
//It allows incompatible interfaces to work together.

//4.2. Media Player Adapter
//Adapt a third-party audio player to work with a standard interface.
// Target interface
abstract class MediaPlayer {
  void play(String filename);
}

// Adaptee class (incompatible interface)
class AdvancedMediaPlayer {
  void playMp4(String filename) {
    print("Playing MP4 file: $filename");
  }
}

// Adapter
class MediaAdapter implements MediaPlayer {
  final AdvancedMediaPlayer _advancedPlayer = AdvancedMediaPlayer();

  @override
  void play(String filename) {
    if (filename.endsWith(".mp4")) {
      _advancedPlayer.playMp4(filename);
    } else {
      print("Format not supported");
    }
  }
}

//4.3. Temperature Unit Adapter
//Convert a Celsius temperature class to be compatible 
//with a Fahrenheit-based system.
// Target interface
abstract class FahrenheitTemperature {
  double getFahrenheit();
}

// Adaptee class
class CelsiusTemperature {
  final double celsius;

  CelsiusTemperature(this.celsius);

  double getCelsius() => celsius;
}

// Adapter
class TemperatureAdapter implements FahrenheitTemperature {
  final CelsiusTemperature _celsiusTemp;

  TemperatureAdapter(this._celsiusTemp);

  @override
  double getFahrenheit() => _celsiusTemp.getCelsius() * 9 / 5 + 32;
}

//4.4.USB to Type-C Adapter
//Adapt a USB device to a Type-C interface.
// Target interface
abstract class TypeC {
  void connectTypeC();
}

// Adaptee
class USB {
  void connectUSB() => print("Connected via USB");
}

// Adapter
class USBToTypeCAdapter implements TypeC {
  final USB usb;

  USBToTypeCAdapter(this.usb);

  @override
  void connectTypeC() {
    print("Using Adapter:");
    usb.connectUSB();
  }
}

//4.5. Legacy Payment Gateway Adapter
//Adapt a legacy payment processor to a new payment interface.
// Target interface
abstract class PaymentProcessor {
  void pay(double amount);
}

// Adaptee
class LegacyPaymentGateway {
  void makePayment(double amount) {
    print("Paid \$${amount} using legacy system");
  }
}

// Adapter
class PaymentAdapter implements PaymentProcessor {
  final LegacyPaymentGateway legacy;

  PaymentAdapter(this.legacy);

  @override
  void pay(double amount) {
    legacy.makePayment(amount);
  }
}