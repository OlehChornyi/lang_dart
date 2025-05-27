void main(List<String> args) {
  final publisher = Publisher();
  publisher.subscribe(Subscriber("Alice"));
  publisher.subscribe(Subscriber("Bob"));

  publisher.notify("New article available");
  print(publisher._subscribers);
  //-----------------
  var station = WeatherStation();
  var display = TemperatureDisplay();

  station.addObserver(display);
  station.setTemperature(25.5); 
  //-----------------
  var stock = Stock();
  stock.addObserver(MobileApp());
  stock.addObserver(WebApp());

  stock.setPrice(120.0);
  //-----------------
  var group = ChatGroup();
  group.addMember(User("Alice"));
  group.addMember(User("Bob"));

  group.sendMessage("Hello everyone!");
  //-----------------
  var auction = Auctioneer();
  auction.register(BidderClient("Alice"));
  auction.register(BidderClient("Bob"));

  auction.newBid(300);
  //-----------------
  var task = Task("Design UI");

  task.addObserver(TeamMember("Dev"));
  task.addObserver(TeamMember("Tester"));

  task.updateTask("Finalize UI design");
}

//6. Observer Pattern
//Notify multiple objects when the state changes.
abstract class Observer1 {
  void update(String message);
}

class Subscriber implements Observer1 {
  final String name;

  Subscriber(this.name);

  @override
  void update(String message) => print("$name received: $message");
}

class Publisher {
  List<Observer1> _subscribers = [];

  void subscribe(Observer1 obs) => _subscribers.add(obs);

  void notify(String message) {
    for (var obs in _subscribers) {
      obs.update(message);
    }
  }
}

//Defines a one-to-many dependency between objects so that when 
//one object (subject) changes state, all its dependents (observers) 
//are notified and updated automatically.

//6.2. Weather Station
//Notify different display elements when temperature changes.
// Observer
abstract class Observer {
  void update(double temperature);
}

// Subject
abstract class Subject {
  void addObserver(Observer o);
  void removeObserver(Observer o);
  void notifyObservers();
}

// Concrete Subject
class WeatherStation implements Subject {
  final List<Observer> _observers = [];
  double _temperature = 0.0;

  void setTemperature(double temp) {
    _temperature = temp;
    notifyObservers();
  }

  @override
  void addObserver(Observer o) => _observers.add(o);

  @override
  void removeObserver(Observer o) => _observers.remove(o);

  @override
  void notifyObservers() {
    for (var o in _observers) {
      o.update(_temperature);
    }
  }
}

// Concrete Observer
class TemperatureDisplay implements Observer {
  @override
  void update(double temperature) {
    print("Temperature Display: $temperature°C");
  }
}

//6.3. Stock Price Monitor
//Notify multiple apps when a stock price changes.
abstract class StockObserver {
  void update(double price);
}

class Stock {
  double _price = 0;
  final List<StockObserver> _observers = [];

  void addObserver(StockObserver o) => _observers.add(o);
  void setPrice(double price) {
    _price = price;
    for (var o in _observers) {
      o.update(price);
    }
  }
}

class MobileApp implements StockObserver {
  @override
  void update(double price) {
    print("Mobile App: Stock price updated to \$${price}");
  }
}

class WebApp implements StockObserver {
  @override
  void update(double price) {
    print("Web App: Stock price updated to \$${price}");
  }
}

//6.4. Chat Notifications
//Notify users when a new message arrives in a chat group.
abstract class ChatObserver {
  void onMessage(String message);
}

class ChatGroup {
  final List<ChatObserver> _members = [];

  void addMember(ChatObserver user) => _members.add(user);

  void sendMessage(String msg) {
    for (var member in _members) {
      member.onMessage(msg);
    }
  }
}

class User implements ChatObserver {
  final String name;

  User(this.name);

  @override
  void onMessage(String message) {
    print("$name received: $message");
  }
}

//6.5. Auction System
//Notify all bidders when the price is updated.
abstract class Bidder {
  void updateBid(double bid);
}

class Auctioneer {
  final List<Bidder> _bidders = [];

  void register(Bidder b) => _bidders.add(b);

  void newBid(double amount) {
    print("New bid: \$${amount}");
    for (var bidder in _bidders) {
      bidder.updateBid(amount);
    }
  }
}

class BidderClient implements Bidder {
  final String name;

  BidderClient(this.name);

  @override
  void updateBid(double bid) {
    print("$name sees new bid: \$${bid}");
  }
}

//6.6. Task Management App Notifications
//Notify team members when a task is updated.
abstract class TaskObserver {
  void onTaskUpdated(String taskName);
}

class Task {
  String name;
  final List<TaskObserver> _observers = [];

  Task(this.name);

  void addObserver(TaskObserver o) => _observers.add(o);

  void updateTask(String newName) {
    name = newName;
    for (var o in _observers) {
      o.onTaskUpdated(name);
    }
  }
}

class TeamMember implements TaskObserver {
  final String name;

  TeamMember(this.name);

  @override
  void onTaskUpdated(String taskName) {
    print("$name was notified: Task updated to '$taskName'");
  }
}