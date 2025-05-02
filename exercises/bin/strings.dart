void main(List<String> args) {
  print(reverseString("hello"));
  print(isPalindrome("Race car"));
  print(countVowels("Dart is awesome"));
  print(capitalizeWords("flutter is fun"));
  print(countCharacter("banana", "a"));
  print(removeDigits("abc123def456")); 
  print(replaceWord("hello world", "world", "Dart"));
  print(longestWord("I love programming in Dart"));
  print(isAlpha("Hello")); 
  print(isAlpha("Hello123"));
  print(removeDuplicates("programming")); 
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

//6. Remove all numbers from a string.
String removeDigits(String input) {
  return input.replaceAll(RegExp(r'\d'), '');
}

//7. Replace all instances of one substring with another.
String replaceWord(String input, String from, String to) {
  return input.replaceAll(from, to);
}

//8. Return the longest word from a sentence.
String longestWord(String sentence) {
  List<String> words = sentence.split(' ');
  return words.reduce((a, b) => a.length > b.length ? a : b);
}

//9. Return true if a string contains only letters.
bool isAlpha(String input) {
  return RegExp(r'^[a-zA-Z]+$').hasMatch(input);
}

//10. Remove all duplicate characters from a string.
String removeDuplicates(String input) {
  Set<String> seen = {};
  return input.split('').where((char) => seen.add(char)).join();
}

//---------------------------------------------------------------
/* 

RegExp: \s+
\s = matches any whitespace character (spaces, tabs, newlines).
+ = matches one or more of the preceding element.
So, \s+ matches one or more spaces/tabs/newlines in a row.

RegExp: [aeiouAEIOU]
[...] = character class: matches any one character inside the brackets.
aeiouAEIOU = includes all lowercase and uppercase vowels.

RegExp: \d
\d = matches any single digit (0–9).

RegExp: ^[a-zA-Z]+$
^ = start of string
[a-zA-Z] = matches any uppercase or lowercase letter.
+ = one or more of the previous character class.
$ = end of string

*/
