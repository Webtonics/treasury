import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  //to see if the user is verified
  final bool isEmailVerified;
  final String? email;
  // create a constructor for the user?
  const AuthUser({required this.isEmailVerified, required this.email});

  //create a factory constructor to aid in mirroring the responsibility of the user
  factory AuthUser.fromFirebase(User user) =>
      AuthUser(email: user.email, isEmailVerified: user.emailVerified);
}
