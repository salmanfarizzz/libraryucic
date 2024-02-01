import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String id;
  final String name;
  final String author;
  final String imageUrl;
  final double rating;

  BookModel({
    required this.id,
    this.name = '',
    this.author = '',
    this.imageUrl = '',
    this.rating = 0.0,
  });

  factory BookModel.fromJson(String id, Map<String, dynamic> json) =>
      BookModel(
        id: id,
        name: json['name'],
        author: json['author'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'imageUrl': imageUrl,
        'rating': rating,
      };

  @override
  List<Object?> get props => [id, name, author, imageUrl, rating];
}
