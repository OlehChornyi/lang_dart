import 'dart:async';
import 'dart:convert';
import 'dart:io';

Stream<int> createStream() async* {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var stream = Stream.fromIterable(list);
  await for (var value in stream) {
    yield value;
  }
}

void main(List<String> args) async {
  //Methods that process a stream
  print(await createStream().first);
  print(await createStream().isEmpty);
  print(await createStream().last);
  print(await createStream().length);
  // print(await createStream().single);
  print(await createStream().any((e) => e == 3));
  print(await createStream().contains(20));

  var args2 = ['1', '2', '3'];
  var file = File(args2[0]);
  var lines = utf8.decoder
      .bind(file.openRead())
      .transform(const LineSplitter());
  await for (final line in lines) {
    if (!line.startsWith('#')) print(line);
  }
}

//OTHER METHODS THAT PROCESS A STREAM
// Future<E> drain<E>([E? futureValue]);
// Future<T> elementAt(int index);
// Future<bool> every(bool Function(T element) test);
// Future<T> firstWhere(bool Function(T element) test, {T Function()? orElse});
// Future<S> fold<S>(S initialValue, S Function(S previous, T element) combine);
// Future forEach(void Function(T element) action);
// Future<String> join([String separator = '']);
// Future<T> lastWhere(bool Function(T element) test, {T Function()? orElse});
// Future pipe(StreamConsumer<T> streamConsumer);
// Future<T> reduce(T Function(T previous, T element) combine);
// Future<T> singleWhere(bool Function(T element) test, {T Function()? orElse});
// Future<List<T>> toList();
// Future<Set<T>> toSet();

//METHODS THAT MODIFY A STREAM
// Stream<R> cast<R>();
// Stream<S> expand<S>(Iterable<S> Function(T element) convert);
// Stream<S> map<S>(S Function(T event) convert);
// Stream<T> skip(int count);
// Stream<T> skipWhile(bool Function(T element) test);
// Stream<T> take(int count);
// Stream<T> takeWhile(bool Function(T element) test);
// Stream<T> where(bool Function(T event) test);
// Stream<E> asyncExpand<E>(Stream<E>? Function(T event) convert);
// Stream<E> asyncMap<E>(FutureOr<E> Function(T event) convert);
// Stream<T> distinct([bool Function(T previous, T next)? equals]);

//MORE METHODS
// Stream<T> handleError(Function onError, {bool Function(dynamic error)? test});
// Stream<T> timeout(
//   Duration timeLimit, {
//   void Function(EventSink<T> sink)? onTimeout,
// });
// Stream<S> transform<S>(StreamTransformer<T, S> streamTransformer);

//HANDLE STREAM ERRORS
Stream<S> mapLogErrors<S, T>(
  Stream<T> stream,
  S Function(T event) convert,
) async* {
  var streamWithoutErrors = stream.handleError((e) => print(e));

  await for (final event in streamWithoutErrors) {
    yield convert(event);
  }
}

Stream<S> mapLogErrors1<S, T>(
  Stream<T> stream,
  S Function(T event) convert,
) async* {
  var streamWithoutErrors = stream.handleError((e) => print(e));
  var streamWithTimeout = streamWithoutErrors.timeout(
    const Duration(seconds: 2),
    onTimeout: (eventSink) {
      eventSink.addError('Timed out after 2 seconds');
      eventSink.close();
    },
  );

  await for (final event in streamWithTimeout) {
    yield convert(event);
  }
}
