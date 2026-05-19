class BooksResponseModel {
  final int? count;
  final String? next;
  final String? previous;
  final List<BookModel>? results;

  BooksResponseModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BooksResponseModel.fromJson(Map<String, dynamic> json) {
    return BooksResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null
          ? List<BookModel>.from(
        json['results'].map((e) => BookModel.fromJson(e)),
      )
          : [],
    );
  }
}

class BookModel {
  final int? id;
  final String? title;
  final String? authorName;
  final String? categoryName;
  final int? size;
  final String? dateAdded;
  final int? editionNumber;

  BookModel({
    this.id,
    this.title,
    this.authorName,
    this.categoryName,
    this.size,
    this.dateAdded,
    this.editionNumber,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      authorName: json['author_name'],
      categoryName: json['category_name'],
      size: json['size'],
      dateAdded: json['date_added'],
      editionNumber: json['edition_number'],
    );
  }
}