import 'package:flutter/material.dart';
import 'package:libraryucic/ui/pages/read_page.dart';
// import 'package:libraryucic/ui/pages/read_page.dart';
import '../../shared/theme.dart';
import '../../models/book_model.dart';
import '../widgets/custom_button.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';

// import '../widgets/information_item.dart';
// import 'package:libraryucic/ui/widgets/photo_item.dart';

class DetailPage extends StatelessWidget {
  final BookModel book;

  const DetailPage(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              book.imageUrl,
            ),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // NOTE: EMBLEM
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(
                top: 30,
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(
              //       'assets/icon_emblem.png',
              //     ),
              //   ),
              // ),
            ),

            // NOTE: TITLE
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.name,
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          book.author,
                          style: whiteTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_star.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        book.rating.toString(),
                        style: whiteTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE: ABOUT
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    book.description,
                    style: blackTextStyle.copyWith(
                      height: 2,
                    ),
                  ),

                  // NOTE: PHOTOS
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Penerbit',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        book.publisher,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Tahun Terbit',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        book.publicationYear.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // NOTE: READ BUTTON
            Container(
              width: 200,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  CustomButton(
                    title: 'Baca Sekarang',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadPage(book: book,),
                        ),
                      );
                    },
                    width: 170,
                  ),

                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
