

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String fileUrl;

  const PdfViewerScreen({super.key, required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Circular"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SfPdfViewer.network(
        fileUrl,
        canShowScrollHead: true,
        canShowScrollStatus: true,
      ),
    );
  }
}