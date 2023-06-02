class Book {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String publisher;
  final DateTime publishedDate;
  final String description;
  final int pageCount;
  final List<String> categories;
  final double averageRating;
  final List<Map<String, Uri>> imageLinks;
  final String language;

  Book({
    required this.title,
    required this.authors,
    required this.description,
    required this.pageCount,
    required this.publishedDate,
    required this.publisher,
    required this.subtitle,
    required this.categories,
    required this.averageRating,
    required this.imageLinks,
    required this.language,
  });
}
