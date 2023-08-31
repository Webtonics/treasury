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

class Category {
  final String type;
  Category({required this.type});
}
