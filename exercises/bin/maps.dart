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