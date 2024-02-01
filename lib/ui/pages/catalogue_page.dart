import 'package:flutter/material.dart';
import 'package:libraryucic/ui/widgets/book_tile.dart';
import '../../shared/theme.dart';
import '../widgets/book_card.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({Key? key}) : super(key: key);

  @override
  _CataloguePageState createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  TextEditingController _searchController = TextEditingController();

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
                'Katalog Buku',
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

  Widget searchForm() {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        top: 16,
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search books...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          // Handle search text changes here
        },
      ),
    );
  }

  Widget popularBooks() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            BookCard(
              name: 'Filosofi Teras',
              author: 'Henry Manampiring',
              imageUrl: 'assets/filosofi_teras.png',
              rating: '4.8',
            ),
            BookCard(
              name: 'Gadis Kretek',
              author: 'Ratih Kumala',
              imageUrl: 'assets/gadis_kretek.png',
              rating: '4.8',
            ),
            BookCard(
              name: 'Laskar Pelangi',
              author: 'Andrea Hirata',
              imageUrl: 'assets/laskar_pelangi.png',
              rating: '4.8',
            ),
          ],
        ),
      ),
    );
  }

  Widget karyaIlmiah() {
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
                Text(
                  'Karya Ilmiah Mahasiswa',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                BookTile(
                  name: 'Proposal PKM',
                  author: 'Sahl & Team',
                  imageUrl: 'assets/karya.png',
                  rating: '4.5',
                ),
                BookTile(
                  name: 'Proposal P2MW',
                  author: 'Wahyudi & Team',
                  imageUrl: 'assets/karya.png',
                  rating: '4.5',
                ),
                BookTile(
                  name: 'Proposal PPK',
                  author: 'BKM Team',
                  imageUrl: 'assets/karya.png',
                  rating: '4.5',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        header(),
        searchForm(), // Tambahkan formulir pencarian di sini
        popularBooks(),
        karyaIlmiah(),
      ],
    );
  }
}
