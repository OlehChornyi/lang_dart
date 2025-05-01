void main(List<String> args) {
  double dob = 1000.12345;

  //PROPERTIES (7)
  // print(dob.address);
  print(dob.hashCode);
  print(dob.isFinite);
  print(dob.isInfinite);
  print(dob.isNegative);
  print(dob.isNaN);
  print(dob.runtimeType);
  print(dob.sign);
  print('-------------------');

  //METHODS (18)
  print(dob.abs);
  print(dob.ceil());
  print(dob.ceilToDouble());
  print(dob.clamp(990, 1010));
  print(dob.compareTo(1000));
  print(dob.floor());
  print(dob.floorToDouble());
  print(dob.remainder(23));
  print(dob.round());
  print(dob.roundToDouble());
  print(dob.toDouble());
  print(dob.toInt());
  print(dob.toString());
  print(dob.toStringAsExponential());
  print(dob.toStringAsFixed(20));
  print(dob.toStringAsPrecision(20));
  print(dob.truncate());
  print(dob.truncateToDouble());

  //STATIC METHODS (2)
  print(double.parse('33.22'));
  print(double.tryParse('20'));
}