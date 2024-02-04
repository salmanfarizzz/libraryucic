part of 'catalogue_cubit.dart';

sealed class CatalogueState extends Equatable {
  const CatalogueState();

  @override
  List<Object> get props => [];
}

class CatalogueInitial extends CatalogueState {}

class CatalogueLoading extends CatalogueState {}

class CatalogueSuccess extends CatalogueState {
  final List<BookModel> books;

  CatalogueSuccess(this.books);

  @override
  List<Object> get props => [books];
}

class CatalogueFailed extends CatalogueState {
  final String error;

  CatalogueFailed(this.error);

  @override
  List<Object> get props => [error];
}
