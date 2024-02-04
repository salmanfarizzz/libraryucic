import 'package:equatable/equatable.dart';

class lectureBookModel extends Equatable {
  final String id;
  final String name;
  final String author;
  final String imageUrl;
  final double rating;
  final String description;
  final int publicationYear;
  final String publisher;
  final String bacaUrl;

  lectureBookModel(
      {required this.id,
      this.name = '',
      this.author = '',
      this.imageUrl = '',
      this.rating = 0.0,
      this.description = '',
      this.publicationYear = 0,
      this.publisher = '',
      this.bacaUrl = ''});

  factory lectureBookModel.fromJson(String id, Map<String, dynamic> json) => lectureBookModel(
      id: id,
      name: json['name'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      description: json['description'],
      publicationYear: json['publicationYear'],
      publisher: json['publisher'],
      bacaUrl: json['bacaUrl']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'author': author,
        'imageUrl': imageUrl,
        'rating': rating,
        'description': description,
        'publicationYear': publicationYear,
        'publisher': publisher,
        'bacaUrl': bacaUrl
      };

  @override
  List<Object?> get props => [
        id,
        name,
        author,
        imageUrl,
        rating,
        description,
        publicationYear,
        publisher,
        bacaUrl
      ];
}
