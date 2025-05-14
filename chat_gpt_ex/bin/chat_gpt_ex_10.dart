void main(List<String> arguments) {
printFibonacci(10);
print(isPrime(2));
reverseString('hello');
print(factorial(3));
print(sumOfDigits(1234));
print(isPalindrome("racecar"));
print(countVowels("Dart Programming")); 
print(findLargest([3, 5, 7, 2, 9]));
print(squareList([1, 2, 3, 4]));
print(wordCount("This is a test. This test is easy."));
}

//1. Print Fibonacci Series (First N Numbers)
void printFibonacci(int n) {
  int a = 0, b = 1;
  for (int i = 0; i < n; i++) {
    print(a);
    int temp = a + b;
    a = b;
    b = temp;
  }
}

//2. Check Prime Number
bool isPrime(int number) {
  if (number < 2) return false;
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

//3. Reverse a String
String reverseString(String input) {
  String reversed = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reversed += input[i];
  }
  return reversed;
}

//4.Calculate the factorial of a number using recursion.
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}
///The factorial function is a mathematical formula 
///represented by an exclamation mark "!". 
///In the Factorial formula, you must multiply all the 
///integers and positives that exist between the number 
///that appears in the formula and the number 1. Here's an 
///example: 7! = 1 * 2 * 3 * 4 * 5 * 6 * 7 = 5.040.

//5.Write a function that returns the sum of the digits of a number.
int sumOfDigits(int number) {
  int sum = 0;
  while (number > 0) {
    sum += number % 10;
    print(sum);
    number ~/= 10;
  }
  return sum;
}

//6. Check if a string is a palindrome.
bool isPalindrome(String str) {
  String reversed = str.split('').reversed.join('');
  return str == reversed;
}

//7. Count Vowels in a String
int countVowels(String input) {
  final vowels = ['a', 'e', 'i', 'o', 'u'];
  int count = 0;
  for (var ch in input.toLowerCase().split('')) {
    if (vowels.contains(ch)) count++;
  }
  return count;
}

//8. Find the Largest Element in a List
int findLargest(List<int> numbers) {
  int max = numbers[0];
  for (var num in numbers) {
    if (num > max) max = num;
  }
  return max;
}

//9. Map List of Integers to Their Squares
List<int> squareList(List<int> numbers) {
  return numbers.map((n) => n * n).toList();
}

//10. Count Word Frequencies in a Sentence
Map<String, int> wordCount(String sentence) {
  String cleaned = sentence.replaceAll(RegExp(r'[^\w\s]'), '').toLowerCase();
  print(cleaned);
  var words = cleaned.split(RegExp(r'\s+'));
  var count = <String, int>{};
  for (var word in words) {
    count[word] = (count[word] ?? 0) + 1;
  }
  return count;
}
//RegExp(r'[^\w\s]') explained:
//This regular expression matches all characters that are NOT word characters or whitespace. Here's how:
//1. [...] – Character Class
//This defines a set of characters to match. Anything inside the square brackets is part of the match criteria.
//2. ^ (caret) – Negation (when inside brackets)
//When placed at the beginning of a character class, it negates the set. That means: “match anything not in this set.”
//3. \w – Word character
//This matches any "word" character: [a-zA-Z0-9_].
//Includes all letters (uppercase and lowercase), digits, and underscore.
//4. \s – Whitespace character
//This matches any whitespace: space, tab, newline, etc.

