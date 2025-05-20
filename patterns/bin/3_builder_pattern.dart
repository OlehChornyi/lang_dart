void main(List<String> args) {
  final burger = BurgerBuilder().addCheese().addBacon().build();
  print("Burger has cheese: ${burger.cheese}, bacon: ${burger.bacon}");
}

//3. Builder Pattern
//Construct complex objects step by step.
class Burger {
  final bool cheese;
  final bool bacon;

  Burger._builder(BurgerBuilder builder)
      : cheese = builder.cheese,
        bacon = builder.bacon;
}

class BurgerBuilder {
  bool cheese = false;
  bool bacon = false;

  BurgerBuilder addCheese() {
    cheese = true;
    return this;
  }

  BurgerBuilder addBacon() {
    bacon = true;
    return this;
  }

  Burger build() => Burger._builder(this);
}