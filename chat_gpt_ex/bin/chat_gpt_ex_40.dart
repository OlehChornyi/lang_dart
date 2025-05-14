void main(List<String> args) async {
  print(reverse("Dart")); 
  print(removeNulls([1, null, 2, null, 3])); 
  print(longestWord("Find the longest word here"));
  print(groupByLength(["cat", "dog", "apple", "hi", "hat"]));
  //-------------------
  var sw = Stopwatch();
  sw.start();
  await Future.delayed(Duration(seconds: 1));
  sw.stop();
  print(sw.elapsed);
  //------------------
}

//Here are 10 more Dart exercises, covering a mix of 
//algorithmic thinking, string manipulation, recursion, 
//OOP, and functional programming concepts. 

//31. Reverse a String
String reverse(String input) {
  return input.split('').reversed.join();
}

//32. Remove Null Values from a List
List<T> removeNulls<T>(List<T?> list) {
  return list.whereType<T>().toList();
}

//33. Find the Longest Word in a Sentence
String longestWord(String sentence) {
  var words = sentence.split(RegExp(r'\s+'));
  words.sort((a, b) => b.length.compareTo(a.length));
  return words.first;
}

//34. Group Words by Length
Map<int, List<String>> groupByLength(List<String> words) {
  var map = <int, List<String>>{};
  for (var word in words) {
    map.putIfAbsent(word.length, () => []).add(word);
  }
  return map;
}

//35. Create a Stopwatch Class
class Stopwatch {
  late DateTime _start;
  Duration? _elapsed;

  void start() => _start = DateTime.now();
  void stop() => _elapsed = DateTime.now().difference(_start);
  Duration? get elapsed => _elapsed;
}
