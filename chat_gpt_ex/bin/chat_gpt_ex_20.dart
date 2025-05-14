import 'dart:math';

void main(List<String> args) {
  print(removeDuplicates([1, 2, 2, 3, 4, 4, 5]));
  print(findCommon([1, 2, 3], [2, 3, 4]));
  print(charFrequency("hello"));
  var car = Car("Toyota", 2020);
  car.showDetails();
  print(divide(10, 0));
  print(sumEven([1, 2, 3, 4, 5]));
  print(findAnagrams("listen", ["enlist", "google", "inlets", "banana"]));
  print(
    flatten([
      [1, 2],
      [3, 4],
      [5],
    ]),
  );
  print(capitalizeWords("hello world from dart"));
  print(generatePassword(12)); 
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

//16. Return the sum of all even numbers in a list.
int sumEven(List<int> numbers) {
  return numbers.where((n) => n.isEven).fold(0, (a, b) => a + b);
}

//17. Find All Anagrams of a Word in a List
bool isAnagram(String a, String b) {
  var sa = a.split('')..sort();
  var sb = b.split('')..sort();
  return sa.join() == sb.join();
}

List<String> findAnagrams(String word, List<String> list) {
  return list.where((w) => isAnagram(word, w)).toList();
}

//18. Flatten a Nested List
//Write a function to flatten a nested list (one level deep).
List<T> flatten<T>(List<List<T>> nested) {
  return nested.expand((e) => e).toList();
}

//19. Capitalize Each Word in a Sentence
String capitalizeWords(String sentence) {
  return sentence
      .split(' ')
      .map(
        (word) =>
            word.isNotEmpty
                ? '${word[0].toUpperCase()}${word.substring(1)}'
                : '',
      )
      .join(' ');
}

//20. Generate a Random Password
String generatePassword(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rand = Random();
  return List.generate(length, (index) => chars[rand.nextInt(chars.length)])
      .join();
}
