class BookDetailsModel {
  final int? id;
  final String? title;
  final int? author;
  final String? authorName;
  final String? editor;
  final String? presenter;
  final String? publisher;
  final int? editionNumber;
  final String? editionDateHijri;
  final String? editionDateGregorian;
  final int? numberOfParts;
  final int? category;
  final String? categoryName;
  final int? size;
  final String? dateAdded;
  final String? notes;
  final String? createdAt;
  final String? updatedAt;

  BookDetailsModel({
    this.id,
    this.title,
    this.author,
    this.authorName,
    this.editor,
    this.presenter,
    this.publisher,
    this.editionNumber,
    this.editionDateHijri,
    this.editionDateGregorian,
    this.numberOfParts,
    this.category,
    this.categoryName,
    this.size,
    this.dateAdded,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory BookDetailsModel.fromJson(
      Map<String, dynamic> json) {
    return BookDetailsModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      authorName: json['author_name'],
      editor: json['editor'],
      presenter: json['presenter'],
      publisher: json['publisher'],
      editionNumber: json['edition_number'],
      editionDateHijri:
      json['edition_date_hijri'],
      editionDateGregorian:
      json['edition_date_gregorian'],
      numberOfParts: json['number_of_parts'],
      category: json['category'],
      categoryName: json['category_name'],
      size: json['size'],
      dateAdded: json['date_added'],
      notes: json['notes'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}