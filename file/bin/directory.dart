import 'dart:io';

void main(List<String> args) async {
  // Directory('myDir').create();
  var myDir = Directory('myDir');
  var directory = await Directory('myDir/subdir').create(recursive: true);
  print(directory.path);
}