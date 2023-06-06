import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nari_connect/Screens/profile_page.dart';
import 'package:nari_connect/components/drawer.dart';

import '../components/book_info.dart';
import '../widgets/widgets.dart';
import 'auth_page.dart';
import 'home_page.dart';
import 'job_opp.dart';
import 'package:books_finder/books_finder.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final user = FirebaseAuth.instance.currentUser!;
  List<BookInfo> books = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchBooks('women');
  }

  Future<void> fetchBooks(String query) async {
    final fetchedBooks = await queryBooks(
      query,
      maxResults: 5,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
      reschemeImageLinks: true,
    );
    setState(() {
      books = fetchedBooks.map((book) => book.info).toList();
    });
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      drawer: DrawerWidget(user: user),
      backgroundColor: Colors.pink[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.pink,
                      controller: searchController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search, color: Colors.pink),
                        hintText: 'Enter search query',
                        focusColor: Colors.pink,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      String query = searchController.text;
                      fetchBooks(query);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink,
                      disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.12,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: Image.network(
                          book.imageLinks['smallThumbnail'].toString()),
                      title: Text(book.title),
                      subtitle: Text(
                        book.authors.join(', '),
                        maxLines: 1,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookInfoScreen(bookInfo: book),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
