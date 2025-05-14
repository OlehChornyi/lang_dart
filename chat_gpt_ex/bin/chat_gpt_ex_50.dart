void main(List<String> args) {
  print(mapToQueryString({'name': 'Alice', 'age': '30'}));
  print(removeDuplicates([1, 2, 2, 3, 1, 4]));
  print(celsiusToFahrenheit(25));
  print(findDivisors(12));
  print(capitalizeWords("hello world from dart"));
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