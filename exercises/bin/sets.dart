void main(List<String> args) {
  print(removeDuplicates([1, 2, 2, 3, 3, 4])); 
  print(union({1, 2, 3}, {3, 4, 5}));
  print(intersection({1, 2, 3}, {2, 3, 4}));
  print(difference({1, 2, 3}, {2, 3, 4}));
  print(isSubset({1, 2, 3, 4}, {2, 3}));
  print(convertListToSetAndBack(["a", "b", "a", "c"]));
  print(areSetsEqual({1, 2, 3}, {3, 2, 1}));
  print(areSetsEqual({1, 2}, {1, 2, 3}));
  print(uniqueChars("hello"));
  print(countUnique([1, 2, 2, 3, 4, 4]));
  printSetElements({"apple", "banana", "cherry"});
}

//Exercise 1: Remove Duplicates from a List Using Set
List<T> removeDuplicates<T>(List<T> list) {
  return Set<T>.from(list).toList();
}

//Exercise 2: Find the Union of Two Sets
Set<T> union<T>(Set<T> a, Set<T> b) {
  return a.union(b);
}

//Exercise 3: Find the Intersection of Two Sets
Set<T> intersection<T>(Set<T> a, Set<T> b) {
  return a.intersection(b);
}

//Exercise 4: Find the Difference of Two Sets
Set<T> difference<T>(Set<T> a, Set<T> b) {
  return a.difference(b);
}

//Exercise 5: Check if One Set is a Subset of Another
bool isSubset<T>(Set<T> a, Set<T> b) {
  return a.containsAll(b);
}

//Exercise 6: Convert a List to a Set and Back
List<T> convertListToSetAndBack<T>(List<T> list) {
  return list.toSet().toList();
}

//Exercise 7: Check if Two Sets are Equal
bool areSetsEqual<T>(Set<T> a, Set<T> b) {
  return a.length == b.length && a.containsAll(b);
}

//Exercise 8: Find Unique Characters in a String
Set<String> uniqueChars(String input) {
  return input.split('').toSet();
}

//Exercise 9: Count Unique Elements in a List
int countUnique<T>(List<T> list) {
  return list.toSet().length;
}

//Exercise 10: Iterate Over a Set and Print Elements
void printSetElements<T>(Set<T> set) {
  for (var element in set) {
    print(element);
  }
}
