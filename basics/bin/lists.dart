void main(List<String> args) {
  List<String> strings = ['Foo', 'Bar', 'Baz', 'Qux'];
  List<int> integers = [1, 2, 3, 4, 5, 6, 7];

  //CONSTRUCTORS (6)
  print(List.empty());
  print(List.filled(5, 1));
  print(List.from([1, 2, 3, 4, 5]));
  print(List.generate(10, ((index) => index * index)));
  print(List.of([1, 2, 3, 4, 5, 6, 7]));
  print(List.unmodifiable([1, 2, 3, 4]));
  print('------------------');

  //PROPERTIES (12)
  print(strings.first);
  print(strings.hashCode);
  print(strings.indexed);
  print(strings.isEmpty);
  print(strings.isNotEmpty);
  // print(strings.iterator);
  print(strings.last);
  print(strings.lastOrNull);
  print(strings.length);
  print(strings.nonNulls);
  print(strings.reversed.toList());
  print(strings.runtimeType);
  // print(strings.single);
  print(strings.singleOrNull);
  print('------------------');

  //METHODS (39)
  strings.add('B');
  strings.addAll(['c', 'd']);
  print(strings);
  print(strings.any((a) => a == 'B'));
  print(strings.asMap());
  print(strings.cast());
  // strings.clear();
  print(strings);
  print(strings.contains('B'));
  print(strings.elementAt(0));
  print(strings.every((a) => a.runtimeType == int));
  integers.fillRange(1, 3, 4);
  print(integers);
  print(strings.firstWhere((a) => a == 'B'));
  print(integers.fold(0, (previous, next) => (previous as int) + next));
  print(integers.followedBy([10, 10, 10]));
  strings.forEach(print);
  strings.forEach((e) => print(e));
  print(strings.getRange(1, 3));
  print(strings.indexOf('B'));
  strings.insert(2, 'A');
  print(strings);
  strings.insertAll(0, ['E', 'F']);
  print(strings);
  print(strings.join());
  print(strings.lastIndexOf('B'));
  print(strings.map((e) => e + '!'));
  print(integers.map((e) => e + 100));
  print(integers.reduce((a, b) => a + b));
  print(strings.remove('B'));
  print(strings.removeAt(0));
  print(strings.removeLast());
  strings.removeRange(1, 3);
  print(strings);
  strings.replaceRange(0, 2, ['Foo', 'Bar']);
  print(strings);
  strings.retainWhere((e) => e.runtimeType == String);
  print(strings);
  strings.setRange(0, 3, ['A', 'B', 'C']);
  print(strings);
  strings.shuffle();
  print(strings);
  // print(strings.singleWhere((e) => e.runtimeType == String));
  print(strings.skip(3));
  strings.sort((a, b) => a.compareTo(b));
  print(strings);
  print(integers.sublist(2, 5));
  print(integers.take(3));
  print(strings.toList());
  print(strings.toSet());
  print(strings.where((e) => e == 'B'));
  print(strings.whereType<String>());
  print('------------------');

  //OPERATORS (4)
  print(strings + ['a']);
  print(strings == integers);
  print(strings[2]);
  print(strings[2] = 'b');
}
