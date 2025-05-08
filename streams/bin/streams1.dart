import 'dart:async';

void main(List<String> arguments) {
  StreamController<int> _streamController = StreamController<int>();

  Stream<int> _stream = _streamController.stream;

  _stream.listen(
    (int data) {
      print('Data: $data');
    },
    onError: (error) {
      print('Error: $error');
    },
    onDone: () {
      print('Stream closed!');
    },
  );

  _streamController.add(1);
  _streamController.add(2);
  _streamController.add(3);

  _streamController.close();
}
