import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:treasury/services/auth/auth_service.dart';

import '../../helper/db_helper.dart';
import '../../helper/models/db_model.dart';

class BookList extends StatelessWidget {
  BookList({
    super.key,
  });

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  // final AuthService _authService = AuthService.firebase();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<String> userIdcred() async {
  //   final String? user = await _databaseHelper.getUserID();
  //   return user.toString();
  // }

  // _databaseHelper.getUserID() as String; // Replace with the actual user ID
  // final Stream<List<Book>> userBooksStream = _databaseHelper.getBooksByUserStream() as Stream<List<Book>>;

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
                return ListTile(
                  onTap: () {
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     // allowSnapshotting: false,
                    //     builder: (context) => const BookView() ));
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/books/', (route) => false);
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
                  // trailing: Row(
                  //   children: const [
                  //     Text("2100"),
                  //     Icon(Icons.drag_indicator_outlined)
                  //   ],
                  // ),
                );
              },
            );
          }
//     return StreamBuilder<List<Book>>(
//       stream: _databaseHelper.getBooksByUserStream(userId), // Pass the user ID
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No books available.'));
//         } else {
//           final userBooks = snapshot.data!;

//           return ListView.builder(
//             itemCount: userBooks.length,
//             itemBuilder: (context, index) {
//               final book = userBooks[index];
//               final bookName =
//                   book.bookName; // Use an empty string if bookName is null
//               return ListTile(
//                 title: Text(bookName),
//                 subtitle: Text('Created: ${book.createdTimestamp.toString()}'),
//               );
//             },
//           );
//         }
//       },
//     );
        });
  }
}
