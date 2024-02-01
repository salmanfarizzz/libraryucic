import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:libraryucic/ui/widgets/custom_button.dart';
import 'package:libraryucic/ui/widgets/history_tile.dart';
import 'package:libraryucic/models/book_model.dart';
import 'package:libraryucic/ui/widgets/button_history.dart';
import '../../shared/theme.dart';
import '../widgets/book_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

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
                  'Aktivitas',
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

    Widget HistoryBooks() {
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
                children: [
                  HistoryTile(
                    name: 'TOEFL Preparation',
                    author: 'Viar Dwi Kartika, M.Pd.',
                    imageUrl: 'assets/toefl.png',
                    title: 'Dipinjam : 07-12-2023',
                  ),
                  HistoryTile(
                    name: 'Filosofi Teras',
                    author: 'Henry Manampiring',
                    imageUrl: 'assets/filosofi_teras.png',
                    title: 'Dipinjam : 14-12-2023',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget ButtonPinjam() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            CustomButton(
              title: 'Baca Sekarang',
              onPressed: () {
                
              },
              width: 220,
            ),
          ],
        ),
      );
    }


    return ListView(
      children: [
        header(),
        HistoryBooks(),
        ButtonPinjam(),
      ],
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Riwayat Peminjaman'),
    //     ),
    //     body: ListView(
    //       children: [
    //         HistoryTile(
    //           name: 'TOEFL Preparation',
    //           author: 'Viar Dwi Kartika, M.Pd.',
    //           imageUrl: 'assets/toefl.png',
    //           title: 'Dipinjam : 07-12-2023',
    //         ),
            
    //         HistoryTile(
    //           name: 'Filosofi Teras',
    //           author: 'Henry Manampiring',
    //           imageUrl: 'assets/filosofi_teras.png',
    //           title: 'Dipinjam : 14-12-2023',
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

