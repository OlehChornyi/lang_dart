
import 'dart:io';

void main(List<String> arguments) async{
  // print('Hello world: ${file.calculate()}!');
  print('Hello File from Dart IO');
  final root = Directory.current;
  print(root);
  // File('$root/file.txt').create(recursive: true);
  // File('file.txt').create(recursive: true);
  var myFile = File('file.txt');
  print(myFile.existsSync());
  print(myFile.path);
  // File('file.txt').readAsString().then((String contents) {
  //   print(contents);
  // });
}
