void main(List<String> args) {
  print(mapToQueryString({'name': 'Alice', 'age': '30'}));
  print(removeDuplicates([1, 2, 2, 3, 1, 4]));
  print(celsiusToFahrenheit(25));
  print(findDivisors(12));
  print(capitalizeWords("hello world from dart"));
  //-------------------
  print(median([1, 3, 2])); 
  print(median([1, 2, 3, 4]));
  print(countWords("  This is   a test  ")); 
  //-------------------
  var queue = QueueWithStacks<int>();
  queue.enqueue(1);
  queue.enqueue(2);
  print(queue.dequeue());
  print(queue.dequeue());
  //-------------------
  print(isValidEmail("user@example.com"));
  print(isValidEmail("invalid@email")); 
  print(romanToInt("XIV"));
}

//Data manipulation, object-oriented programming, 
//error handling, functional constructs, and more.

//41. Convert a Map to a Query String
String mapToQueryString(Map<String, String> params) {
  return params.entries.map((e) => '${e.key}=${e.value}').join('&');
}

//42. Remove Duplicates from a List
List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
}

//43. Convert Celsius to Fahrenheit
double celsiusToFahrenheit(double celsius) => (celsius * 9 / 5) + 32;

//44. Find All Divisors of a Number
List<int> findDivisors(int n) {
  return List.generate(n, (i) => i + 1).where((i) => n % i == 0).toList();
}

//45. Capitalize the first letter of every word in a sentence.
String capitalizeWords(String sentence) {
  return sentence
      .split(' ')
      .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : '')
      .join(' ');
}

//46. Compute the median of a list of numbers.
double median(List<num> numbers) {
  var sorted = [...numbers]..sort();
  int mid = sorted.length ~/ 2;
  return sorted.length.isOdd
      ? sorted[mid].toDouble()
      : (sorted[mid - 1] + sorted[mid]) / 2;
}

//47. Count Words in a Sentence
int countWords(String sentence) {
  return sentence.trim().isEmpty
      ? 0
      : sentence.trim().split(RegExp(r'\s+')).length;
}

//48. Implement a Queue Using Two Stacks
//Use two stacks to simulate a queue’s enqueue and dequeue operations.
class QueueWithStacks<T> {
  final _inStack = <T>[];
  final _outStack = <T>[];

  void enqueue(T value) {
    _inStack.add(value);
  }

  T dequeue() {
    if (_outStack.isEmpty) {
      while (_inStack.isNotEmpty) {
        _outStack.add(_inStack.removeLast());
      }
    }
    return _outStack.removeLast();
  }
}

//49. Validate Email Format
bool isValidEmail(String email) {
  return RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(email);
}

//50. Convert Roman Numerals to Integers
int romanToInt(String s) {
  final map = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  };
  int total = 0;
  for (int i = 0; i < s.length; i++) {
    int current = map[s[i]]!;
    int next = i + 1 < s.length ? map[s[i + 1]]! : 0;
    total += current < next ? -current : current;
  }
  return total;
}

