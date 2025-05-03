void main(List<String> args) {
  //Ussage of functions
  print(uniqueChars("banana"));
  print(commonChars("hello", "world"));
  print(removeDuplicateWords("this is is a test test")); 
  print(countUniqueWords("Hello hello world world Dart"));
  print(diffChars("abcdef", "bdf"));
}

//6. Find Unique Characters in a String
Set<String> uniqueChars(String input) {
  return input.split('').toSet();
}

//7. Find Common Characters Between Two Strings
Set<String> commonChars(String a, String b) {
  return a.split('').toSet().intersection(b.split('').toSet());
}

//8. Remove Duplicate Words in a Sentence
String removeDuplicateWords(String sentence) {
  return sentence.split(' ').toSet().join(' ');
}

//9. Count Unique Words in a Sentence
int countUniqueWords(String sentence) {
  return sentence.toLowerCase().split(' ').toSet().length;
}

//10. Find Characters in First String but Not in Second
Set<String> diffChars(String a, String b) {
  return a.split('').toSet().difference(b.split('').toSet());
}
