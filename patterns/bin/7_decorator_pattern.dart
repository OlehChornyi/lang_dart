void main(List<String> args) {
  final coffee = MilkDecorator(BasicCoffee());
  print("Cost: ${coffee.cost()}");
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