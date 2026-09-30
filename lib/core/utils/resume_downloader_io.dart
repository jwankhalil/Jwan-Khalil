import 'dart:io';
import 'dart:typed_data';

void downloadBytes(Uint8List bytes, String filename) {
  final file = File('${Directory.systemTemp.path}${Platform.pathSeparator}$filename');
  file.writeAsBytesSync(bytes, flush: true);
}
