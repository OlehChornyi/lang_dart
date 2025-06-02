void main(List<String> args) async {
  final toastButton = Button(ShowToastCommand());
  toastButton.press();
  //-----------------
  final editor = TextEditor();
  final command = AddTextCommand(editor, "Flutter");

  command.execute();
  print("After add: ${editor.text}");

  command.undo();
  print("After undo: ${editor.text}");
  //------------------
  final themeManager = ThemeManager();
  final command2 = ToggleThemeCommand(themeManager);

  command2.execute();
  command2.execute(); 
  //------------------
  final queue = <Command3>[
    FetchUsersCommand(),
    FetchPostsCommand(),
  ];

  for (final command in queue) {
    await command.execute();
  }
  //------------------
  final form = FormHandler();
  form.submit(LoginCommand("alice"));
  form.submit(RegisterCommand("bob"));
}

//8.1. Button Actions with Command Pattern
//Use a command to decouple button logic from execution.
abstract class Command {
  void execute();
}

class ShowToastCommand implements Command {
  @override
  void execute() {
    print("Showing toast: Hello, Flutter!");
  }
}

class Button {
  final Command command;

  Button(this.command);

  void press() {
    command.execute();
  }
}

//8.2. Undo Text Entry Command
//Allow text entry commands to be undoable.
abstract class Command1 {
  void execute();
  void undo();
}

class TextEditor {
  String text = '';

  void write(String value) => text += value;
  void remove(int length) => text = text.substring(0, text.length - length);
}

class AddTextCommand implements Command1 {
  final TextEditor editor;
  final String text;

  AddTextCommand(this.editor, this.text);

  @override
  void execute() => editor.write(text);

  @override
  void undo() => editor.remove(text.length);
}

//8.3. Toggle Dark Mode Using Command Pattern
//Toggle app theme mode with commands.
abstract class Command2 {
  void execute();
}

class ThemeManager {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    print("Theme is now: ${isDark ? "Dark" : "Light"}");
  }
}

class ToggleThemeCommand implements Command2 {
  final ThemeManager manager;

  ToggleThemeCommand(this.manager);

  @override
  void execute() => manager.toggleTheme();
}

//8.4. Command Queue for Network Requests
//Queue and execute API commands in order.
abstract class Command3 {
  Future<void> execute();
}

class FetchUsersCommand implements Command3 {
  @override
  Future<void> execute() async {
    print("Fetching users...");
    await Future.delayed(Duration(seconds: 1));
    print("Users fetched.");
  }
}

class FetchPostsCommand implements Command3 {
  @override
  Future<void> execute() async {
    print("Fetching posts...");
    await Future.delayed(Duration(seconds: 1));
    print("Posts fetched.");
  }
}

//8.5. Dynamic Form Submit with Commands
//Handle form submission actions using commands (e.g., login or register).
abstract class Command4{
  void execute();
}

class LoginCommand implements Command4 {
  final String username;

  LoginCommand(this.username);

  @override
  void execute() {
    print("Logging in user: $username");
  }
}

class RegisterCommand implements Command4 {
  final String username;

  RegisterCommand(this.username);

  @override
  void execute() {
    print("Registering user: $username");
  }
}

class FormHandler {
  void submit(Command4 command) {
    command.execute();
  }
}