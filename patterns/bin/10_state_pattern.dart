void main(List<String> args) {
  final person = Person(HappyState());
  person.express();

  person.state = SadState();
  person.express();
  //--------------------
  final trafficLight = TrafficLight(RedLight());

  trafficLight.showSignal(); 

  trafficLight.setState(GreenLight());
  trafficLight.showSignal(); 

  trafficLight.setState(YellowLight());
  trafficLight.showSignal();
  //--------------------
  final player = AudioPlayer();

  player.pressButton(); 
  player.pressButton(); 
  player.pressButton(); 
  //---------------------
  final atm = ATM(100);

  atm.withdraw(50); 
  atm.withdraw(50); 
  atm.withdraw(10);
  //---------------------
  final doc = Document();

  doc.status(); 
  doc.advance();
  doc.status(); 
  doc.advance();
  doc.status();
  doc.advance();
}

//10. State Pattern
//Allow an object to alter its behavior when its internal state changes.
abstract class State {
  void handle();
}

class HappyState implements State {
  @override
  void handle() => print("I'm happy!");
}

class SadState implements State {
  @override
  void handle() => print("I'm sad...");
}

class Person {
  State state;

  Person(this.state);

  void express() => state.handle();
}

//10.2. Traffic Light System
//Change behavior (color) based on the current state.
abstract class TrafficLightState {
  void handle();
}

class RedLight implements TrafficLightState {
  @override
  void handle() {
    print("Stop - Red Light");
  }
}

class GreenLight implements TrafficLightState {
  @override
  void handle() {
    print("Go - Green Light");
  }
}

class YellowLight implements TrafficLightState {
  @override
  void handle() {
    print("Slow Down - Yellow Light");
  }
}

class TrafficLight {
  TrafficLightState _state;

  TrafficLight(this._state);

  void setState(TrafficLightState state) {
    _state = state;
  }

  void showSignal() {
    _state.handle();
  }
}

//10.3. Audio Player
//The behavior of play/pause depends on the current state.
abstract class AudioState {
  void pressButton(AudioPlayer player);
}

class PlayingState implements AudioState {
  @override
  void pressButton(AudioPlayer player) {
    print("Pausing audio...");
    player.setState(PausedState());
  }
}

class PausedState implements AudioState {
  @override
  void pressButton(AudioPlayer player) {
    print("Playing audio...");
    player.setState(PlayingState());
  }
}

class AudioPlayer {
  AudioState _state = PausedState();

  void setState(AudioState state) {
    _state = state;
  }

  void pressButton() {
    _state.pressButton(this);
  }
}

//10.4. ATM Machine
//ATM behaves differently when out of cash.
abstract class ATMState {
  void withdraw(ATM atm, double amount);
}

class HasCash implements ATMState {
  @override
  void withdraw(ATM atm, double amount) {
    if (amount <= atm.cash) {
      atm.cash -= amount;
      print("Dispensed \$${amount}");
      if (atm.cash == 0) {
        atm.setState(NoCash());
      }
    } else {
      print("Insufficient cash.");
    }
  }
}

class NoCash implements ATMState {
  @override
  void withdraw(ATM atm, double amount) {
    print("ATM out of service.");
  }
}

class ATM {
  double cash;
  ATMState _state;

  ATM(this.cash) : _state = HasCash();

  void setState(ATMState state) {
    _state = state;
  }

  void withdraw(double amount) {
    _state.withdraw(this, amount);
  }
}

//10.5. Document Lifecycle
//A document transitions through states: Draft → Review → Published.
abstract class DocumentState {
  void next(Document doc);
  void printStatus();
}

class Draft implements DocumentState {
  @override
  void next(Document doc) {
    doc.setState(Review());
  }

  @override
  void printStatus() {
    print("Document in Draft state.");
  }
}

class Review implements DocumentState {
  @override
  void next(Document doc) {
    doc.setState(Published());
  }

  @override
  void printStatus() {
    print("Document in Review state.");
  }
}

class Published implements DocumentState {
  @override
  void next(Document doc) {
    print("Already published.");
  }

  @override
  void printStatus() {
    print("Document Published.");
  }
}

class Document {
  DocumentState _state;

  Document() : _state = Draft();

  void setState(DocumentState state) {
    _state = state;
  }

  void advance() {
    _state.next(this);
  }

  void status() {
    _state.printStatus();
  }
}