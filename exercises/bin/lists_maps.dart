void main(List<String> args) {
  //Here goes the implementation of the methods
  print(countFrequencies(["a", "b", "a", "c", "b", "a"]));
  print(wordLengths(["apple", "banana", "fig"]));
  print(groupByFirstLetter(["apple", "art", "banana", "bat", "car"]));
  print(findDuplicates([1, 2, 2, 3, 3, 3]));
  print(indexMap(["a", "b", "c"]));
}

//6. Count Frequency of Each Element in a List
Map<T, int> countFrequencies<T>(List<T> list) {
  var freq = <T, int>{};
  for (var item in list) {
    freq[item] = (freq[item] ?? 0) + 1;
  }
  return freq;
}

//7. Map Words to Their Lengths
Map<String, int> wordLengths(List<String> words) {
  return Map.fromEntries(words.map((w) => MapEntry(w, w.length)));
}

//8. Group Words by Their First Letter
Map<String, List<String>> groupByFirstLetter(List<String> words) {
  var result = <String, List<String>>{};
  for (var word in words) {
    var key = word[0].toLowerCase();
    result.putIfAbsent(key, () => []).add(word);
  }
  return result;
}

//9. Find Elements That Appear More Than Once in a List
List<T> findDuplicates<T>(List<T> list) {
  var freq = countFrequencies(list);
  return freq.entries.where((e) => e.value > 1).map((e) => e.key).toList();
}

//10. Create Map from Index to Element in List
Map<int, T> indexMap<T>(List<T> list) {
  return Map.fromIterables(List.generate(list.length, (i) => i), list);
}