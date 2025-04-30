void main(List<String> arguments) {
  print('Hello world!');
}

//fswatch -o bin/ | xargs -n1 -I{} sh -c 'clear; dart bin/basics.dart'