import 'package:anonymous/pdf/pdf_button.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PDFPreview extends StatefulWidget {
  const PDFPreview({super.key});

  @override
  State<PDFPreview> createState() => _PDFPreviewState();
}

class _PDFPreviewState extends State<PDFPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PdfPreview(pdfFileName: 'xyz', build: (format) => pdf.save()),
    );
  }
}
