void main(List<String> args) {
  Map<int, String> map = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};

  //CONSTRUCTORS (8)
  print(Map());
  print(Map.from(map));
  print(Map.fromEntries(map.entries));
  print(Map.fromIterable([1, 2, 3, 4, 5]));
  print(Map.fromIterables([1, 2, 3, 4, 5], [11, 22, 33, 44, 55]));
  print(Map.identity());
  print(Map.of(map));
  print(Map.unmodifiable(map));
  print('---------------------');

  //PROPERTIES (8)
  print(map.entries);
  print(map.hashCode);
  print(map.isEmpty);
  print(map.isNotEmpty);
  print(map.keys);
  print(map.length);
  print(map.runtimeType);
  print(map.values);
  print('---------------------');

  //METHODS (14)
  map.addAll({5: 'five'});
  print(map);
  map.addEntries([MapEntry(6, 'six')]);
  print(map);
  print(map.cast().remove(1));
  // map.clear();
  print(map);
  print(map.containsKey(2));
  print(map.containsValue('two'));
  map.forEach((k, v) => print('Key: $k, value: $v'));
  print(map.map((k, v) => MapEntry(k * 2, v.toUpperCase())));
  print(map.putIfAbsent(1, () => 'one'));
  print(map);
  print(map.remove(1));
  print(map);
  map.removeWhere((k, v) => k % 2 == 0);
  print(map);
  print(map.toString());
  print(map.update(3, (e) => 'threee'));
  map.updateAll((k, v) => v.toUpperCase());
  print(map);
  print('---------------------');

  //OPERATORS (3)
  print(map == {});
  print(map[3]);
  map[3] = 'B';
  print(map);
  map[0] = 'zero';
  print(map);
}
