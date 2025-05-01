import 'dart:collection';

void main(List<String> args) {
  Set<String> strings = {'Foo', 'Bar', 'Baz', 'Qux'};
  Set<int> integers = {1, 2, 3, 4, 5, 6, 7};

  //CONSTRUCTORS (5)
  print(Set());
  print(Set.from([1, 2, 3, 4]));
  print(LinkedHashSet.identity());
  print(Set.of([1, 2, 1, 2, 1, 2]));
  print(Set.unmodifiable([1, 2, 3, 4, 5, 1, 2]));
  print('-----------');

  //PROPERTIES (12)
  print(strings.first);
  print(strings.firstOrNull);
  print(strings.hashCode);
  print(strings.indexed);
  print(strings.isEmpty);
  print(strings.isNotEmpty);
  // var a = strings.iterator;
  // print(a);
  print(strings.last);
  print(strings.lastOrNull);
  print(strings.length);
  print(strings.nonNulls);
  print(strings.runtimeType);
  // print(strings.single);
  print(strings.singleOrNull);
  print('-------------------');

  //METHODS (27)
  print(strings.add('A'));
  print(strings);
  strings.addAll(['B', 'C']);
  print(strings);
  // print(integers.cast<String>());
  // strings.clear();
  print(strings);
  print(strings.contains('B'));
  print(integers.difference({5, 6, 7, 8, 9, 10}));
  print(integers.elementAt(0));
  print(integers.elementAtOrNull(0));
  print(integers.every((e) => e % 2 == 0));
  print(integers.firstWhere((e) => e % 2 == 0));
  print(integers.fold(0, (a, b) => (a as int) + b));
  print(integers.followedBy([8, 9, 10]));
  integers.forEach(print);
  print(integers);
  print(integers.intersection({6, 7, 8, 9}));
  print(integers.join('_'));
  print(integers.lookup(1));
  print(integers.map((e) => e * 100));
  print(integers.reduce((a, b) => a + b));
  print(integers.remove(1));
  integers.removeAll([1, 22]);
  print(integers);
  print(integers.skip(2));
  print(integers.skipWhile((e) => (e.remainder(2) == 0)));
  print(integers.take(2));
  print(integers.takeWhile((e) => (e % 2 == 0)));
  print(integers.toList());
  print(integers.toSet());
  print(integers.union({200, 300, 400}));
  print(integers.where((e) => (e % 2 == 0)));
  print(integers.whereType<String>());
  print('-------------------');

  //OPERATORS
  print(integers == strings);
  //STATIC METHODS
  print(Set.castFrom<int, String>(integers));
}
