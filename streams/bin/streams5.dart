void main(List<String> args) async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}

Future<int?> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (final value in stream) {
      sum += value;
    }
  } catch (e) {
    print(e);
    return -1;
  } finally {
    print(sum);
  }
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw Exception('Intentional exception');
    } else {
      yield i;
    }
  }
}
