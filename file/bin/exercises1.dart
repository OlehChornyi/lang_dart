import 'dart:io';

void main(List<String> args) async{
  //1
  stdout.writeln('Type something');
  // final input = stdin.readLineSync();
  // stdout.writeln('You typed: $input');
  //2
  await stdin.pipe(stdout);
}