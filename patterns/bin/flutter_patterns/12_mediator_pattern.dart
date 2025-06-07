void main(List<String> args) {
  final mediator = FormMediator();
  final nameField = NameField(mediator);
  final emailField = EmailField(mediator);

  mediator.nameField = nameField;
  mediator.emailField = emailField;

  nameField.fill("John");
  print(emailField.isEnabled);
  //--------------------
  final dialog = DialogBox();
  final confirm = ConfirmButton(dialog);
  final cancel = CancelButton(dialog);

  confirm.press();
  //--------------------
  final labels = [ThemeLabel(), ThemeLabel()];
  final themeManager = ThemeManager(labels);
  final themeButton = ThemeButton(themeManager);

  themeButton.press("Dark");
  //--------------------
  final navigator = NavigatorService();
  final homeBtn = HomeButton(navigator);
  final settingsBtn = SettingsButton(navigator);

  homeBtn.tap();  
  settingsBtn.tap();
  //--------------------
  final chat = ChatRoom();
  final alice = User('Alice', chat);
  final bob = User('Bob', chat);

  chat.register(alice);
  chat.register(bob);

  alice.sendMessage("Hi Bob!");
}

//The Mediator Pattern centralizes communication between objects 
//to promote loose coupling. Instead of objects communicating directly 
//with each other, they go through a mediator.
//In Flutter, this is useful when managing communication between 
//multiple widgets or components that need to stay in sync without 
//tightly coupling them.

//12.1. Mediating Communication Between Form Fields
//When one field is filled, enable another.
abstract class Mediator {
  void notify(Component sender, String event);
}

abstract class Component {
  final Mediator mediator;

  Component(this.mediator);
}

class NameField extends Component {
  bool isFilled = false;

  NameField(super.mediator);

  void fill(String name) {
    isFilled = name.isNotEmpty;
    mediator.notify(this, 'nameFilled');
  }
}

class EmailField extends Component {
  bool isEnabled = false;

  EmailField(super.mediator);
}

class FormMediator implements Mediator {
  late NameField nameField;
  late EmailField emailField;

  @override
  void notify(Component sender, String event) {
    if (event == 'nameFilled' && (sender as NameField).isFilled) {
      emailField.isEnabled = true;
    }
  }
}

//12.2. Dialog Components Coordinated via Mediator
//Dialog components notify the mediator to close or update.
abstract class DialogMediator {
  void notify(String event);
}

class ConfirmButton {
  final DialogMediator mediator;

  ConfirmButton(this.mediator);

  void press() {
    mediator.notify('confirm');
  }
}

class CancelButton {
  final DialogMediator mediator;

  CancelButton(this.mediator);

  void press() {
    mediator.notify('cancel');
  }
}

class DialogBox implements DialogMediator {
  bool isVisible = true;

  @override
  void notify(String event) {
    if (event == 'confirm' || event == 'cancel') {
      isVisible = false;
      print('Dialog closed due to: $event');
    }
  }
}

//12.3. Theme Change Notifies Multiple Widgets
//Changing the theme via a mediator notifies multiple UI components.
abstract class ThemeMediator {
  void changeTheme(String theme);
}

class ThemeLabel {
  void update(String theme) {
    print("Label updated to theme: $theme");
  }
}

class ThemeButton {
  final ThemeMediator mediator;

  ThemeButton(this.mediator);

  void press(String theme) {
    mediator.changeTheme(theme);
  }
}

class ThemeManager implements ThemeMediator {
  final List<ThemeLabel> labels;

  ThemeManager(this.labels);

  @override
  void changeTheme(String theme) {
    for (var label in labels) {
      label.update(theme);
    }
  }
}

//12.4. Navigation Mediator
//Widgets ask a mediator to change the current screen/page.
abstract class NavigationMediator {
  void navigateTo(String screen);
}

class HomeButton {
  final NavigationMediator mediator;

  HomeButton(this.mediator);

  void tap() {
    mediator.navigateTo('HomeScreen');
  }
}

class SettingsButton {
  final NavigationMediator mediator;

  SettingsButton(this.mediator);

  void tap() {
    mediator.navigateTo('SettingsScreen');
  }
}

class NavigatorService implements NavigationMediator {
  void _goTo(String screen) {
    print("Navigating to $screen");
  }

  @override
  void navigateTo(String screen) {
    _goTo(screen);
  }
}

//12.5. Chat App User Messages via Mediator
//Chat users communicate via a chat mediator (not directly).
abstract class ChatMediator {
  void send(String message, User sender);
}

class User {
  final String name;
  final ChatMediator mediator;

  User(this.name, this.mediator);

  void sendMessage(String message) {
    mediator.send(message, this);
  }

  void receive(String message, String from) {
    print("[$name] received from $from: $message");
  }
}

class ChatRoom implements ChatMediator {
  final List<User> users = [];

  void register(User user) {
    users.add(user);
  }

  @override
  void send(String message, User sender) {
    for (var user in users) {
      if (user != sender) {
        user.receive(message, sender.name);
      }
    }
  }
}
