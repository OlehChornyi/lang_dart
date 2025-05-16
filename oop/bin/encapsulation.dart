void main(List<String> args) {
  var p = Person();
  p.name = "Alice";
  print(p.name);
  //--------------
  var account = BankAccount();
  account.deposit(100);
  account.withdraw(30);
  print(account.balance);
  //--------------
  var t = Temperature();
  t.celsius = -500;
  print(t.celsius);
  //--------------
  var config = AppConfig();
  print(config.appName);
  //---------------
  var p1 = Product("Book", 12.99);
  print(p1.name);
  print(p1.price);
  //-----------------------
  var user = User();
  user.setPassword("123"); // Too short
  user.setPassword("secure123");
  print(user.checkPassword("secure123")); 
  //---------------------
  var calc = Calculator();
  print(calc.squareSum(2, 3));
  //-------------------
  var c = Counter();
  c.value = 10;
  print(c.value);
  //-------------------
  var cart = Cart();
  cart.addItem("Apple");
  print(cart.items);
  // cart.items.add("Hack");
  //-------------------
  var c1 = Circle(5);
  print(c1.area); // 78.5375
  print(c1.circumference);
}

//Here are 10 Dart exercises focused on the Encapsulation principle 
//in Object-Oriented Programming (OOP). These exercises demonstrate 
//data hiding, getters and setters, private fields, and controlled 
//access to class internals.

//1. Encapsulate Fields with Getters and Setters
class Person {
  String _name = '';

  String get name => _name;
  set name(String value) {
    if (value.isNotEmpty) _name = value;
  }
}

//2. Private Field Protection
class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= _balance) _balance -= amount;
  }
}

//3. Validate Input via Setters
class Temperature {
  double _celsius = 0;

  double get celsius => _celsius;

  set celsius(double value) {
    if (value >= -273.15) {
      _celsius = value;
    }
  }
}

//4. Read-Only Property
class AppConfig {
  final String _appName = "MyApp";

  String get appName => _appName;
}

//5. Encapsulation with Constructor Injection
class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price);

  String get name => _name;
  double get price => _price;
}

//6. Password Validation
class User {
  String _password = "";

  void setPassword(String value) {
    if (value.length >= 6) {
      _password = value;
    } else {
      print("Password too short");
    }
  }

  bool checkPassword(String value) => _password == value;
}

//7. Private Helper Method
class Calculator {
  int add(int a, int b) => a + b;
  int _square(int x) => x * x;

  int squareSum(int a, int b) => _square(add(a, b));
}

//8. Custom Setter with Logging
class Counter {
  int _value = 0;

  int get value => _value;

  set value(int newVal) {
    print("Setting value to $newVal");
    _value = newVal;
  }
}

//9. Encapsulating Collection
class Cart {
  final List<String> _items = [];

  List<String> get items => List.unmodifiable(_items);

  void addItem(String item) => _items.add(item);
}

//10. Multiple Getters with Logic
class Circle {
  double _radius;

  Circle(this._radius);

  double get radius => _radius;
  double get area => 3.1415 * _radius * _radius;
  double get circumference => 2 * 3.1415 * _radius;
}