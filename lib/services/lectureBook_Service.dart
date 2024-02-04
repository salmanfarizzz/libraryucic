import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libraryucic/models/book_model.dart';
import 'package:libraryucic/models/lectureBook_model.dart';

class lectureBookService {
  CollectionReference _lecturebookReference =
      FirebaseFirestore.instance.collection('bukuDosen');

  Future<List<lectureBookModel>> fetchBukuDosen() async {
    try {
      QuerySnapshot result = await _lecturebookReference.get();

      List<lectureBookModel> bukuDosen = result.docs.map(
        (e) {
          return lectureBookModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return bukuDosen;
    } catch (e) {
      throw e;
    }
  }
}
