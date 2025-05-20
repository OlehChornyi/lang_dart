void main(List<String> args) {
  final publisher = Publisher();
  publisher.subscribe(Subscriber("Alice"));
  publisher.subscribe(Subscriber("Bob"));

  publisher.notify("New article available");
  print(publisher._subscribers);
}

//6. Observer Pattern
//Notify multiple objects when the state changes.
abstract class Observer {
  void update(String message);
}

class Subscriber implements Observer {
  final String name;

  Subscriber(this.name);

  @override
  void update(String message) => print("$name received: $message");
}

class Publisher {
  List<Observer> _subscribers = [];

  void subscribe(Observer obs) => _subscribers.add(obs);

  void notify(String message) {
    for (var obs in _subscribers) {
      obs.update(message);
    }
  }
}