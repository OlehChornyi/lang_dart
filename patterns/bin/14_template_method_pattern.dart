void main(List<String> args) {
  DataParser parser = CSVParser();
  parser.parseData();

  print("---");

  parser = JSONParser();
  parser.parseData();
  //---------------------
  Recipe pasta = PastaRecipe();
  pasta.makeRecipe();

  print("---");

  Recipe pizza = PizzaRecipe();
  pizza.makeRecipe();
  //---------------------
  var sales = SalesReport();
  var inventory = InventoryReport();

  sales.generateReport();
  print("---");
  inventory.generateReport();
  //---------------------
  GameAI chess = ChessAI();
  chess.makeTurn();

  print("---");

  GameAI checkers = CheckersAI();
  checkers.makeTurn();
  //---------------------
  FileExporter exporter = PDFExporter();
  exporter.exportFile();

  print("---");

  exporter = WordExporter();
  exporter.exportFile();
}

//The Template Method Pattern defines the skeleton of an algorithm 
//in a method, deferring some steps to subclasses. This lets subclasses 
//redefine certain steps of an algorithm without changing its structure.

//14.1. Data Parser
//Define a parser that reads data from a source and formats it. 
//Subclasses handle specific formats (CSV, JSON).
abstract class DataParser {
  void parseData() {
    readData();
    processData();
    displayData();
  }

  void readData() {
    print("Reading data from file...");
  }

  void processData();
  void displayData();
}

class CSVParser extends DataParser {
  @override
  void processData() {
    print("Processing CSV data...");
  }

  @override
  void displayData() {
    print("Displaying CSV data in table format");
  }
}

class JSONParser extends DataParser {
  @override
  void processData() {
    print("Processing JSON data...");
  }

  @override
  void displayData() {
    print("Displaying JSON data in object format");
  }
}

//14.2. Cooking Recipe
//Create a general recipe class, and let subclasses implement 
//specific recipes like Pasta or Pizza.
abstract class Recipe {
  void makeRecipe() {
    gatherIngredients();
    cook();
    serve();
  }

  void gatherIngredients() {
    print("Gathering ingredients...");
  }

  void cook();
  void serve();
}

class PastaRecipe extends Recipe {
  @override
  void cook() {
    print("Boiling pasta and adding sauce.");
  }

  @override
  void serve() {
    print("Serving pasta with parmesan.");
  }
}

class PizzaRecipe extends Recipe {
  @override
  void cook() {
    print("Baking pizza in oven.");
  }

  @override
  void serve() {
    print("Serving pizza sliced.");
  }
}

//14.3. Report Generator
//Define a report generation structure. 
//Subclasses will customize the data and format.
abstract class ReportGenerator {
  void generateReport() {
    fetchData();
    formatData();
    printReport();
  }

  void fetchData() {
    print("Fetching data from database...");
  }

  void formatData();
  void printReport();
}

class SalesReport extends ReportGenerator {
  @override
  void formatData() {
    print("Formatting sales data...");
  }

  @override
  void printReport() {
    print("Printing Sales Report");
  }
}

class InventoryReport extends ReportGenerator {
  @override
  void formatData() {
    print("Formatting inventory data...");
  }

  @override
  void printReport() {
    print("Printing Inventory Report");
  }
}

//14.4. Game AI Template
//Create an abstract game AI class. Subclasses implement game-specific 
//logic (e.g., ChessAI, CheckersAI).
abstract class GameAI {
  void makeTurn() {
    collectResources();
    buildStructures();
    attack();
  }

  void collectResources() {
    print("Collecting resources...");
  }

  void buildStructures();
  void attack();
}

class ChessAI extends GameAI {
  @override
  void buildStructures() {
    print("Placing chess pieces.");
  }

  @override
  void attack() {
    print("Moving chess piece.");
  }
}

class CheckersAI extends GameAI {
  @override
  void buildStructures() {
    print("Setting up checkers board.");
  }

  @override
  void attack() {
    print("Jumping over opponent.");
  }
}

//14.5. File Exporter
//Create a file exporter where the base defines the steps, 
//and each format has its own implementation.
abstract class FileExporter {
  void exportFile() {
    openFile();
    writeData();
    closeFile();
  }

  void openFile() {
    print("Opening file...");
  }

  void writeData();
  void closeFile() {
    print("Closing file...");
  }
}

class PDFExporter extends FileExporter {
  @override
  void writeData() {
    print("Writing data in PDF format...");
  }
}

class WordExporter extends FileExporter {
  @override
  void writeData() {
    print("Writing data in Word format...");
  }
}

