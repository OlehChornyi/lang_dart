void main(List<String> args) {
  var l1 = Level1Support();
  var l2 = Level2Support();
  var manager = Manager();

  l1.setNext(l2);
  l2.setNext(manager);

  l1.handle("password reset");     
  l1.handle("network issue");    
  l1.handle("refund request");
  //-------------------
  var info = InfoLogger();
  var warn = WarningLogger();
  var error = ErrorLogger();

  info.setNext(warn);
  warn.setNext(error);

  info.log(LogLevel.info, "All systems running");
  info.log(LogLevel.warning, "Memory usage high");
  info.log(LogLevel.error, "Disk failure");
  //------------------
  var ip = IPCheck();
  var user = UserCheck();
  var admin = AdminCheck();

  ip.linkWith(user).linkWith(admin);

  ip.check("admin", "192.168.1.1"); 
  ip.check("guest", "192.168.1.1");
  ip.check("admin", "127.0.0.1"); 
  //------------------
  var loyalty = LoyaltyDiscount();
  var bulk = BulkDiscount();
  var promo = PromoCodeDiscount();

  loyalty.linkWith(bulk).linkWith(promo);

  double originalPrice = 600;
  double finalPrice = loyalty.applyDiscount(originalPrice);

  print("Final Price: \$${finalPrice.toStringAsFixed(2)}");
  //-------------------
  var blacklist = BlacklistFilter();
  var link = LinkFilter();
  var safe = SafeFilter();

  blacklist.setNext(link);
  link.setNext(safe);

  blacklist.handle("Get cheap viagra now!");
  blacklist.handle("Visit http://scam.com now!");
  blacklist.handle("Hello friend, how are you?");
}

//The Chain of Responsibility pattern allows you to pass a request 
//along a chain of handlers. Each handler decides either to process 
//the request or to pass it to the next handler in the chain.

//12.1. Support Ticket System
//Pass support tickets through handlers (Level 1 → Level 2 → Manager).
abstract class SupportHandler {
  SupportHandler? nextHandler;

  void setNext(SupportHandler handler) {
    nextHandler = handler;
  }

  void handle(String issue);
}

class Level1Support extends SupportHandler {
  @override
  void handle(String issue) {
    if (issue.contains("password")) {
      print("Level 1 resolved: $issue");
    } else {
      nextHandler?.handle(issue);
    }
  }
}

class Level2Support extends SupportHandler {
  @override
  void handle(String issue) {
    if (issue.contains("network")) {
      print("Level 2 resolved: $issue");
    } else {
      nextHandler?.handle(issue);
    }
  }
}

class Manager extends SupportHandler {
  @override
  void handle(String issue) {
    print("Manager resolved: $issue");
  }
}

//12.2. Logging System
//Chain loggers with different severity: Info → Warning → Error.
enum LogLevel { info, warning, error }

abstract class Logger {
  LogLevel level;
  Logger? next;

  Logger(this.level);

  void setNext(Logger logger) {
    next = logger;
  }

  void log(LogLevel msgLevel, String message) {
    if (msgLevel.index >= level.index) {
      write(message);
    }
    next?.log(msgLevel, message);
  }

  void write(String message);
}

class InfoLogger extends Logger {
  InfoLogger() : super(LogLevel.info);

  @override
  void write(String message) => print("INFO: $message");
}

class WarningLogger extends Logger {
  WarningLogger() : super(LogLevel.warning);

  @override
  void write(String message) => print("WARNING: $message");
}

class ErrorLogger extends Logger {
  ErrorLogger() : super(LogLevel.error);

  @override
  void write(String message) => print("ERROR: $message");
}

//12.3.Authentication Middleware
//Process login request through middleware: IP check → 
//Credentials check → Admin check.
abstract class Middleware {
  Middleware? next;

  Middleware linkWith(Middleware next) {
    this.next = next;
    return next;
  }

  bool check(String username, String ip);

  bool nextCheck(String username, String ip) {
    return next?.check(username, ip) ?? true;
  }
}

class IPCheck extends Middleware {
  @override
  bool check(String username, String ip) {
    if (ip == "127.0.0.1") {
      print("IP blocked");
      return false;
    }
    return nextCheck(username, ip);
  }
}

class UserCheck extends Middleware {
  @override
  bool check(String username, String ip) {
    if (username != "admin") {
      print("User not recognized");
      return false;
    }
    return nextCheck(username, ip);
  }
}

class AdminCheck extends Middleware {
  @override
  bool check(String username, String ip) {
    print("Admin authenticated");
    return true;
  }
}

//12.4. Order Discount Pipeline
//Apply a chain of discounts: loyalty → bulk → promo.
abstract class DiscountHandler {
  DiscountHandler? next;

  DiscountHandler linkWith(DiscountHandler nextHandler) {
    next = nextHandler;
    return nextHandler;
  }

  double applyDiscount(double price);

  double nextDiscount(double price) {
    return next?.applyDiscount(price) ?? price;
  }
}

class LoyaltyDiscount extends DiscountHandler {
  @override
  double applyDiscount(double price) {
    price *= 0.95;
    return nextDiscount(price);
  }
}

class BulkDiscount extends DiscountHandler {
  @override
  double applyDiscount(double price) {
    if (price > 500) price *= 0.90;
    return nextDiscount(price);
  }
}

class PromoCodeDiscount extends DiscountHandler {
  @override
  double applyDiscount(double price) {
    return price - 20;
  }
}

//12.5. Spam Filter Pipeline
//Filter emails through spam detection rules.
abstract class SpamFilter {
  SpamFilter? next;

  void setNext(SpamFilter handler) {
    next = handler;
  }

  void handle(String email);
}

class BlacklistFilter extends SpamFilter {
  @override
  void handle(String email) {
    if (email.contains("viagra")) {
      print("Blocked by blacklist");
    } else {
      next?.handle(email);
    }
  }
}

class LinkFilter extends SpamFilter {
  @override
  void handle(String email) {
    if (email.contains("http")) {
      print("Blocked due to suspicious links");
    } else {
      next?.handle(email);
    }
  }
}

class SafeFilter extends SpamFilter {
  @override
  void handle(String email) {
    print("Email passed: $email");
  }
}
