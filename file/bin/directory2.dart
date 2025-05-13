import 'dart:io';

void main(List<String> args) async {
  var systemTempDir = Directory.systemTemp;

  await for (var entity in
      systemTempDir.list(recursive: true, followLinks: false)) {
    print(entity.path);
  }
}