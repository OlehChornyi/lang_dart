void main(List<String> args) {
  num number = 20;

  //PROPERTIES (7)
  print(number.hashCode);
  print(number.isFinite);
  print(number.isInfinite);
  print(number.isNaN);
  print(number.isNegative);
  print(number.runtimeType);
  print(number.sign);
  print('----------------------');

  //METHODS (18)
  print(number.abs());
  print(number.ceil());
  print(number.ceilToDouble());
  print(number.clamp(10, 100));
  print(number.compareTo(25));
  print(number.floor());
  print(number.floorToDouble());
  print(number.remainder(2));
  print(number.round());
  print(number.roundToDouble());
  print(number.toInt());
  print(number.toDouble());
  print(number.toString());
  print(number.toStringAsExponential());
  print(number.toStringAsFixed(5));
  print(number.toStringAsPrecision(5));
  print(number.truncate());
  print(number.truncateToDouble());
  print('----------------------');

  //OPERATORS (12)
  print(number % 3);
  print(-(number));
  print(number ~/ 3);

  //STATIC METHODS (2)
  print(num.parse('20.000000'));
  print(num.tryParse('20.22222'));
}
