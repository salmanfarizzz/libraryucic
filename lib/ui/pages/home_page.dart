import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryucic/cubit/book_cubit.dart';
import 'package:libraryucic/ui/widgets/book_tile.dart';
import 'package:libraryucic/models/book_model.dart';
import '../../shared/theme.dart';
import '../widgets/book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<BookCubit>().fetchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'Hello, UCICan !',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Widget popularBooks() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 30),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           BookCard(
    //             name: 'Filosofi Teras',
    //             author: 'Henry Manampiring',
    //             imageUrl: 'assets/filosofi_teras.png',
    //             rating: '4.8',
    //           ),
    //           BookCard(
    //             name: 'Gadis Kretek',
    //             author: 'Ratih Kumala',
    //             imageUrl: 'assets/gadis_kretek.png',
    //             rating: '4.8',
    //           ),
    //           BookCard(
    //             name: 'Laskar Pelangi',
    //             author: 'Andrea Hirata',
    //             imageUrl: 'assets/laskar_pelangi.png',
    //             rating: '4.8',
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget popularBooks(List<BookModel> books) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: books.map((BookModel book) {
              return BookCard(book);
            }).toList(),
          ),
        ),
      );
    }

    Widget lectureBooks(List<BookModel> books) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                children: books.map((BookModel book) {
                  return BookTile(book);
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    // Widget lectureBooks() {
    //   return Column(
    //     children: [
    //       Container(
    //         margin: EdgeInsets.only(
    //           top: 30,
    //           left: defaultMargin,
    //           right: defaultMargin,
    //         ),
    //         child: Column(
    //           children: [
    //             Text(
    //               'Lecture Book',
    //               style: blackTextStyle.copyWith(
    //                 fontSize: 18,
    //                 fontWeight: semiBold,
    //               ),
    //               ),
    //               BookTile(
    //                 name: 'TOEFL Preparation',
    //                 author: 'Viar Dwi Kartika, M.Pd.',
    //                 imageUrl: 'assets/toefl.png',
    //                 rating: '4.5',
    //                  ),
    //               BookTile(
    //                 name: 'TOEFL Preparation',
    //                 author: 'Viar Dwi Kartika, M.Pd.',
    //                 imageUrl: 'assets/toefl.png',
    //                 rating: '4.5',
    //                 ),
    //                 BookTile(
    //                   name: 'TOEFL Preparation',
    //                   author: 'Viar Dwi Kartika, M.Pd.',
    //                   imageUrl: 'assets/toefl.png',
    //                   rating: '4.5',
    //                   ),
    //           ],
    //         ),
    //         ),
    //     ],
    //   );
    // }

    // return ListView(
    //   children: [
    //     header(),
    //     popularBooks(),
    //     lectureBooks(),
    //   ],
    // );
    return BlocConsumer<BookCubit, BookState>(
      listener: (context, state) {
        if (state is BookFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is BookSuccess) {
          return ListView(
            children: [
              header(),
              popularBooks(state.books),
              lectureBooks(state.books),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
