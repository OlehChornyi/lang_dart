void main(List<String> args) {
  final editor = TextEditor();

editor.write("First");
editor.write("Second");
editor.undo();
print(editor.text);
//-----------------
final manager = ThemeManager();
manager.isDarkMode = true;

final saved = manager.save();
manager.isDarkMode = false;
manager.restore(saved);
print(manager.isDarkMode);
//---------------
}

//The Memento Pattern captures and restores an object's internal 
//state without exposing its implementation details. In Flutter apps, 
//it's useful for:
//Undo/redo features
//Saving widget state
//Snapshot-based history
//Form editing history
//Navigation or game state saving

//14.1. Undo TextField Input
//Save text edits and allow undo functionality.
class TextMemento {
  final String text;
  TextMemento(this.text);
}

class TextEditor {
  String _text = '';
  final List<TextMemento> _history = [];

  void write(String newText) {
    _history.add(TextMemento(_text));
    _text = newText;
  }

  void undo() {
    if (_history.isNotEmpty) {
      _text = _history.removeLast().text;
    }
  }

  String get text => _text;
}

//14.2. Save and Restore Theme Settings
//Save and restore theme selection in settings.
class ThemeMemento {
  final bool isDarkMode;
  ThemeMemento(this.isDarkMode);
}

class ThemeManager {
  bool isDarkMode = false;
  ThemeMemento save() => ThemeMemento(isDarkMode);
  void restore(ThemeMemento m) => isDarkMode = m.isDarkMode;
}

//14.3. Canvas Drawing Undo Feature
//Create an undo feature for a drawing app.
class CanvasState {
  final List<String> strokes;
  CanvasState(this.strokes);
}

class DrawingMemento {
  final CanvasState state;
  DrawingMemento(this.state);
}

class CanvasEditor {
  List<String> _strokes = [];
  final List<DrawingMemento> _history = [];

  void draw(String stroke) {
    _history.add(DrawingMemento(CanvasState(List.from(_strokes))));
    _strokes.add(stroke);
  }

  void undo() {
    if (_history.isNotEmpty) {
      _strokes = _history.removeLast().state.strokes;
    }
  }

  List<String> get strokes => _strokes;
}

//14.4. Form Input Revert Feature
//Allow users to revert form inputs to a saved state.
class FormMemento {
  final String name;
  final String email;

  FormMemento(this.name, this.email);
}

class FormController {
  String name = '';
  String email = '';
  late FormMemento _memento;

  void save() => _memento = FormMemento(name, email);
  void restore() {
    name = _memento.name;
    email = _memento.email;
  }
}

//14.5. Game State Save/Load
//Implement save/load state in a Flutter-based game screen.
class GameState {
  final int score;
  final int level;

  GameState(this.score, this.level);
}

class GameMemento {
  final GameState state;
  GameMemento(this.state);
}

class GameController {
  int score = 0;
  int level = 1;
  final List<GameMemento> _saves = [];

  void saveState() {
    _saves.add(GameMemento(GameState(score, level)));
  }

  void restoreLastSave() {
    if (_saves.isNotEmpty) {
      final last = _saves.removeLast();
      score = last.state.score;
      level = last.state.level;
    }
  }
}