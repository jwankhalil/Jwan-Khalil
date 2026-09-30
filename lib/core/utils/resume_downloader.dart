import 'package:flutter/services.dart';
import 'package:portfolio/core/utils/resume_downloader_stub.dart'
    if (dart.library.js_interop) 'package:portfolio/core/utils/resume_downloader_web.dart'
    if (dart.library.io) 'package:portfolio/core/utils/resume_downloader_io.dart'
    as resume_downloader_impl;

class ResumeDownloader {
  const ResumeDownloader._();

  static const assetPath = 'assets/resume/jwan_khalil_resume.pdf';
  static const fileName = 'Jwan_Khalil_Resume.pdf';

  static Future<void> download() async {
    final data = await rootBundle.load(assetPath);
    resume_downloader_impl.downloadBytes(
      data.buffer.asUint8List(),
      fileName,
    );
  }
}
