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
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            if (bookInfo.imageLinks['smallThumbnail'] != null)
              Image.network(
                bookInfo.imageLinks['smallThumbnail'].toString(),
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            const SizedBox(height: 16.0),
            buildBookInfo('Title ', bookInfo.title),
            const SizedBox(height: 4.0),
            buildBookInfo('Subtitle ', bookInfo.subtitle),
            const SizedBox(height: 4.0),
            buildBookInfo('Authors ', bookInfo.authors?.join(', ')),
            const SizedBox(height: 4.0),
            buildBookInfo('Publisher ', bookInfo.publisher),
            const SizedBox(height: 4.0),
            buildBookInfo(
                'Published Date ', bookInfo.publishedDate?.toString()),
            const SizedBox(height: 4.0),
            buildBookInfo('Description ', ''),
            Text('${bookInfo.description ?? ''}'),
            const SizedBox(height: 4.0),
            buildBookInfo('Page Count ', bookInfo.pageCount?.toString()),
            const SizedBox(height: 4.0),
            buildBookInfo('Categories ', bookInfo.categories?.join(', ')),
            const SizedBox(height: 4.0),
            buildBookInfo(
                'Average Rating ', bookInfo.averageRating?.toString()),
            const SizedBox(height: 4.0),
            buildBookInfo('Ratings Count ', bookInfo.ratingsCount?.toString()),
            const SizedBox(height: 4.0),
            buildBookInfo('Maturity Rating ', bookInfo.maturityRating),
            const SizedBox(height: 4.0),
            buildBookInfo('Content Version ', bookInfo.contentVersion),
            const SizedBox(height: 4.0),
            // const Text(
            //   'Title: ',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // Text(bookInfo.title ?? ''),
            // Text(
            //   'Title: ${bookInfo.title}',
            //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildBookInfo(String prefix, String? data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$prefix: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            data ?? '',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
