void main(List<String> args) {
  var original = ProfileSettings(theme: "Dark", language: "EN");
  var duplicate = original.clone();

  print(original.theme);
  print(duplicate.language);
  //-------------------
  var baseCard = CardConfig(backgroundColor: 'Colors.white', elevation: 2, label: "Base Card");

  var promoCard = baseCard.clone();
  promoCard = CardConfig(
    backgroundColor: 'Colors.yellow',
    elevation: promoCard.elevation,
    label: "Promo Card",
  );

  print(promoCard.label);
  //-------------------
  var baseItem = ListItem(title: "Item", icon: 'Icon(Icons.star)');

  var items = List.generate(5, (i) {
    var cloned = baseItem.clone();
    return ListItem(title: "${cloned.title} ${i + 1}", icon: cloned.icon);
  });

  for (var item in items) {
    print(item.title);
  }
  //-------------------
  var baseButton = ButtonConfig(color: 'Colors.blue', icon: 'Icons.add', tooltip: "Add Item");

  var deleteButton = baseButton.clone();
  deleteButton = ButtonConfig(color: 'Colors.red', icon: 'Icons.delete', tooltip: "Delete Item");

  print(deleteButton.tooltip);
  //-------------------
  var template = AppNotification(title: "Update Available", body: "Tap to update");

  var userNotif = template.clone();
  userNotif = AppNotification(title: "Welcome!", body: "Thanks for joining!", isRead: false);

  print(userNotif.title);
}

//The Prototype Pattern allows objects to be cloned (i.e., copied)
//without knowing their exact types. It is useful in Flutter when
//creating reusable UI components, configuration templates, or
//data models that can be cloned and customized.

//11.1. Clone User Profile Settings
//Let the user duplicate profile settings (e.g., theme, language).
abstract class ProfileSettingsPrototype {
  ProfileSettingsPrototype clone();
}

class ProfileSettings implements ProfileSettingsPrototype {
  String theme;
  String language;

  ProfileSettings({required this.theme, required this.language});

  @override
  ProfileSettings clone() {
    return ProfileSettings(theme: theme, language: language);
  }
}

//11.2. Clone Widget Configuration for Cards
//Clone a base card configuration and change just one field.
abstract class CardConfigPrototype {
  CardConfigPrototype clone();
}

class CardConfig implements CardConfigPrototype {
  final String backgroundColor;
  final double elevation;
  final String label;

  CardConfig({
    required this.backgroundColor,
    required this.elevation,
    required this.label,
  });

  @override
  CardConfig clone() {
    return CardConfig(
      backgroundColor: backgroundColor,
      elevation: elevation,
      label: label,
    );
  }
}

//11.3. Clone List Items with Modified Data
//Efficiently create multiple UI items from a prototype item.
class ListItem implements Cloneable<ListItem> {
  final String title;
  final String icon;

  ListItem({required this.title, required this.icon});

  @override
  ListItem clone() {
    return ListItem(title: title, icon: icon);
  }
}

abstract class Cloneable<T> {
  T clone();
}

//11.4. Clone Button Configuration (e.g., FAB)
//Create variations of a base button configuration.
class ButtonConfig implements Cloneable<ButtonConfig> {
  final String color;
  final String icon;
  final String tooltip;

  ButtonConfig({required this.color, required this.icon, required this.tooltip});

  @override
  ButtonConfig clone() {
    return ButtonConfig(color: color, icon: icon, tooltip: tooltip);
  }
}

//11.5. Clone App Notification Template
//Use a base notification model to quickly create new variants.
class AppNotification implements Cloneable<AppNotification> {
  String title;
  String body;
  bool isRead;

  AppNotification({required this.title, required this.body, this.isRead = false});

  @override
  AppNotification clone() {
    return AppNotification(title: title, body: body, isRead: isRead);
  }
}
