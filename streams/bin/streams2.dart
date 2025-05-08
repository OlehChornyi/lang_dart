import 'dart:async';

void main(List<String> args) {
  StreamController<String> controller = StreamController<String>.broadcast();

  Stream<String> stream = controller.stream;

  StreamSubscription<String> subscriber1 = stream.listen(
    (data) {
      print('Subscriber1 onData: $data');
    },
    onError: (error) {
      print('Subscriber1 onError: $error');
    },
    onDone: () {
      print('Subscriber1: Stream Closed!');
    },
  );

  StreamSubscription<String> subscriber2 = stream.listen(
    (data) {
      print('Subscriber2 onData: $data');
    },
    onError: (error) {
      print('Subscriber2 onError: $error');
    },
    onDone: () {
      print('Subscriber2: Stream Closed!');
    },
  );

  controller.sink.add('Hello!');
  controller.addError('Hi');
  controller.close();
}
