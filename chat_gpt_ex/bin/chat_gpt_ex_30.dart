void main(List<String> args) {
  var rect = Rectangle(5, 3);
  print(rect.area());
  print(isWeekend(Weekday.Sunday));
  print(sumList([1, 2, 3, 4, 5])); 
  print(isPangram("The quick brown fox jumps over the lazy dog"));
  var counter = makeCounter();
  print(counter());
  print(counter()); 
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


