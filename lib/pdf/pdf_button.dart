import 'package:anonymous/pdf/pdf_preview.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFButton extends StatefulWidget {
  const PDFButton({super.key});

  @override
  State<PDFButton> createState() => _PDFButtonState();
}

// Create object of pdf document
final pdf = pw.Document();

class _PDFButtonState extends State<PDFButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {
            //add page to pdf
            pdf.addPage(
              pw.Page(
                build: (context) => pw.Center(
                  child: pw.Text(
                    'Hello World!',
                    style: pw.TextStyle(
                      fontSize: 30,
                      fontBold: pw.Font.symbol(),
                    ),
                  ),
                ),
              ),
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PDFPreview(),
              ),
            );
            //view as layout
            // await Printing.layoutPdf(
            //     name: 'xyz', onLayout: (format) => pdf.save());
          },
          child: const Text('Preview'),
        ),
      ),
    );
  }
}
