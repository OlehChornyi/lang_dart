void main(List<String> args) {
  final editor = TextEditor();
  final history = History();

  editor.type("Hello");
  history.push(editor.save());

  editor.type(" World!");
  print(editor.text);

  editor.restore(history.pop());
  print(editor.text);
  //------------------
  final counter = Counter();

  counter.increment();
  counter.increment();
  final snapshot = counter.save();

  counter.increment();
  print(counter.value);

  counter.restore(snapshot);
  print(counter.value); 
  //-------------------
  final canvas = Canvas();

  canvas.draw("Circle");
  final snapshot1 = canvas.save();

  canvas.draw("Square");
  canvas.show();

  canvas.restore(snapshot1);
  canvas.show(); 
  //-------------------
  final player = Player();

  player.play();
  player.play();
  final saved = player.save();

  player.play(); 
  player.status();

  player.restore(saved);
  player.status();
  //--------------------
  final form = FormDraft();
  form.name = "Alice";
  form.email = "alice@mail.com";
  final saved1 = form.save();

  form.name = "Bob";
  form.email = "bob@mail.com";
  form.printState();

  form.restore(saved1);
  form.printState(); 
}

//The Memento Pattern captures and stores an object's internal 
//state without violating encapsulation, so it can be restored later. 
//It’s often used for undo/redo functionality.

//15.1. Text Editor with Undo
//Implement undo functionality in a text editor.
class Memento {
  final String text;

  Memento(this.text);
}

class TextEditor {
  String _text = '';

  String get text => _text;

  void type(String newText) {
    _text += newText;
  }

  Memento save() => Memento(_text);

  void restore(Memento memento) {
    _text = memento.text;
  }
}

class History {
  final List<Memento> _history = [];

  void push(Memento memento) => _history.add(memento);

  Memento pop() => _history.removeLast();
}

//15.2. Counter with State Snapshots
//Track and restore counter values.
class CounterMemento {
  final int value;

  CounterMemento(this.value);
}

class Counter {
  int _value = 0;

  void increment() => _value++;
  void decrement() => _value--;

  int get value => _value;

  CounterMemento save() => CounterMemento(_value);
  void restore(CounterMemento memento) {
    _value = memento.value;
  }
}

//15.3. Drawing App – Undo Shapes
//Add shapes and support undoing the last draw.
class CanvasMemento {
  final List<String> shapes;

  CanvasMemento(List<String> shapes) : shapes = List.from(shapes);
}

class Canvas {
  final List<String> _shapes = [];

  void draw(String shape) => _shapes.add(shape);

  CanvasMemento save() => CanvasMemento(_shapes);

  void restore(CanvasMemento memento) {
    _shapes
      ..clear()
      ..addAll(memento.shapes);
  }

  void show() => print("Canvas: $_shapes");
}

//15.4. Game Save and Load
//Save and load a player's game progress.
class GameState {
  final int level;
  final int score;

  GameState(this.level, this.score);
}

class Player {
  int level = 1;
  int score = 0;

  void play() {
    level++;
    score += 100;
  }

  GameState save() => GameState(level, score);

  void restore(GameState state) {
    level = state.level;
    score = state.score;
  }

  void status() => print("Level: $level, Score: $score");
}

//15.5. Form Draft Save/Restore
//Let a user edit a form and revert changes.
class FormState {
  final String name;
  final String email;

  FormState(this.name, this.email);
}

class FormDraft {
  String name = '';
  String email = '';

  FormState save() => FormState(name, email);
  void restore(FormState state) {
    name = state.name;
    email = state.email;
  }

  void printState() => print("Name: $name, Email: $email");
}