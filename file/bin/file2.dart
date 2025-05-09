import 'dart:io';

void main(List<String> args) async {
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

  //METHODS
  // myFile.copy('fileCopy.txt');
  // myFile.copySync('fileCopySync.txt');
  // File('fileCreate.txt').create();
  // File('fileCreateSync.txt').createSync();
  var file1 = File('fileCreate.txt');
  var file2 = File('fileCreateSync.txt');
  // file1.delete();
  // file2.deleteSync();
  print(await myFile.exists());
  print(file2.existsSync());
  print(await myFile.lastAccessed());
  print(myFile.lastAccessedSync());
  print(await myFile.lastModified());
  print(myFile.lastModifiedSync());
  print(await myFile.length());
  print(myFile.lengthSync());
  print(await myFile.open());
  final stream = myFile.openRead();
  await for (final data in stream) {
    print(data);
  }
  print(await myFile.openSync(mode: FileMode.read).readByte());
  final myFileCopy = File('fileCopy.txt');
  myFileCopy.openWrite().write('a\n');
  print(await myFileCopy.readAsLines());
  print(await myFileCopy.readAsBytes());
  print(myFileCopy.readAsBytesSync());
  print(await myFile.readAsLines());
  print(myFile.readAsLinesSync());
  print((await myFile.readAsString()));
  print(myFile.readAsStringSync());
  // await myFile.rename('m.txt');
  // myFile.renameSync('file.txt');
  print(await myFile.resolveSymbolicLinks());
  print(myFile.resolveSymbolicLinksSync());
  await myFile.setLastAccessed(DateTime.now());
  myFile.setLastAccessedSync(DateTime.now());
  print(await myFile.stat());
  print(myFile.statSync());
  print(myFile.toString());
  // final stream2 = myFile.watch();
  // print(await stream2.first);
  await myFileCopy.writeAsBytes([1, 2, 3, 4, 5, 6]);
  print(myFileCopy.readAsLinesSync());
  await myFileCopy.writeAsString('abcd');
  print(myFileCopy.readAsLinesSync());
}
