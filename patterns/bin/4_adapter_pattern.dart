void main(List<String> args) {
  final printer = PrinterAdapter(OldPrinter());
  printer.printNew("Using adapter");
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