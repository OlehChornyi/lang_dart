void main(List<String> args) {
  printMap({"Alice": 30, "Bob": 25});
  print(findAge({"Alice": 30, "Bob": 25}, "Bob")); 
  var people = {"Alice": 30};
  addEntry(people, "Bob", 25);
  print(people);
  var data = {"a": 1, "b": 2};
  removeKey(data, "a");
  print(data);
  print(containsKey({"x": 100, "y": 200}, "y"));
  print(wordFrequency(["apple", "banana", "apple", "apple", "banana"]));
  print(getKeys({"name": "Alice", "age": 30}));
  print(getValues({"x": 10, "y": 20}));
  var scores = {"math": 90, "science": 85};
  updateValue(scores, "math", 95);
  print(scores); 
  var map1 = {"a": 1, "b": 2};
  var map2 = {"b": 3, "c": 4};
  print(mergeMaps(map1, map2));
}

//Exercise 1: Create a Map and Print All Key-Value Pairs
void printMap(Map<String, int> map) {
  map.forEach((key, value) {
    print("$key: $value");
  });
}

//Exercise 2: Find a Value by Key
int? findAge(Map<String, int> map, String name) {
  return map[name];
}

//Exercise 3: Add a New Key-Value Pair to a Map
void addEntry(Map<String, int> map, String key, int value) {
  map[key] = value;
}

//Exercise 4: Remove a Key from a Map
void removeKey(Map<String, int> map, String key) {
  map.remove(key);
}

//Exercise 5: Check if a Key Exists in a Map
bool containsKey(Map map, dynamic key) {
  return map.containsKey(key);
}

//Exercise 6: Count How Many Times Each Word Appears
Map<String, int> wordFrequency(List<String> words) {
  Map<String, int> freq = {};
  for (var word in words) {
    freq[word] = (freq[word] ?? 0) + 1;
  }
  return freq;
}

//Exercise 7: Get All Keys from a Map
List<K> getKeys<K, V>(Map<K, V> map) {
  return map.keys.toList();
}

//Exercise 8: Get All Values from a Map
List<V> getValues<K, V>(Map<K, V> map) {
  return map.values.toList();
}

//Exercise 9: Update the Value for a Specific Key
void updateValue(Map<String, int> map, String key, int newValue) {
  if (map.containsKey(key)) {
    map[key] = newValue;
  }
}

//Exercise 10: Merge Two Maps
Map<K, V> mergeMaps<K, V>(Map<K, V> a, Map<K, V> b) {
  return {...a, ...b};
}

