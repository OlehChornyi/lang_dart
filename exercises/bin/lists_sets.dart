void main(List<String> args) {
  //Here goes the implementation of the methods
  print(removeDuplicates([1, 2, 2, 3, 4, 4]));
  print(commonElements([1, 2, 3], [2, 3, 4]));
  print(difference([1, 2, 3], [2, 4])); 
  print(areAllUnique([1, 2, 3]));
  print(areAllUnique([1, 2, 2]));
  print(uniqueWords(["Apple", "apple", "Banana"]));
}

//1. Remove Duplicates from a List
List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
}

//2. Find Common Elements Between Two Lists
List<T> commonElements<T>(List<T> a, List<T> b) {
  return a.toSet().intersection(b.toSet()).toList();
}

//3. Find Elements Present in the First List but Not in the Second
List<T> difference<T>(List<T> a, List<T> b) {
  return a.toSet().difference(b.toSet()).toList();
}

//4. Check if All Elements in a List Are Unique
bool areAllUnique<T>(List<T> list) {
  return list.length == list.toSet().length;
}

//5. Convert List of Strings to Set of Unique Lowercase Words
Set<String> uniqueWords(List<String> words) {
  return words.map((word) => word.toLowerCase()).toSet();
}