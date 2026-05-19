class BookPagesModel {
  final String book;
  final int totalPages;
  final List<BookPage> pages;

  BookPagesModel({
    required this.book,
    required this.totalPages,
    required this.pages,
  });

  factory BookPagesModel.fromJson(Map<String, dynamic> json) {
    return BookPagesModel(
      book: json['book'],
      totalPages: json['total_pages'],
      pages: List<BookPage>.from(
        json['pages'].map((x) => BookPage.fromJson(x)),
      ),
    );
  }
}

class BookPage {
  final int id;
  final int pageNumber;
  final bool highlighted;

  BookPage({
    required this.id,
    required this.pageNumber,
    required this.highlighted,
  });

  factory BookPage.fromJson(Map<String, dynamic> json) {
    return BookPage(
      id: json['id'],
      pageNumber: json['page_number'],
      highlighted: json['highlighted'],
    );
  }
}