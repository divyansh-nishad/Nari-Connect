import 'package:books_finder/books_finder.dart';
import 'package:flutter/material.dart';

class BookInfoScreen extends StatelessWidget {
  final BookInfo bookInfo;

  BookInfoScreen({required this.bookInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookInfo.title ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (bookInfo.imageLinks['smallThumbnail'] != null)
              Image.network(bookInfo.imageLinks['smallThumbnail'].toString()),
            const SizedBox(height: 16.0),
            Text(
              'Title: ${bookInfo.title}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Subtitle: ${bookInfo.subtitle ?? ''}'),
            Text('Authors: ${bookInfo.authors?.join(', ') ?? ''}'),
            Text('Publisher: ${bookInfo.publisher ?? ''}'),
            Text('Published Date: ${bookInfo.publishedDate ?? ''}'),
            Text('Description: ${bookInfo.description ?? ''}'),
            Text('Page Count: ${bookInfo.pageCount ?? ''}'),
            Text('Categories: ${bookInfo.categories?.join(', ') ?? ''}'),
            Text('Average Rating: ${bookInfo.averageRating ?? ''}'),
            Text('Ratings Count: ${bookInfo.ratingsCount ?? ''}'),
            Text('Maturity Rating: ${bookInfo.maturityRating ?? ''}'),
            Text('Content Version: ${bookInfo.contentVersion ?? ''}'),
          ],
        ),
      ),
    );
  }
}
