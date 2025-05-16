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

//