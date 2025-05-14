void main(List<String> args) {
  var rect = Rectangle(5, 3);
  print(rect.area());
  print(isWeekend(Weekday.Sunday));
  print(sumList([1, 2, 3, 4, 5])); 
  print(isPangram("The quick brown fox jumps over the lazy dog"));
  var counter = makeCounter();
  print(counter());
  print(counter()); 
  var users = [
    {'name': 'Alice', 'age': 20},
    {'name': 'Bob', 'age': 16}
  ];
  print(filterAdults(users));
  print(countOccurrences(['a', 'b', 'a', 'c', 'b', 'a']));
  greet("Alice");
  greet("Bob", age: 30); 
  var products = [
    {'name': 'Item A', 'price': 20},
    {'name': 'Item B', 'price': 10}
  ];
  sortByPrice(products);
  print(products); 
  var doubled = applyFunction([1, 2, 3], (x) => x * 2);
  print(doubled); 
}

//Here are 10 more Dart exercises that cover topics
//like classes, enums, file I/O (conceptually),
//higher-order functions, and more — ideal for
//strengthening your skills at the intermediate to advanced level.

//21. Implement a Rectangle Class
//Create a class Rectangle with width and height, and a method to calculate the area.
class Rectangle {
  double width, height;
  Rectangle(this.width, this.height);
  double area() => width * height;
}

//22. Use an Enum to Represent Weekdays
//Define an enum Weekday and print whether a day is a weekend.
enum Weekday { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

bool isWeekend(Weekday day) {
  return day == Weekday.Saturday || day == Weekday.Sunday;
}

//23. Sum of a List Using Reduce
int sumList(List<int> numbers) {
  return numbers.reduce((a, b) => a + b);
}

//24. Check if a String is a Pangram
//Write a function to check if a string contains every letter of the alphabet.
bool isPangram(String input) {
  input = input.toLowerCase();
  return 'abcdefghijklmnopqrstuvwxyz'.split('').every(input.contains);
}

//25. Create a Simple Counter with Closure
//Use closures to create a counter function that retains state.
Function makeCounter() {
  int count = 0;
  return () => ++count;
}

//26. Filter List of Maps by Property
//Filter a list of users (Map objects) by age > 18.
List<Map<String, dynamic>> filterAdults(List<Map<String, dynamic>> users) {
  return users.where((user) => user['age'] > 18).toList();
}

//27. Count Occurrences of Each Element in a List
Map<T, int> countOccurrences<T>(List<T> items) {
  var map = <T, int>{};
  for (var item in items) {
    map[item] = (map[item] ?? 0) + 1;
  }
  return map;
}

//28. Use Named and Optional Parameters
void greet(String name, {int? age}) {
  print("Hello $name${age != null ? ', age $age' : ''}!");
}

//29. Sort List of Maps by Key
//Sort a list of products by price.
void sortByPrice(List<Map<String, dynamic>> products) {
  products.sort((a, b) => a['price'].compareTo(b['price']));
}

//30. Create a Function That Applies a Function to a List
List<T> applyFunction<T>(List<T> list, T Function(T) func) {
  return list.map(func).toList();
}
