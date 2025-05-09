import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  // print('Hello world: ${file.calculate()}!');
  print('Hello File from Dart IO');
  final root = Directory.current;
  print(root);
  // File('$root/file.txt').create(recursive: true);
  //CREATE A FILE
  // File('file.txt').create(recursive: true);
  var myFile = File('file.txt');
  //CHECK IF A FILE EXISTS
  print(myFile.existsSync());
  //CHECK FILE PATH
  print(myFile.path);
  //WRITE TO A FILE
  // await myFile.writeAsString('some content');
  // for(var i = 0; i< 10; i++) {
  //   await  myFile.writeAsString('some string $i \n');
  // }

  //WRITE TO FILE USING A STREAM
  // var file = File('file.txt');
  // var sink = file.openWrite();
  // sink.write('FILE ACCESSED ${DateTime.now()}\n');
  // sink.write('FILE ACCESSED ${DateTime.now()}\n');
  // sink.write('FILE ACCESSED ${DateTime.now()}\n');
  // await sink.flush();
  // Close the IOSink to free system resources.
  // await sink.close();

  //READ FROM A FILE
  // myFile.readAsString().then((String contents) {
  //   print(contents);
  // });

  //READ FROM A FILE USING A STREAM
  final file = File('file.txt');
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      print('$line: ${line.length} characters');
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }

  var length = await file.length();
  print(length);
}
