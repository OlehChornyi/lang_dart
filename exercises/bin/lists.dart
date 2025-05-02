void main(List<String> args) {
  print(findMax([2, 9, 3, 7]));
  print(removeDuplicates([1, 2, 2, 3, 1]));
  print(sumList([5, 10, 15]));
  print(filterEven([1, 2, 3, 4, 5, 6]));
  print(sortList([4, 2, 7, 1])); 
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