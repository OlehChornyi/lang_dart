void main(List<String> args) {
  final person = Person(HappyState());
  person.express();

  person.state = SadState();
  person.express();
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