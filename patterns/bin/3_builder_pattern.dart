void main(List<String> args) {
  final burger = BurgerBuilder().addCheese().addBacon().build();
  print("Burger has cheese: ${burger.cheese}, bacon: ${burger.bacon}");
  //-------------------
  final user =
      UserBuilder("Alice").setAge(30).setEmail("alice@mail.com").build();
  print("User: ${user.name}, Age: ${user.age}, Email: ${user.email}");
  //-------------------
  final pizza = PizzaBuilder().addCheese().addMushrooms().build();
  print(
    "Pizza with cheese: ${pizza.cheese}, pepperoni: ${pizza.pepperoni}, mushrooms: ${pizza.mushrooms}",
  );
  //-------------------
  final car = CarBuilder("Sedan").addGPS().addSportPackage().build();
  print("Car model: ${car.model}, GPS: ${car.gps}, Sport: ${car.sportPackage}");
  //-------------------
  final page =
      HtmlBuilder()
          .setTitle("Welcome")
          .setBody("<h1>Hello, world!</h1>")
          .build();

  print(
    "<html><head><title>${page.title}</title></head><body>${page.body}</body></html>",
  );
  //-------------------
  final house = HouseBuilder().addKitchen().addBathroom().build();
  print(
    "House - Kitchen: ${house.kitchen}, Bathroom: ${house.bathroom}, Garden: ${house.garden}",
  );
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

//3.2. Build a User Profile
//Use a builder to create a user with optional fields.
class User {
  final String name;
  final int? age;
  final String? email;

  User._builder(UserBuilder builder)
    : name = builder.name,
      age = builder.age,
      email = builder.email;
}

class UserBuilder {
  final String name;
  int? age;
  String? email;

  UserBuilder(this.name);

  UserBuilder setAge(int age) {
    this.age = age;
    return this;
  }

  UserBuilder setEmail(String email) {
    this.email = email;
    return this;
  }

  User build() => User._builder(this);
}

//3.3. Pizza Builder
//Build a pizza with custom toppings.
class Pizza {
  final bool cheese;
  final bool pepperoni;
  final bool mushrooms;

  Pizza._builder(PizzaBuilder builder)
    : cheese = builder.cheese,
      pepperoni = builder.pepperoni,
      mushrooms = builder.mushrooms;
}

class PizzaBuilder {
  bool cheese = false;
  bool pepperoni = false;
  bool mushrooms = false;

  PizzaBuilder addCheese() {
    cheese = true;
    return this;
  }

  PizzaBuilder addPepperoni() {
    pepperoni = true;
    return this;
  }

  PizzaBuilder addMushrooms() {
    mushrooms = true;
    return this;
  }

  Pizza build() => Pizza._builder(this);
}

//3.4. Car Builder
//Construct a car with multiple optional features.
class Car {
  final String model;
  final bool sunroof;
  final bool gps;
  final bool sportPackage;

  Car._builder(CarBuilder builder)
    : model = builder.model,
      sunroof = builder.sunroof,
      gps = builder.gps,
      sportPackage = builder.sportPackage;
}

class CarBuilder {
  final String model;
  bool sunroof = false;
  bool gps = false;
  bool sportPackage = false;

  CarBuilder(this.model);

  CarBuilder addSunroof() {
    sunroof = true;
    return this;
  }

  CarBuilder addGPS() {
    gps = true;
    return this;
  }

  CarBuilder addSportPackage() {
    sportPackage = true;
    return this;
  }

  Car build() => Car._builder(this);
}

//3.5. HTML Page Builder
//Build a simple HTML page structure.
class HtmlPage {
  final String title;
  final String body;

  HtmlPage._builder(HtmlBuilder builder)
    : title = builder.title,
      body = builder.body;
}

class HtmlBuilder {
  String title = "";
  String body = "";

  HtmlBuilder setTitle(String title) {
    this.title = title;
    return this;
  }

  HtmlBuilder setBody(String body) {
    this.body = body;
    return this;
  }

  HtmlPage build() => HtmlPage._builder(this);
}

//3.6. House Builder
//Construct a house with optional rooms and features.
class House {
  final bool kitchen;
  final bool bathroom;
  final bool garden;

  House._builder(HouseBuilder builder)
    : kitchen = builder.kitchen,
      bathroom = builder.bathroom,
      garden = builder.garden;
}

class HouseBuilder {
  bool kitchen = false;
  bool bathroom = false;
  bool garden = false;

  HouseBuilder addKitchen() {
    kitchen = true;
    return this;
  }

  HouseBuilder addBathroom() {
    bathroom = true;
    return this;
  }

  HouseBuilder addGarden() {
    garden = true;
    return this;
  }

  House build() => House._builder(this);
}
