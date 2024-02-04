import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:libraryucic/models/book_model.dart';
import 'package:libraryucic/services/book_service.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());

  void fetchBooks() async {
    try {
      emit(BookLoading());

      List<BookModel> books =
          await BookService().fetchBooks();

      emit(BookSuccess(books));
    } catch (e) {
      emit(BookFailed(e.toString()));
    }
  }
}
