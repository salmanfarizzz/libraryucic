import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryucic/cubit/book_cubit.dart';
import 'package:libraryucic/models/book_model.dart';
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

    Widget karyaIlmiah(List<BookModel> books) {
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

    // @override
    // Widget build(BuildContext context) {
    //   return ListView(
    //     children: [
    //       header(),
    //       searchForm(), // Tambahkan formulir pencarian di sini
    //       popularBooks(),
    //       karyaIlmiah(),
    //     ],
    //   );
    // }
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
              karyaIlmiah(state.books),
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
