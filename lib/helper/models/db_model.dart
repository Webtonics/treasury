import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String displayName;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
  });
}

class Book {
  final String bookId;
  final String userId;
  final String bookName;
  final DateTime createdTimestamp;

  Book({
    required this.bookId,
    required this.userId,
    required this.bookName,
    required this.createdTimestamp,
  });
}

class Transaction {
  final String transactionId;
  final String bookId;
  final double amount;
  final String description;
  final String categoryId;
  final DateTime timestamp;

  Transaction({
    required this.transactionId,
    required this.bookId,
    required this.amount,
    required this.description,
    required this.categoryId,
    required this.timestamp,
  });
}

class DatabaseHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Private constructor
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<void> addUser(String uid, String email, String displayName) async {
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'displayName': displayName,
    });
  }

  Future<void> addBook(String userId, String bookName) async {
    await _firestore.collection('books').add({
      'userId': userId,
      'bookName': bookName,
      'createdTimestamp': FieldValue.serverTimestamp(),
    });
  }

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

  Future<List<Book>> getUserBooks(String userId) async {
    final querySnapshot = await _firestore
        .collection('books')
        .where('userId', isEqualTo: userId)
        .get();
    return parseUserBooks(querySnapshot);
  }

  List<Book> parseUserBooks(QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Book(
        bookId: doc.id,
        userId: data['userId'],
        bookName: data['bookName'],
        createdTimestamp: data['createdTimestamp'].toDate(),
      );
    }).toList();
  }

  Future<List<Transaction>> getBookTransactions(String bookId) async {
    final querySnapshot = await _firestore
        .collection('transactions')
        .where('bookId', isEqualTo: bookId)
        .get();
    return parseBookTransactions(querySnapshot);
  }

  List<Transaction> parseBookTransactions(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return Transaction(
        transactionId: doc.id,
        bookId: data['bookId'],
        amount: data['amount'],
        description: data['description'],
        categoryId: data['categoryId'],
        timestamp: data['timestamp'].toDate(),
      );
    }).toList();
  }
}
