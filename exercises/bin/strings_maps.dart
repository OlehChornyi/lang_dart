void main(List<String> args) {
  //Ussage of functions
  print(charFrequency("hello"));
  print(wordFrequency("This is a test this is only a test"));
  print(repeatedChars("success"));
  print(wordLengths("hello Dart language"));
  print(groupByFirstLetter("dart drive dog apple art"));
}

//11. Count Frequency of Each Character
Map<String, int> charFrequency(String input) {
  var map = <String, int>{};
  for (var ch in input.split('')) {
    map[ch] = (map[ch] ?? 0) + 1;
  }
  return map;
}

//12. Count Frequency of Each Word
Map<String, int> wordFrequency(String sentence) {
  var words = sentence.toLowerCase().split(' ');
  var map = <String, int>{};
  for (var word in words) {
    map[word] = (map[word] ?? 0) + 1;
  }
  return map;
}

//13. Find Characters That Appear More Than Once
Set<String> repeatedChars(String input) {
  var freq = charFrequency(input);
  return freq.entries
      .where((e) => e.value > 1)
      .map((e) => e.key)
      .toSet();
}

//14. Create a Map of Word Lengths
Map<String, int> wordLengths(String sentence) {
  return Map.fromEntries(
    sentence.split(' ').map((word) => MapEntry(word, word.length)),
  );
}

//15. Group Words by Their First Letter
Map<String, List<String>> groupByFirstLetter(String sentence) {
  var result = <String, List<String>>{};
  for (var word in sentence.split(' ')) {
    var key = word[0].toLowerCase();
    result.putIfAbsent(key, () => []).add(word);
  }
  return result;
}