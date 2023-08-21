import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add a new user
  Future<void> addUser(String uid, String email, String displayName) async {
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'displayName': displayName,
    });
  }

  // Add a new book for a user
  Future<void> addBook(String userId, String bookName) async {
    await _firestore.collection('books').add({
      'userId': userId,
      'bookName': bookName,
      'createdTimestamp': FieldValue.serverTimestamp(),
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
