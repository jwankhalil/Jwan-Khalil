import 'dart:js_interop';
import 'dart:typed_data';

import 'package:web/web.dart' as web;

void downloadBytes(Uint8List bytes, String filename) {
  final blobParts = [bytes.toJS].toJS;
  final blob = web.Blob(blobParts, web.BlobPropertyBag(type: 'application/pdf'));
  final url = web.URL.createObjectURL(blob);
  final anchor = web.document.createElement('a') as web.HTMLAnchorElement
    ..href = url
    ..download = filename;
  web.document.body!.appendChild(anchor);
  anchor.click();
  anchor.remove();
  web.URL.revokeObjectURL(url);
}
