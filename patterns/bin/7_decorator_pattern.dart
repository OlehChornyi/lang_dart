void main(List<String> args) {
  final coffee = MilkDecorator(BasicCoffee());
  print("Cost: ${coffee.cost()}");
  //-----------------
  Text message = PlainText("Hello");
  message = ItalicDecorator(BoldDecorator(message));
  print(message.render()); 
  //-----------------
  RequestHandler handler = BasicHandler();
  handler = LoggingHandler(handler);

  handler.handle("GET /home");
  //-----------------
  User user = BasicUser();
  user = AdminAccessDecorator(user);

  user.accessSystem();
  //-----------------
  Product product = BaseProduct("Shoes", 100.0);
  product = PercentageDiscount(product, 0.2);

  print("${product.getLabel()}: \$${product.getPrice()}");
}

//7. Decorator Pattern
//Add behavior to an object dynamically.
abstract class Coffee {
  String cost();
}

class BasicCoffee implements Coffee {
  @override
  String cost() => "\$2";
}

class MilkDecorator implements Coffee {
  final Coffee coffee;

  MilkDecorator(this.coffee);

  @override
  String cost() => coffee.cost().replaceFirst('\$', '\$') + " + Milk (\$1)";
}

//Allows you to dynamically add behavior to objects by wrapping 
//them with decorator classes that implement the same interface.

//7.2. Text Formatting
//Apply bold and italic formatting to text dynamically.
abstract class Text {
  String render();
}

class PlainText implements Text {
  final String content;

  PlainText(this.content);

  @override
  String render() => content;
}

class BoldDecorator implements Text {
  final Text text;

  BoldDecorator(this.text);

  @override
  String render() => "<b>${text.render()}</b>";
}

class ItalicDecorator implements Text {
  final Text text;

  ItalicDecorator(this.text);

  @override
  String render() => "<i>${text.render()}</i>";
}

//7.3. Logging Requests
//Add logging behavior to a request handler.
abstract class RequestHandler {
  void handle(String request);
}

class BasicHandler implements RequestHandler {
  @override
  void handle(String request) {
    print("Handling request: $request");
  }
}

class LoggingHandler implements RequestHandler {
  final RequestHandler wrapped;

  LoggingHandler(this.wrapped);

  @override
  void handle(String request) {
    print("LOG: Request received - $request");
    wrapped.handle(request);
  }
}

//7.4. User Access Rights
//Add role-based access checks to a user.
abstract class User {
  void accessSystem();
}

class BasicUser implements User {
  @override
  void accessSystem() {
    print("Accessing system...");
  }
}

class AdminAccessDecorator implements User {
  final User user;

  AdminAccessDecorator(this.user);

  @override
  void accessSystem() {
    user.accessSystem();
    print("Admin privileges granted.");
  }
}

//7.5. Online Store Discounts
//Add discount features to a product dynamically.
abstract class Product {
  double getPrice();
  String getLabel();
}

class BaseProduct implements Product {
  final String name;
  final double price;

  BaseProduct(this.name, this.price);

  @override
  double getPrice() => price;

  @override
  String getLabel() => name;
}

class PercentageDiscount implements Product {
  final Product product;
  final double percent;

  PercentageDiscount(this.product, this.percent);

  @override
  double getPrice() => product.getPrice() * (1 - percent);

  @override
  String getLabel() => "${product.getLabel()} (Discounted)";
}