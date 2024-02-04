import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libraryucic/models/book_model.dart';

class BookService {
  CollectionReference _bookReference =
      FirebaseFirestore.instance.collection('books');

  Future<List<BookModel>> fetchBooks() async {
    try {
      QuerySnapshot result = await _bookReference.get();

      List<BookModel> books = result.docs.map(
        (e) {
          return BookModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return books;
    } catch (e) {
      throw e;
    }
  }
}
