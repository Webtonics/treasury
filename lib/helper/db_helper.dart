import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'models/db_model.dart';

class DatabaseHelper {
  // firestore init
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //firebase auth intialization
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add a new user
  Future<void> addUser(
      String email, String password, String displayName) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'displayName': displayName,
        });
      }
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  //funtion to get uid
  Future<String?> getUserID() async {
    final user = _auth.currentUser;
    // await user.uid
    return user?.uid;
  }

  // Add a new book for a user
  Future<void> addBook(String bookName) async {
    final userId = await getUserID();
    await _firestore.collection('books').add({
      'userId': userId,
      'bookName': bookName,
      'createdTimestamp': FieldValue.serverTimestamp(),
    });
  }

//get book of a particular user
  Stream<List<Book>> getBooksByUserStream(String? userId) {
    return FirebaseFirestore.instance
        .collection('books')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return Book(
          bookId: doc.id,
          userId: data['userId'],
          bookName: data['bookName'],
          createdTimestamp: data['createdTimestamp'].toDate(),
        );
      }).toList();
    });
  }

  // Add a new transaction to a book
  Future<void> addTransaction(String bookId, double amount, String description,
      String categoryId) async {
    await _firestore.collection('transactions').add({
      'bookId': bookId,
      'amount': amount,
      'description': description,
      'categoryId': categoryId,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Get all books for a user
  Future<QuerySnapshot<Map<String, dynamic>>> getUserBooks(
      String userId) async {
    return await _firestore
        .collection('books')
        .where('userId', isEqualTo: userId)
        .get();
  }

  // Get all transactions for a book
  Future<QuerySnapshot<Map<String, dynamic>>> getBookTransactions(
      String bookId) async {
    return await _firestore
        .collection('transactions')
        .where('bookId', isEqualTo: bookId)
        .get();
  }
}
