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
  print(mergeSorted([1, 3, 5], [2, 4, 6]));
  print(firstNonRepeating("swiss"));
  print(isRotation("abcde", "cdeab"));
  print(sumDiagonals([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]));
  //-------------------
  var stack = Stack<int>();
  stack.push(10);
  stack.push(20);
  print(stack.peek());
  print(stack.pop());
  print(stack.pop()); 
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

//36. Merge two sorted lists into a single sorted list.
List<int> mergeSorted(List<int> a, List<int> b) {
  int i = 0, j = 0;
  List<int> result = [];
  while (i < a.length && j < b.length) {
    if (a[i] < b[j]) {
      result.add(a[i++]);
    } else {
      result.add(b[j++]);
    }
  }
  result.addAll(a.sublist(i));
  result.addAll(b.sublist(j));
  return result;
}

//37. Find the first non-repeating character in a string.
String? firstNonRepeating(String input) {
  var freq = <String, int>{};
  for (var ch in input.split('')) {
    freq[ch] = (freq[ch] ?? 0) + 1;
  }
  return input.split('').firstWhere((ch) => freq[ch] == 1, orElse: () => '');
}

//38. Write a function to check if one string is a rotation of another.
bool isRotation(String a, String b) {
  if (a.length != b.length) return false;
  return (a + a).contains(b);
}

//39. Given a square matrix, return the sum of its main and secondary diagonals.
int sumDiagonals(List<List<int>> matrix) {
  int n = matrix.length;
  int sum = 0;
  for (int i = 0; i < n; i++) {
    sum += matrix[i][i]; // main diagonal
    sum += matrix[i][n - i - 1]; // secondary diagonal
  }
  if (n % 2 == 1) {
    sum -= matrix[n ~/ 2][n ~/ 2]; // avoid double-counting center
  }
  return sum;
}

//40. Implement a Simple Stack Class
//Implement a generic stack class with push, pop, and peek.
class Stack<T> {
  final List<T> _items = [];

  void push(T value) => _items.add(value);
  T pop() => _items.removeLast();
  T peek() => _items.last;
  bool get isEmpty => _items.isEmpty;
}