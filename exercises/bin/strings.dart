void main(List<String> args) {
  print(reverseString("hello"));
  print(isPalindrome("Race car"));
  print(countVowels("Dart is awesome"));
  print(capitalizeWords("flutter is fun"));
  print(countCharacter("banana", "a"));
}

//1. Write a function that reverses a string.
String reverseString(String input) {
  return input.split('').reversed.join();
}

//2. Check whether a given string is a palindrome.
bool isPalindrome(String input) {
  String cleaned = input.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  print(cleaned);
  return cleaned == cleaned.split('').reversed.join();
}

//3. Count the number of vowels (a, e, i, o, u) in a string.
int countVowels(String input) {
  return RegExp(r'[aeiouAEIOU]').allMatches(input).length;
}

//4. Capitalize the first letter of each word in a string.
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

//5. Count how many times a specific character appears in a string.
int countCharacter(String input, String char) {
  return input.split('').where((c) => c == char).length;
}
