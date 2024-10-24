import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';
import 'package:lenovo_hiring/repository/auth/auth_repository.dart';

class AuthState extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthRepository authRepository = AuthRepository();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;
  UserModel? get user => _user;
  List<UserModel> admins = [];

  List<String> navTitles = [
    "SMARTSPRINT",
    "CAMPUS HIRING 2025",
    "ABOUT LENOVO",
    'LEADERBOARD',
    "LOGIN",
    "LOGOUT"
  ];

  List<String> adminNavTitles = [
    "SMARTSPRINT",
    "CAMPUS HIRING 2025",
    "ABOUT LENOVO",
    'ADD QUIZ',
    'ADD QUESTION',
    'LEADERBOARD',
    "LOGIN",
    'LOGOUT'
  ];

  AuthState() {
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        _user = null;
      } else {
        getCurrentUser();
        listenAdmins();
      }
      notifyListeners();
    });
  }

  List<String> nav() {
    if (_user == null) {
      navTitles = [
        'SMARTSPRINT',
        'CAMPUS HIRING 2025',
        'ABOUT LENOVO',
        'LOGIN'
      ];
      adminNavTitles = [
        'SMARTSPRINT',
        'CAMPUS HIRING 2025',
        'ABOUT LENOVO',
        'LOGIN'
      ];
    } else {
      navTitles = [
        'SMARTSPRINT',
        'CAMPUS HIRING 2025',
        'ABOUT LENOVO',
        'LEADERBOARD',
        'LOGOUT'
      ];
      adminNavTitles = [
        'SMARTSPRINT',
        'CAMPUS HIRING 2025',
        'ABOUT LENOVO',
        'ADD QUIZ',
        'ADD QUESTION',
        'LEADERBOARD',
        'ADD ADMIN',
        'LOGOUT'
      ];
    }

    return _user?.role == "admin" ? adminNavTitles : navTitles;
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

  // LISTEN admis
  void listenAdmins() async {
    _firestore
        .collection("users")
        .where("role", isEqualTo: "admin")
        .snapshots()
        .listen((event) {
      admins = event.docs.map((e) => UserModel.fromMap(e.data())).toList();
      notifyListeners();
    });
  }
}
