import 'dart:async';

void main(List<String> args) {
  final myStream = NumberCreator().stream;
  //Infinite timer
  // final subscription = myStream.listen((data) => print('Data: $data'));

  // subscription.pause();
  // subscription.resume();
  // subscription.cancel();

  //Infinite strings printing
  // NumberCreator().stream
  //   .map((i) => 'String $i')
  //   .listen(print) ;

  //Even strings printing
  NumberCreator().stream
    .where((i) => i % 2 == 0)
    .map((i) => 'String $i')
    .listen(print) ;
}

class NumberCreator {
  NumberCreator() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _controller.sink.add(_count);
      _count += 1;
    });
  }
  final _controller = StreamController<int>();
  var _count = 0;
  Stream<int> get stream => _controller.stream;
}

//UNIMPLEMENTED STREAMBUILDER
// StreamBuilder<String>(
//   stream: NumberCreator().stream.map((i) => 'String $i'),
//   builder: (context, snapshot) {
//     // Build some widgets
//     throw UnimplementedError(“Case not handled yet”);
//   },
// );

//SNAPSHOT.CONNECTIONSTATE.WAITING
// StreamBuilder<String>(
//   stream: NumberCreator().stream.map((i) => ‘String $i’),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Text(‘No data yet.’);
//   }
//   throw UnimplementedError(“Case not handled yet”);
// },
// );

//CONNECTIONSTATE.DONE
// StreamBuilder<String>(
//    stream: NumberCreator().stream.map((i) => 'String $i'),
//    builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {      
//         return const Text('No data yet.');
//       } else if (snapshot.connectionState == ConnectionState.done){
//         return const Text('Done!');
//       }
//       throw UnimplementedError("Case not handled yet");
//     },
//  );

//OK
// StreamBuilder<String>(
//   stream: NumberCreator().stream.map((i) => ‘String $i’),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Text(‘No data yet.’);
//     } else if (snapshot.connectionState == ConnectionState.done) {
//       return const Text(‘Done!’);
//     } else if (snapshot.hasError) {
//       return const Text(‘Error!’);
//     } else {
//       return Text(snapshot.data ?? ‘’);
//     } 
//   },
// );
