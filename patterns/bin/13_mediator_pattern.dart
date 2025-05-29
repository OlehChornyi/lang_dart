void main(List<String> args) {
  var chatroom = ChatRoom();
  var alice = User("Alice", chatroom);
  var bob = User("Bob", chatroom);
  var charlie = User("Charlie", chatroom);

  chatroom.register(alice);
  chatroom.register(bob);
  chatroom.register(charlie);

  alice.send("Hello, everyone!");
  //------------------
  var atc = ATC();
  var flight1 = Airplane("Flight 101", atc);
  var flight2 = Airplane("Flight 202", atc);

  flight1.requestLanding(); 
  flight2.requestLanding(); 
  atc.runwayCleared();
  flight2.requestLanding();
  //------------------
  var button = Button();
  var textBox = TextBox();
  var dialog = Dialog(button, textBox);

  button.click();
  //------------------
  var light = Light();
  var thermostat = Thermostat();
  var hub = SmartHub(light, thermostat);

  thermostat.detectCold(); 
  //-----------------
  var form = Form();
  form.nameField.update("Alice");
  form.emailField.update("alice@example.com"); 
}

//The Mediator pattern defines an object that encapsulates how a set 
//of objects interact. It promotes loose coupling by preventing objects 
//from referring to each other explicitly and allows their interaction 
//to be varied independently.

//13.1. Chatroom Mediator
//Enable users to communicate via a mediator (chatroom).
abstract class ChatMediator {
  void sendMessage(String message, User sender);
}

class ChatRoom implements ChatMediator {
  List<User> users = [];

  void register(User user) {
    users.add(user);
  }

  @override
  void sendMessage(String message, User sender) {
    for (var user in users) {
      if (user != sender) {
        user.receive(message);
      }
    }
  }
}

class User {
  String name;
  ChatMediator mediator;

  User(this.name, this.mediator);

  void send(String message) {
    print("$name sends: $message");
    mediator.sendMessage(message, this);
  }

  void receive(String message) {
    print("$name receives: $message");
  }
}

//13.2. Air Traffic Control
//Coordinate planes landing through a mediator (Air Traffic Control).
abstract class ATCMediator {
  void notifyLanding(Airplane plane);
}

class ATC implements ATCMediator {
  bool runwayFree = true;

  @override
  void notifyLanding(Airplane plane) {
    if (runwayFree) {
      print("${plane.name} is landing...");
      runwayFree = false;
    } else {
      print("${plane.name} wait: runway is busy");
    }
  }

  void runwayCleared() {
    print("Runway is now free.");
    runwayFree = true;
  }
}

class Airplane {
  String name;
  ATCMediator mediator;

  Airplane(this.name, this.mediator);

  void requestLanding() {
    mediator.notifyLanding(this);
  }
}

//13.3. UI Component Communication
//Components (Button, TextBox) notify a dialog mediator to coordinate behavior.
abstract class DialogMediator {
  void notify(Component sender, String event);
}

abstract class Component {
  late DialogMediator mediator;

  void setMediator(DialogMediator mediator) {
    this.mediator = mediator;
  }
}

class Button extends Component {
  void click() {
    print("Button clicked");
    mediator.notify(this, "click");
  }
}

class TextBox extends Component {
  void showMessage(String message) {
    print("TextBox displays: $message");
  }
}

class Dialog implements DialogMediator {
  late Button button;
  late TextBox textBox;

  Dialog(this.button, this.textBox) {
    button.setMediator(this);
    textBox.setMediator(this);
  }

  @override
  void notify(Component sender, String event) {
    if (sender is Button && event == "click") {
      textBox.showMessage("Button was clicked!");
    }
  }
}

//13.4. Smart Home Controller
//Devices (Light, Thermostat) notify a smart home hub (mediator).
abstract class SmartHomeMediator {
  void notify(Device sender, String event);
}

abstract class Device {
  late SmartHomeMediator mediator;

  void setMediator(SmartHomeMediator mediator) {
    this.mediator = mediator;
  }
}

class Light extends Device {
  void turnOn() => print("Light turned on");
}

class Thermostat extends Device {
  void detectCold() {
    print("Room is cold");
    mediator.notify(this, "cold");
  }
}

class SmartHub implements SmartHomeMediator {
  late Light light;
  late Thermostat thermostat;

  SmartHub(this.light, this.thermostat) {
    light.setMediator(this);
    thermostat.setMediator(this);
  }

  @override
  void notify(Device sender, String event) {
    if (sender is Thermostat && event == "cold") {
      light.turnOn();
    }
  }
}

//13.5. Form Validation Mediator
//Fields notify the mediator to validate entire form when one changes.
abstract class FormMediator {
  void fieldChanged(String name, String value);
}

class InputField {
  final String name;
  String value = "";
  final FormMediator mediator;

  InputField(this.name, this.mediator);

  void update(String newValue) {
    value = newValue;
    mediator.fieldChanged(name, newValue);
  }
}

class Form implements FormMediator {
  late InputField nameField;
  late InputField emailField;

  Form() {
    nameField = InputField("name", this);
    emailField = InputField("email", this);
  }

  @override
  void fieldChanged(String name, String value) {
    print("Field '$name' updated to '$value'");
    if (nameField.value.isNotEmpty && emailField.value.contains("@")) {
      print("Form is valid!");
    } else {
      print("Form is incomplete or invalid.");
    }
  }
}