import 'dart:io';

void main(List<String> args) async {
  //1
  // final quotes = File('quotes.txt');
  // const stronger = 'That which does not kill us makes us stronger. -Nietzsche';
  // await quotes.writeAsString(stronger, mode: FileMode.append);
  //2
  // final quotes = File('quotes.txt').openWrite(mode: FileMode.append);
  // quotes.writeln("Don't cry because it's over, ");
  // quotes.writeln('smile because it happened. -Dr. Seuss');
  // await quotes.close();
  //3
  final envVarMap = Platform.environment;

  print('PWD = ${envVarMap['PWD']}');
  print('LOGNAME = ${envVarMap['LOGNAME']}');
  print('PATH = ${envVarMap['PATH']}');
  print(Platform.isIOS);
  print(Platform.numberOfProcessors);
  print(Platform.script);
}
