void main(List<String> args) {
  int integer = 1000;

  //CONSTRUCTORS (1)
  print(int.fromEnvironment('name'));

  //PROPERTIES (11)
  // print(integer.address);
  print(integer.bitLength);
  print(integer.hashCode);
  print(integer.isEven);
  print(integer.isFinite);
  print(integer.isInfinite);
  print(integer.isNaN);
  print(integer.isNegative);
  print(integer.isOdd);
  print(integer.runtimeType);
  print(integer.sign);
  print('-------------------');

  //METHODS (20)
  print(integer.abs());
  print(integer.ceil());
  print(integer.ceilToDouble());
  print(integer.clamp(1, 20));
  print(integer.compareTo(23));
  print(integer.floor());
  print(integer.floorToDouble());
  print(integer.gcd(20));
  // print(integer.modInverse(2));
  print(integer.remainder(23));
  print(integer.round());
  print(integer.roundToDouble());
  print(integer.toDouble());
  print(integer.toInt());
  print(integer.toSigned(10));
  print(integer.toString());
  print(integer.toStringAsExponential());
  print(integer.toStringAsFixed(10));
  print(integer.toStringAsPrecision(10));
  print(integer.truncate());
  print(integer.truncateToDouble());
  print('-------------------');

  //STATIC METHODS (2)
  print(int.parse('20'));
  print(int.tryParse('20.20'));
}
