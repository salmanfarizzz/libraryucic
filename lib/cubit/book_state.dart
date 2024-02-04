part of 'book_cubit.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSuccess extends BookState {
  final List<BookModel> books;

  BookSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class BookFailed extends BookState {
  final String error;

  BookFailed(this.error);

  @override
  List<Object> get props => [error];
}


