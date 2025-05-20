void main(List<String> args) {
  final server = ProxyServer();
  server.fetchData();
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