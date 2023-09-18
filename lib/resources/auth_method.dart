import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:treasury/helper/models/db_model.dart' as model;

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addNewUser(
      String username, String email, String password) async {
    String res = "An Error occurred";

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      model.User user =
          model.User(uid: cred.user!.uid, email: email, displayName: username);
      await _firestore.collection('user').doc().set(user.toJson());
      res = "Success";
    } catch (e) {
      res = "${e}";
    }

    return res;
  }

  Future<model.User> getUserDetails() async {
    User user = _auth.currentUser!;
    DocumentSnapshot ref =
        await _firestore.collection('user').doc(user.uid).get();
    return model.User.fromJson(ref);
  }
}
