void main(List<String> args) {
  final server = ProxyServer();
  server.fetchData();
  //-------------------
  Image image = ProxyImage("photo.jpg");

  // Image loaded only on first display
  image.display();
  image.display();
  //-------------------
  final account = RealBankAccount();
  final proxy = BankAccountProxy(account, "guest");

  proxy.withdraw(100);
  //-------------------
  final service = RealService();
  final proxy1 = LoggingProxy(service);

  proxy1.performAction();
  //-------------------
  final proxy2 = CountingProxy(RealResource());
  proxy2.use();
  proxy2.use();
  //-------------------
  final fetcher = CachingProxy(RealDataFetcher());

  print(fetcher.fetchData());
  print(fetcher.fetchData());
}

//9. Proxy Pattern
//Provide a surrogate or placeholder for another object.

abstract class Server {
  void fetchData();
}

class RealServer implements Server {
  @override
  void fetchData() => print("Fetching data from server...");
}

class ProxyServer implements Server {
  final RealServer _realServer = RealServer();

  @override
  void fetchData() {
    print("Proxy: checking access...");
    _realServer.fetchData();
  }
}

//The Proxy Pattern provides a placeholder or surrogate 
//for another object to control access to it. It's useful for:
//Lazy initialization
//Access control
//Logging, caching, etc.

//9.2. Virtual Proxy (Lazy Initialization)
//Delay loading of a heavy object until it's needed.
abstract class Image {
  void display();
}

class RealImage implements Image {
  final String filename;

  RealImage(this.filename) {
    _loadFromDisk();
  }

  void _loadFromDisk() {
    print("Loading image from disk: $filename");
  }

  @override
  void display() {
    print("Displaying image: $filename");
  }
}

class ProxyImage implements Image {
  final String filename;
  RealImage? _realImage;

  ProxyImage(this.filename);

  @override
  void display() {
    _realImage ??= RealImage(filename);
    _realImage!.display();
  }
}

//9.3. Protection Proxy
//Only allow access to certain operations for authorized users.
abstract class BankAccount {
  void withdraw(double amount);
}

class RealBankAccount implements BankAccount {
  double _balance = 1000;

  @override
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print("Withdrew \$${amount}, balance: \$${_balance}");
    } else {
      print("Insufficient funds.");
    }
  }
}

class BankAccountProxy implements BankAccount {
  final RealBankAccount _realAccount;
  final String _userRole;

  BankAccountProxy(this._realAccount, this._userRole);

  @override
  void withdraw(double amount) {
    if (_userRole == "admin") {
      _realAccount.withdraw(amount);
    } else {
      print("Access denied: Only admins can withdraw.");
    }
  }
}

//9.4. Logging Proxy
//Log access to a service for monitoring.
abstract class Service {
  void performAction();
}

class RealService implements Service {
  @override
  void performAction() {
    print("Service action performed.");
  }
}

class LoggingProxy implements Service {
  final RealService _realService;

  LoggingProxy(this._realService);

  @override
  void performAction() {
    print("LOG: performAction() called");
    _realService.performAction();
  }
}

//9.5. Smart Reference Proxy (Counting usage)
//Track how many times an object is accessed.
abstract class Resource {
  void use();
}

class RealResource implements Resource {
  @override
  void use() {
    print("Resource used");
  }
}

class CountingProxy implements Resource {
  final RealResource _resource;
  int _accessCount = 0;

  CountingProxy(this._resource);

  @override
  void use() {
    _accessCount++;
    print("Access count: $_accessCount");
    _resource.use();
  }
}

//9.6. Cache Proxy
//Cache the result of an expensive operation.
abstract class DataFetcher {
  String fetchData();
}

class RealDataFetcher implements DataFetcher {
  @override
  String fetchData() {
    print("Fetching data from server...");
    return "Data from server";
  }
}

class CachingProxy implements DataFetcher {
  final RealDataFetcher _realFetcher;
  String? _cachedData;

  CachingProxy(this._realFetcher);

  @override
  String fetchData() {
    if (_cachedData == null) {
      _cachedData = _realFetcher.fetchData();
    } else {
      print("Returning cached data...");
    }
    return _cachedData!;
  }
}