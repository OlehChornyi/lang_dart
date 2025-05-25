void main(List<String> args) {
  final checkout = Checkout(PayPalPayment());
  checkout.processPayment(100.0);
  //-----------------
   var context = SortContext(AscendingSort());
  print(context.sort([4, 2, 7, 1]));

  context.strategy = DescendingSort();
  print(context.sort([4, 2, 7, 1]));
  //-----------------
  var compressor = FileCompressor(ZipCompression());
  compressor.compressFile("data.txt"); 

  compressor.strategy = RarCompression();
  compressor.compressFile("data.txt");
  //-----------------
  var nav = Navigator(CarRoute());
  nav.navigate("Home", "Office");

  nav.strategy = BikeRoute();
  nav.navigate("Home", "Gym"); 
  //-----------------
  var editor = TextEditor(UpperCaseFormatter());
  editor.printFormatted("hello strategy pattern");

  editor.formatter = CapitalizeFormatter();
  editor.printFormatted("hello strategy pattern");
}

//5. Strategy Pattern
//Goal: Select behavior at runtime.
abstract class PaymentStrategy {
  void pay(double amount);
}

class CreditCardPayment implements PaymentStrategy {
  @override
  void pay(double amount) => print("Paid \$${amount} via Credit Card");
}

class PayPalPayment implements PaymentStrategy {
  @override
  void pay(double amount) => print("Paid \$${amount} via PayPal");
}

class Checkout {
  PaymentStrategy strategy;

  Checkout(this.strategy);

  void processPayment(double amount) {
    strategy.pay(amount);
  }
}

//Defines a family of algorithms, encapsulates each one, 
//and makes them interchangeable at runtime.
//It lets the algorithm vary independently from clients that use it.

//5.2. Sorting Strategy
//Switch between different sorting algorithms.
// Strategy
abstract class SortStrategy {
  List<int> sort(List<int> data);
}

// Concrete strategies
class AscendingSort implements SortStrategy {
  @override
  List<int> sort(List<int> data) {
    data.sort();
    return data;
  }
}

class DescendingSort implements SortStrategy {
  @override
  List<int> sort(List<int> data) {
    data.sort((a, b) => b.compareTo(a));
    return data;
  }
}

// Context
class SortContext {
  SortStrategy strategy;

  SortContext(this.strategy);

  List<int> sort(List<int> data) {
    return strategy.sort(List.from(data)); // clone to avoid mutation
  }
}

//5.3. Compression Strategy
//Use different compression formats (ZIP, RAR).
// Strategy interface
abstract class CompressionStrategy {
  void compress(String fileName);
}

// Concrete strategies
class ZipCompression implements CompressionStrategy {
  @override
  void compress(String fileName) {
    print("Compressing $fileName using ZIP");
  }
}

class RarCompression implements CompressionStrategy {
  @override
  void compress(String fileName) {
    print("Compressing $fileName using RAR");
  }
}

// Context
class FileCompressor {
  CompressionStrategy strategy;

  FileCompressor(this.strategy);

  void compressFile(String fileName) {
    strategy.compress(fileName);
  }
}

//5.4. Travel Route Strategy
//Calculate route using different strategies (car, bike, walking).
// Strategy interface
abstract class RouteStrategy {
  void buildRoute(String start, String end);
}

// Concrete strategies
class CarRoute implements RouteStrategy {
  @override
  void buildRoute(String start, String end) {
    print("Driving from $start to $end");
  }
}

class BikeRoute implements RouteStrategy {
  @override
  void buildRoute(String start, String end) {
    print("Cycling from $start to $end");
  }
}

// Context
class Navigator {
  RouteStrategy strategy;

  Navigator(this.strategy);

  void navigate(String start, String end) {
    strategy.buildRoute(start, end);
  }
}

//5.5. Text Formatter Strategy
//Format text using different styles (uppercase, lowercase, capitalized).
// Strategy interface
abstract class TextFormatter {
  String format(String text);
}

// Concrete strategies
class UpperCaseFormatter implements TextFormatter {
  @override
  String format(String text) => text.toUpperCase();
}

class LowerCaseFormatter implements TextFormatter {
  @override
  String format(String text) => text.toLowerCase();
}

class CapitalizeFormatter implements TextFormatter {
  @override
  String format(String text) =>
      text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
}

// Context
class TextEditor {
  TextFormatter formatter;

  TextEditor(this.formatter);

  void printFormatted(String text) {
    print(formatter.format(text));
  }
}