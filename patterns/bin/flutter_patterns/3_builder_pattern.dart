void main(List<String> args) {
  final profile = UserProfileCardBuilder('Alice', 'avatar.png')
      .setBio("Flutter Developer")
      .enableFollowButton()
      .build();

  profile.render();
  //-------------------
  final cart = CartSummaryBuilder()
      .addItem("Shoes", 50.0)
      .addItem("T-shirt", 20.0)
      .applyDiscount(5.0)
      .applyTax(3.5)
      .build();

  cart.printSummary();
  //--------------------
  final page = AppPageBuilder('Home')
      .withAppBar()
      .withBottomNav()
      .build();

  page.buildPage();
  //--------------------
  final notification = NotificationBuilder('New Message', 'You have 1 unread message.')
      .setIcon('message_icon.png')
      .enableVibration()
      .build();

  notification.send();
  //--------------------
  final form = FormBuilder()
      .addTextField("Name")
      .addEmailField("Email")
      .addPasswordField("Password")
      .build();

  form.render();
}

//3.1. Building a Custom User Profile Card
//Use the builder pattern to create a customizable UserProfileCard.
class UserProfileCard {
  final String name;
  final String avatarUrl;
  final String? bio;
  final bool showFollowButton;

  UserProfileCard._builder(UserProfileCardBuilder builder)
      : name = builder.name,
        avatarUrl = builder.avatarUrl,
        bio = builder.bio,
        showFollowButton = builder.showFollowButton;

  void render() {
    print("Profile of $name with avatar $avatarUrl");
    if (bio != null) print("Bio: $bio");
    if (showFollowButton) print("Follow button displayed");
  }
}

class UserProfileCardBuilder {
  final String name;
  final String avatarUrl;
  String? bio;
  bool showFollowButton = false;

  UserProfileCardBuilder(this.name, this.avatarUrl);

  UserProfileCardBuilder setBio(String bio) {
    this.bio = bio;
    return this;
  }

  UserProfileCardBuilder enableFollowButton() {
    showFollowButton = true;
    return this;
  }

  UserProfileCard build() => UserProfileCard._builder(this);
}

//3.2. Build a Shopping Cart Summary
// Build a shopping cart summary with optional discount and tax.
class CartSummary {
  final List<String> items;
  final double total;
  final double? discount;
  final double? tax;

  CartSummary._builder(CartSummaryBuilder builder)
      : items = builder.items,
        total = builder.total,
        discount = builder.discount,
        tax = builder.tax;

  void printSummary() {
    print("Items: $items");
    print("Total: \$${total.toStringAsFixed(2)}");
    if (discount != null) print("Discount: \$${discount!.toStringAsFixed(2)}");
    if (tax != null) print("Tax: \$${tax!.toStringAsFixed(2)}");
  }
}

class CartSummaryBuilder {
  List<String> items = [];
  double total = 0.0;
  double? discount;
  double? tax;

  CartSummaryBuilder addItem(String item, double price) {
    items.add(item);
    total += price;
    return this;
  }

  CartSummaryBuilder applyDiscount(double value) {
    discount = value;
    total -= value;
    return this;
  }

  CartSummaryBuilder applyTax(double value) {
    tax = value;
    total += value;
    return this;
  }

  CartSummary build() => CartSummary._builder(this);
}

//3.3. Build an App Page Layout
//Use a builder to construct a dynamic page layout with optional elements.
class AppPage {
  final String title;
  final bool showAppBar;
  final bool showDrawer;
  final bool showBottomNav;

  AppPage._builder(AppPageBuilder builder)
      : title = builder.title,
        showAppBar = builder.showAppBar,
        showDrawer = builder.showDrawer,
        showBottomNav = builder.showBottomNav;

  void buildPage() {
    print("Page: $title");
    if (showAppBar) print("AppBar displayed");
    if (showDrawer) print("Drawer displayed");
    if (showBottomNav) print("BottomNavigationBar displayed");
  }
}

class AppPageBuilder {
  final String title;
  bool showAppBar = false;
  bool showDrawer = false;
  bool showBottomNav = false;

  AppPageBuilder(this.title);

  AppPageBuilder withAppBar() {
    showAppBar = true;
    return this;
  }

  AppPageBuilder withDrawer() {
    showDrawer = true;
    return this;
  }

  AppPageBuilder withBottomNav() {
    showBottomNav = true;
    return this;
  }

  AppPage build() => AppPage._builder(this);
}

//3.4. Notification Builder
//Build custom in-app notifications.
class NotificationMessage {
  final String title;
  final String message;
  final String? icon;
  final bool vibrate;

  NotificationMessage._builder(NotificationBuilder builder)
      : title = builder.title,
        message = builder.message,
        icon = builder.icon,
        vibrate = builder.vibrate;

  void send() {
    print("[$title] $message");
    if (icon != null) print("Icon: $icon");
    if (vibrate) print("Vibration triggered.");
  }
}

class NotificationBuilder {
  final String title;
  final String message;
  String? icon;
  bool vibrate = false;

  NotificationBuilder(this.title, this.message);

  NotificationBuilder setIcon(String iconPath) {
    icon = iconPath;
    return this;
  }

  NotificationBuilder enableVibration() {
    vibrate = true;
    return this;
  }

  NotificationMessage build() => NotificationMessage._builder(this);
}

//3.5. FormBuilder for Dynamic Forms
//Simulate building a form dynamically.
class FormField {
  final String label;
  final String type;

  FormField(this.label, this.type);
}

class CustomForm {
  final List<FormField> fields;

  CustomForm._builder(FormBuilder builder) : fields = builder.fields;

  void render() {
    for (var field in fields) {
      print("Render ${field.type} field: ${field.label}");
    }
  }
}

class FormBuilder {
  List<FormField> fields = [];

  FormBuilder addTextField(String label) {
    fields.add(FormField(label, "Text"));
    return this;
  }

  FormBuilder addPasswordField(String label) {
    fields.add(FormField(label, "Password"));
    return this;
  }

  FormBuilder addEmailField(String label) {
    fields.add(FormField(label, "Email"));
    return this;
  }

  CustomForm build() => CustomForm._builder(this);
}