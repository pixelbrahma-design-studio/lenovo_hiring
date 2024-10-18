import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';
import 'package:lenovo_hiring/repository/auth/auth_repository.dart';

class AuthState extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthRepository authRepository = AuthRepository();
  UserModel? _user;
  UserModel? get user => _user;

  AuthState() {
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        _user = null;
      } else {
        getCurrentUser();
      }
      notifyListeners();
    });
  }

  void setuser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<void> getCurrentUser() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      UserModel userModell = await authRepository.getCurrentUser(user.uid);
      _user = userModell;
    }
    notifyListeners();
  }

  void logout(BuildContext context) async {
    try {
      await firebaseAuth.signOut();
      _user = null;
      notifyListeners();
      context.go('/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
      print(e);
    }
    notifyListeners();
  }
}
