import 'dart:math';

void main(List<String> arguments) {
  print('Hello world and dart math!');

  //Random
  var intValue = Random().nextInt(10);
  print(intValue);
  var doubleValue = Random().nextDouble();
  print(doubleValue);
  var boolValue = Random().nextBool();
  print(boolValue);

  //Point
  var leftTop = const Point(0, 0);
  print(leftTop);
  var rightBottom = const Point(200, 400);
  print(rightBottom);

  //Rectangle
  var leftTop1 = const Point(20, 50);
  var rightBottom1 = const Point(300, 600);
  var rectangle = Rectangle.fromPoints(leftTop1, rightBottom1);
  print(rectangle.left); // 20
  print(rectangle.top); // 50
  print(rectangle.right); // 300
  print(rectangle.bottom); // 600
  var rectangle1 = const Rectangle(20, 50, 300, 600);
  print(rectangle1.left); // 20
  print(rectangle1.top); // 50
  print(rectangle1.right); // 320
  print(rectangle1.bottom); // 650

  var rectangle2 = MutableRectangle(20, 50, 300, 600);
  print(rectangle2); // Rectangle (20, 50) 300 x 600
  print(rectangle2.left); // 20
  print(rectangle2.top); // 50
  print(rectangle2.right); // 320
  print(rectangle2.bottom); // 650

  // Change rectangle width and height.
  rectangle2.width = 200;
  rectangle2.height = 100;
  print(rectangle2); // Rectangle (20, 50) 200 x 100
  print(rectangle2.left); // 20
  print(rectangle2.top); // 50
  print(rectangle2.right); // 220
  print(rectangle2.bottom);

  //Functions
  print(cos(90));
  print(exp(100));
  print(log(100));
  print(pow(2, 10));
  print(sin(90));
  print(sqrt(16));
}
