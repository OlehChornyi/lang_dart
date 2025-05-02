void main(List<String> args) {
  print(removeDuplicates([1, 2, 2, 3, 3, 4])); 
  print(union({1, 2, 3}, {3, 4, 5}));
  print(intersection({1, 2, 3}, {2, 3, 4}));
  print(difference({1, 2, 3}, {2, 3, 4}));
  print(isSubset({1, 2, 3, 4}, {2, 3}));
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