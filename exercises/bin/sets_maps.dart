void main(List<String> args) {
  //Here goes the implementation of the methods
  print(setToLengthMap({'apple', 'banana', 'kiwi'}));
  print(countWithSet(['a', 'b', 'a', 'c', 'b', 'a']));
  var map = {'a': 1, 'b': 2, 'c': 3};
  var allowed = {'a', 'c'};
  print(filterMapByKeys(map, allowed));
  var map1 = {'a': 1, 'b': 2, 'c': 1, 'd': 3};
  print(uniqueValueKeys(map1));
  var map2 = {'a': 1, 'b': 2, 'c': 1};
  print(invertMap(map2));
}

//1. Convert a Set to a Map with Values as Length of Each String
Map<String, int> setToLengthMap(Set<String> set) {
  return {for (var item in set) item: item.length};
}

//2. Count How Many Times Each Item Appears in a List Using Set and Map
Map<String, int> countWithSet(List<String> items) {
  Set<String> uniqueItems = items.toSet();
  Map<String, int> countMap = {};
  for (var item in uniqueItems) {
    countMap[item] = items.where((x) => x == item).length;
  }
  return countMap;
}

//3. Filter Map Entries Whose Keys Are in a Given Set
Map<String, int> filterMapByKeys(Map<String, int> map, Set<String> allowedKeys) {
  return Map.fromEntries(
    map.entries.where((entry) => allowedKeys.contains(entry.key)),
  );
}

//4. Find Keys in a Map Whose Values Are Unique (No Duplicates)
Set<String> uniqueValueKeys(Map<String, int> map) {
  var valueCounts = <int, int>{};
  for (var value in map.values) {
    valueCounts[value] = (valueCounts[value] ?? 0) + 1;
  }
  print(valueCounts);

  return map.entries
      .where((entry) => valueCounts[entry.value] == 1)
      .map((entry) => entry.key)
      .toSet();
}

//5. Invert a Map (Value → Set of Keys with That Value)
Map<int, Set<String>> invertMap(Map<String, int> map) {
  var result = <int, Set<String>>{};
  for (var entry in map.entries) {
    result.putIfAbsent(entry.value, () => {}).add(entry.key);
  }
  return result;
}
