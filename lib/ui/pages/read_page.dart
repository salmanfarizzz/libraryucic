// import 'package:flutter/material.dart';
// import '../../shared/theme.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class ReadPage extends StatelessWidget {
//   final String pdfUrl;

//   const ReadPage({Key? key, required this.pdfUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//         Text(
//           'Halaman Baca',
//           ),
//       ),
//       body: PDFView(
//         filePath: pdfUrl, // Provide the URL or path of the PDF file
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:libraryucic/models/book_model.dart';

// class ReadPage extends StatelessWidget {
//   final BookModel books;

//   const ReadPage({Key? key, required this.books}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     print("PDF URL: ${books.bacaUrl}");
//     return Scaffold(
//       appBar: AppBar(title: Text(books.name)),
//       body: PDFView(
//         filePath: books.bacaUrl,
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: false,
//         pageFling: false,
//       ),
//     );
//   }
// }

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:libraryucic/models/book_model.dart';
import 'package:libraryucic/shared/theme.dart';
import 'package:http/http.dart' as http;
import 'package:pdfx/pdfx.dart';

class ReadPage extends StatefulWidget {
  final BookModel book;

  const ReadPage({Key? key, required this.book}) : super(key: key);

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  PdfControllerPinch? pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    final response = await http.get(Uri.parse(widget.book.bacaUrl));

    if (response.statusCode == 200) {
      final Uint8List pdfData = Uint8List.fromList(response.bodyBytes);
      pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openData(pdfData),
      );
      if (mounted) {
        setState(() {});
      }
    } else {
      throw Exception('Failed to load PDF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Read Page',
          style: whiteTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(
      children: [
        pdfView(),
      ],
    );
  }

  Widget pdfView() {
    if (pdfControllerPinch == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Expanded(
      child: PdfViewPinch(
        controller: pdfControllerPinch!,
        onPageChanged: (int? page) {
          print('page changed: $page');
        },
        onDocumentLoaded: (PdfDocument document) {
          print('document loaded: ${document.pagesCount}');
        },
        onDocumentError: (dynamic error) {
          print('document error: $error');
        },
      ),
    );
  }
}

