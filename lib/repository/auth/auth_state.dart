import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';

class AuthState extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserModel? _user;
  UserModel? get user => _user;

  void setuser(UserModel user) {
    _user = user;
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
