void main(List<String> args) {
  final remote = RemoteControl(LightOnCommand(Light()));
  remote.pressButton();
  //--------------------
  final doc = Document();
  final cmd1 = WriteCommand(doc, "Hello ");
  final cmd2 = WriteCommand(doc, "World!");

  cmd1.execute();
  cmd2.execute();
  doc.show();

  cmd2.undo();
  doc.show();
  //--------------------
  final stock = StockTrade();
  final buy = BuyStock(stock);
  final sell = SellStock(stock);

  final broker = Broker();
  broker.takeOrder(buy);
  broker.takeOrder(sell);

  broker.placeOrders();
  //---------------------
  final startupSequence = MacroCommand([
    StartServer(),
    LoadDatabase(),
    InitializeServices(),
  ]);

  startupSequence.execute();
  //---------------------
  final player = Player();
  final controller = GameController();

  controller.command = MoveCommand(player);
  controller.pressButton();

  controller.command = JumpCommand(player);
  controller.pressButton(); 

  controller.command = ShootCommand(player);
  controller.pressButton();
}

//8. Command Pattern
//Encapsulate a request as an object.
abstract class Command {
  void execute();
}

class Light {
  void turnOn() => print("Light is ON");
}

class LightOnCommand implements Command {
  final Light light;

  LightOnCommand(this.light);

  @override
  void execute() => light.turnOn();
}

class RemoteControl {
  Command command;

  RemoteControl(this.command);

  void pressButton() => command.execute();
}

//Encapsulates a request as an object, allowing you to parameterize 
//clients with queues, requests, or operations, and support 
//undoable operations.

//8.2. Text Editor Undo
//Simulate a text editor with undo functionality.
abstract class Command1 {
  void execute();
  void undo();
}

class Document {
  String text = '';

  void write(String word) {
    text += word;
  }

  void erase(String word) {
    text = text.replaceFirst(word, '');
  }

  void show() {
    print("Document: $text");
  }
}

class WriteCommand implements Command1 {
  final Document doc;
  final String word;

  WriteCommand(this.doc, this.word);

  @override
  void execute() {
    doc.write(word);
  }

  @override
  void undo() {
    doc.erase(word);
  }
}

//8.3. Order Queue System
//Process a queue of orders (buy/sell).
abstract class OrderCommand {
  void execute();
}

class StockTrade {
  void buy() => print("Buying stocks...");
  void sell() => print("Selling stocks...");
}

class BuyStock implements OrderCommand {
  final StockTrade stock;

  BuyStock(this.stock);

  @override
  void execute() => stock.buy();
}

class SellStock implements OrderCommand {
  final StockTrade stock;

  SellStock(this.stock);

  @override
  void execute() => stock.sell();
}

class Broker {
  final List<OrderCommand> _orders = [];

  void takeOrder(OrderCommand order) {
    _orders.add(order);
  }

  void placeOrders() {
    for (var order in _orders) {
      order.execute();
    }
    _orders.clear();
  }
}

//8.4. Macro Commands (Batch Processing)
//Execute multiple commands as a single command.
abstract class Command2 {
  void execute();
}

class StartServer implements Command2 {
  @override
  void execute() => print("Starting server...");
}

class LoadDatabase implements Command2 {
  @override
  void execute() => print("Loading database...");
}

class InitializeServices implements Command2 {
  @override
  void execute() => print("Initializing services...");
}

class MacroCommand implements Command2 {
  final List<Command2> _commands;

  MacroCommand(this._commands);

  @override
  void execute() {
    for (var cmd in _commands) {
      cmd.execute();
    }
  }
}

//8.5. Game Controls
//Use commands for actions like jump, move, and shoot.
abstract class GameCommand {
  void execute();
}

class Player {
  void move() => print("Player moves forward");
  void jump() => print("Player jumps");
  void shoot() => print("Player shoots");
}

class MoveCommand implements GameCommand {
  final Player player;
  MoveCommand(this.player);
  @override
  void execute() => player.move();
}

class JumpCommand implements GameCommand {
  final Player player;
  JumpCommand(this.player);
  @override
  void execute() => player.jump();
}

class ShootCommand implements GameCommand {
  final Player player;
  ShootCommand(this.player);
  @override
  void execute() => player.shoot();
}

class GameController {
  GameCommand? command;

  void pressButton() {
    command?.execute();
  }
}
