import 'dart:io';

void main(List<String> args) {
  print('File, Directory, and Link');
  // File myFile = File('myFile.txt');
  // myFile.rename('yourFile.txt').then((_) => print('file renamed'));
  print('FileSystemEntity');
  //   FileSystemEntity.isDirectory(myPath).then((isDir) {
  //   if (isDir) {
  //     print('$myPath is a directory');
  //   } else {
  //     print('$myPath is not a directory');
  //   }
  // });
  print('HttpServer and HttpClient');
  print('Process');
  Process.start('ls', ['-R', 'web']).then((process) {
    stdout.addStream(process.stdout);
    stderr.addStream(process.stderr);
    process.exitCode.then(print);
  });
  print('WebSocket');
  //The WebSocket class provides support for the web socket protocol.
  //This allows full-duplex communications between client and server applications.
  //For example, here's a mini server that listens for 'ws' data on a WebSocket:
  // runZoned(() async {
  //   var server = await HttpServer.bind('127.0.0.1', 4040);
  //   server.listen((HttpRequest req) async {
  //     if (req.uri.path == '/ws') {
  //       var socket = await WebSocketTransformer.upgrade(req);
  //       socket.listen(handleMsg);
  //     }
  //   });
  // }, onError: (e) => print("An error occurred."));
  //   var socket = await WebSocket.connect('ws://127.0.0.1:4040/ws');
  // socket.add('Hello, World!');
  print('Socket and ServerSocket');
  // ServerSocket.bind('127.0.0.1', 4041).then((serverSocket) {
  //   serverSocket.listen((socket) {
  //     socket.transform(utf8.decoder).listen(print);
  //   });
  // });
  // Socket.connect('127.0.0.1', 4041).then((socket) {
  //   socket.write('Hello, World!');
  // });
  print('Standard output, error, and input streams');
  stdout.writeln('Hello, World!');
  stderr.writeAll([ 'That ', 'is ', 'an ', 'error.', '\n']);
  String? inputText = stdin.readLineSync();
}
