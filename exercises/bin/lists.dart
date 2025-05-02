void main(List<String> args) {
  print(findMax([2, 9, 3, 7]));
  print(removeDuplicates([1, 2, 2, 3, 1]));
  print(sumList([5, 10, 15]));
  print(filterEven([1, 2, 3, 4, 5, 6]));
  print(sortList([4, 2, 7, 1])); 
  print(reverseList(["a", "b", "c"]));
  print(frequency(["a", "b", "a", "c", "b", "b"]));
  print(mergeUnique([1, 2, 3], [3, 4, 5]));
  print(areListsEqual([1, 2, 3], [1, 2, 3]));
  print(areListsEqual([1, 2, 3], [3, 2, 1]));
  print(flatten([1, [2, [3, 4], 5], 6]));
}

//Exercise 1: Find the Maximum Number in a List
int findMax(List<int> numbers) {
  return numbers.reduce((a, b) => a > b ? a : b);
}

//Exercise 2: Remove Duplicates from a List
List<T> removeDuplicates<T>(List<T> list) {
  return list.toSet().toList();
}

//Exercise 3: Find the Sum of All Elements
int sumList(List<int> numbers) {
  return numbers.fold(0, (sum, element) => sum + element);
}

//Exercise 4: Filter Even Numbers
List<int> filterEven(List<int> numbers) {
  return numbers.where((n) => n % 2 == 0).toList();
}

//Exercise 5: Sort a List in Ascending Order
List<int> sortList(List<int> numbers) {
  numbers.sort();
  return numbers;
}

//Exercise 6: Reverse a List
List<T> reverseList<T>(List<T> list) {
  return list.reversed.toList();
}

//Exercise 7: Find the Frequency of Each Element
Map<T, int> frequency<T>(List<T> list) {
  Map<T, int> freq = {};
  for (var item in list) {
    freq[item] = (freq[item] ?? 0) + 1;
  }
  return freq;
}

//Exercise 8: Merge Two Lists Without Duplicates
List<T> mergeUnique<T>(List<T> list1, List<T> list2) {
  return {...list1, ...list2}.toList();
}

//Exercise 9: Check if Two Lists Are Equal (Order Matters)
bool areListsEqual<T>(List<T> a, List<T> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

//Exercise 10: Flatten a Nested List
List flatten(List nestedList) {
  List result = [];
  for (var element in nestedList) {
    if (element is List) {
      result.addAll(flatten(element));
    } else {
      result.add(element);
    }
  }
  return result;
}