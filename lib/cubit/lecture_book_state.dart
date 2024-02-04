part of 'lecture_book_cubit.dart';

sealed class LectureBookState extends Equatable {
  const LectureBookState();

  @override
  List<Object> get props => [];
}

class LectureBookInitial extends LectureBookState {}

class LectureBookLoading extends LectureBookState {}

class LectureBookSuccess extends LectureBookState {
  final List<lectureBookModel> bukuDosen;

  LectureBookSuccess(this.bukuDosen);

  @override
  List<Object> get props => [bukuDosen];
}

class LectureBookFailed extends LectureBookState {
  final String error;

  LectureBookFailed(this.error);

  @override
  List<Object> get props => [error];
}
