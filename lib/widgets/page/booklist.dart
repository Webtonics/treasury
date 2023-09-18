import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treasury/screens/book.dart';

import '../../helper/db_helper.dart';
import '../../helper/models/db_model.dart';

class BookList extends StatelessWidget {
  BookList({
    super.key,
  });

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final String? userId = _auth.currentUser?.uid.toString();

    return StreamBuilder<List<Book>>(
        stream:
            _databaseHelper.getBooksByUserStream(userId), // Pass the user ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No books available.'));
          } else {
            final userBooks = snapshot.data!;
            return ListView.builder(
              // shrinkWrap: true,
              itemCount: userBooks.length,
              itemBuilder: (context, index) {
                final book = userBooks[index];
                final bookName = book.bookName; // Use an empty str

                // Future<String?>getBookName(String bookname) async {
                //   String? bookIdGet =
                //       await context.read<DatabaseHelper>().getBookIdByName(bookname);
                //   return bookIdGet;
                // }

                // Inside an asynchronous function (e.g., an async onPressed callback)
                Future<Object> someAsyncFunction(String mybookName) async {
                  final String mybookName =
                      bookName; // Replace with the actual book name
                  final String? mybookId = await context
                      .read<DatabaseHelper>()
                      .getBookId(mybookName);

                  if (mybookId != null) {
                    // Do something with the book ID
                    return mybookId;
                  } else {
                    print('Book not found.');
                    return const Text('Book not found.');
                  }
                }

                return ListTile(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookView(
                              book: someAsyncFunction(bookName).toString(),
                            )));
                  },
                  leading: Icon(
                    Icons.group,
                    color: Colors.blue[900],
                  ),
                  title: Text(bookName),
                  subtitle: Text(book.createdTimestamp.toString()),
                  trailing: const Text(
                    "2100",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          }
        });
  }
}
