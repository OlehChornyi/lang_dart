import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  print('Future');
  HttpServer.bind(
    '127.0.0.1',
    4444,
  ).then((server) => print('${server.isBroadcast}')).catchError(print);

  print('Stream');
  Stream<List<int>> stream = File('quotes.txt').openRead();
  stream.transform(utf8.decoder).forEach(print);
}
