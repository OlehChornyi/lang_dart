import 'dart:io';

void main(List<String> args) async {
  var systemTempDir = Directory.systemTemp;
  var myDir = Directory('myDir');

  // await for (var entity in
  //     systemTempDir.list(recursive: true, followLinks: false)) {
  //   print(entity.path);
  // }

  // final myDir = Directory('dir');
  var isThere = await myDir.exists();
  print(isThere ? 'exists' : 'nonexistent');

  //Directory properties
  print(myDir.absolute);
  print(systemTempDir.absolute);
  print(myDir.hashCode);
  print(myDir.isAbsolute);
  print(myDir.parent);
  print(myDir.runtimeType);
  print(myDir.uri);

  //Directory methods
  // await Directory('myDir/subdir2').create();
  // Directory('myDir/subdir3').createSync();
  // await Directory('myDir/subdir2').createTemp();
  // Directory('myDir/subdir2').createTempSync();
  // await Directory('myDir/subdir3').delete();
  // Directory('myDir/subdir3').deleteSync();
  print(await Directory('myDir/subdir2').exists());
  print(Directory('myDir/subdir2').existsSync());
  await for (var dir in myDir.list()) {
    print(dir.path);
  }
  print(myDir.listSync());
  // Directory('myDir/subdir').renameSync('myDir/subd');
  print(myDir.resolveSymbolicLinksSync());
  print(myDir.statSync());
  print(myDir.toString());
  print(Directory.current);
  print(Directory.systemTemp);
}
