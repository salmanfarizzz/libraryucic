import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:libraryucic/models/book_model.dart';
import 'package:libraryucic/services/book_service.dart';

part 'catalogue_state.dart';

class CatalogueCubit extends Cubit<CatalogueState> {
  CatalogueCubit() : super(CatalogueInitial());

  void fetchBooks() async {
    try {
      emit(CatalogueLoading());

      List<BookModel> books = await BookService().fetchBooks();

      emit(CatalogueSuccess(books));
    } catch (e) {
      emit(CatalogueFailed(e.toString()));
    }
  }
}
