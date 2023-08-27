//Creating  an auth service

import 'package:treasury/services/auth/firebase_authprovider.dart';

import 'auth_provider.dart';
import 'auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  AuthService(this.provider);

  //making it one instance
  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  //create User
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(email: email, password: password);

  //currentUser
  @override
  AuthUser? get currentUser => provider.currentUser;

  //Login user
  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(email: email, password: password);

  //Logout user
  @override
  Future<void> logOut() => provider.logOut();

  //Send email verification
  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();
}
