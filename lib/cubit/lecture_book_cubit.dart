import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:libraryucic/models/book_model.dart';
import 'package:libraryucic/models/lectureBook_model.dart';
import 'package:libraryucic/services/book_service.dart';
import 'package:libraryucic/services/lectureBook_Service.dart';

part 'lecture_book_state.dart';

class BookCubit extends Cubit<LectureBookState> {
  BookCubit() : super(LectureBookInitial());

  void fetchBukuDosen() async {
    try {
      emit(LectureBookLoading());

      List<lectureBookModel> bukuDosen = await lectureBookService().fetchBukuDosen();

      emit(LectureBookSuccess(bukuDosen));
    } catch (e) {
      emit(LectureBookFailed(e.toString()));
    }
  }
}
