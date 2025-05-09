import 'dart:io';

void main(List<String> args) {
  //CONSTRUCTORS
  File('file1.txt');
  // File.fromRawPath(
  //   'A raw path is a sequence of bytes, as paths are represented by the OS.',
  // );
  Uri uri = Uri(path: 'file.txt');
  var myFile = File.fromUri(uri);

  //PROPERTIES
  print(myFile.absolute);
  print(myFile.hashCode);
  print(myFile.isAbsolute);
  print(myFile.parent);
  print(myFile.path);
  print(myFile.runtimeType);
  print(myFile.uri);
}
