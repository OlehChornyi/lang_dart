void main(List<String> args) {
  print(removeDuplicates([1, 2, 2, 3, 4, 4, 5])); 
  print(findCommon([1, 2, 3], [2, 3, 4]));
  print(charFrequency("hello"));
  var car = Car("Toyota", 2020);
  car.showDetails();
  print(divide(10, 0));
}

//Focused on intermediate topics including collections, 
//OOP, error handling, and functional programming concepts.

//11. Remove Duplicates from a List
List<int> removeDuplicates(List<int> nums) {
  return nums.toSet().toList();
}

//12. Find Common Elements in Two Lists
List<T> findCommon<T>(List<T> a, List<T> b) {
  return a.toSet().intersection(b.toSet()).toList();
}

//13. Count Character Frequency
Map<String, int> charFrequency(String input) {
  final freq = <String, int>{};
  for (var ch in input.split('')) {
    freq[ch] = (freq[ch] ?? 0) + 1;
  }
  return freq;
}

//14. Create a Simple Class with a Method
//Create a Car class with fields and a method to display details.
class Car {
  String brand;
  int year;

  Car(this.brand, this.year);

  void showDetails() {
    print('Brand: $brand, Year: $year');
  }
}

//15. Handle Division with Exception Handling
//Write a function that divides two numbers and handles division by zero.
double? divide(int a, int b) {
  try {
    return a / b;
  } catch (e) {
    print('Error: $e');
    return double.nan;
  }
}
