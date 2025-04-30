void main(List<String> args) {
  String string = 'Dart';
  print(string);
  //PROPERTIES
  print(string.hashCode);
  print(string.codeUnits);
  print(string.isEmpty);
  print(string.isNotEmpty);
  print(string.length);
  print(string.runes);
  print(string.runtimeType);
  // print(string.toJS);
  print('----------------');

  //METHODS
  // print(string.allMatches('a'));
  print(string.codeUnitAt(0));
  print(string.compareTo('Dart'));
  print(string.contains('Dart'));
  print(string.endsWith('t'));
  print(string.indexOf('a'));
  print(string.lastIndexOf('a'));
  // print(string.matchAsPrefix('Dart'));
  print(string.padLeft(8, 'a'));
  print(string.padRight(8, 'b'));
  print(string.replaceAll('a', 'A'));
  print(string.replaceFirst('D', 'B'));
  print(string.replaceRange(1, 3, 'omasa'));
  print(string.split(''));
  print(string.split('a'));
  print(string.startsWith('D'));
  print(string.substring(2));
  print(string.toLowerCase());
  print(string.toString());
  print(string.toUpperCase());
  print(string.trim());
  print('----------------');

  //OPERATORS
  print(string * 2);
  print(string + ' is awesome!');
  print(string == string);
  print(string[0]);
}
