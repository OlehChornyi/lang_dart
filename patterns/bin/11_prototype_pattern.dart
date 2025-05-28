void main(List<String> args) {
  Circle original = Circle(10);
  Circle copy = original.clone();
  copy.radius = 20;

  original.draw();
  copy.draw(); 
  //----------------
  var user1 = UserProfile("Alice", 25, ["reading", "coding"]);
  var user2 = user1.clone();
  user2.name = "Bob";
  user2.interests.add("gaming");

  print(user1.name);
  print(user2.name);

  print(user1.interests);
  print(user2.interests);
  //----------------
  GameCharacter warrior = GameCharacter("Warrior", 100, 75);
  GameCharacter eliteWarrior = warrior.clone();
  eliteWarrior.power = 120;

  print("${warrior.type}: ${warrior.power}");      
  print("${eliteWarrior.type}: ${eliteWarrior.power}");
  //----------------
  Document invoiceTemplate = Document("Invoice", "Template Content");
  Document invoice1 = invoiceTemplate.clone();
  invoice1.content = "Invoice for John Doe";

  Document invoice2 = invoiceTemplate.clone();
  invoice2.content = "Invoice for Jane Doe";

  print(invoice1.content);
  print(invoice2.content);
  //----------------
  AppSettings defaultSettings = AppSettings(false, "en", true);

  AppSettings testSettings = defaultSettings.clone();
  testSettings.language = "fr";
  testSettings.darkMode = true;

  print("Default: ${defaultSettings.language}, DarkMode: ${defaultSettings.darkMode}");
  print("Test: ${testSettings.language}, DarkMode: ${testSettings.darkMode}");
}

//The Prototype pattern allows you to create new objects 
//by cloning existing ones, instead of creating them from scratch. 
//It’s useful when:
//Object creation is expensive.
//You need many similar objects.

//11.1. Clone a Shape Object
//Clone a shape and customize its properties without affecting the original.
abstract class Shape {
  Shape clone();
  void draw();
}

class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  Circle clone() => Circle(radius);

  @override
  void draw() {
    print("Drawing Circle with radius: $radius");
  }
}

//11.2. Clone User Profile
//Duplicate a user profile with minor adjustments.
class UserProfile {
  String name;
  int age;
  List<String> interests;

  UserProfile(this.name, this.age, this.interests);

  UserProfile clone() => UserProfile(
        name,
        age,
        List.from(interests),
      );
}

//11.3. Clone Game Character
//Create variations of a game character based on a base template.
class GameCharacter {
  String type;
  int health;
  int power;

  GameCharacter(this.type, this.health, this.power);

  GameCharacter clone() => GameCharacter(type, health, power);
}

//11.4. Clone Document Template
//Duplicate a document with template text.
class Document {
  String title;
  String content;

  Document(this.title, this.content);

  Document clone() => Document(title, content);
}

//11.5. Clone Settings Configuration
//Clone app settings and apply changes per environment.
class AppSettings {
  bool darkMode;
  String language;
  bool notificationsEnabled;

  AppSettings(this.darkMode, this.language, this.notificationsEnabled);

  AppSettings clone() =>
      AppSettings(darkMode, language, notificationsEnabled);
}