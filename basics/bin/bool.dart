void main(List<String> args) {
  bool boolean = true;

  //CONSTRUCTORS
  print(bool.fromEnvironment('main'));
  print(bool.hasEnvironment('main'));
  print('---------------------');

  //PROPERTIES
  // print(boolean.address);
  print(boolean.hashCode);
  print(boolean.runtimeType);
  print('---------------------');

  //METHODS
  print(boolean.toString());
  print('---------------------');

  //OPERATORS
  print(boolean & false);
  print(boolean == true);
  print(boolean ^ true);
  print(boolean | false);
  print('---------------------');

  //STATIC METHODS
  print(bool.parse('true'));
  print(bool.tryParse('false'));
}
