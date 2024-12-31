import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';

class AuthRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // create User (register)
  Future<void> signUpWithEmail(UserModel userModel, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: password,
      );
      User? user = userCredential.user;
      userModel =
          userModel.copyWith(uid: user?.uid, createdAt: Timestamp.now());
      bool created = await createUserData(userModel);
      if (created) {
        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();
          print('Email verification sent!');
        }
      } else {
        throw "error";
      }
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      throw e;
    }
  }

  // save user data
  Future<bool> createUserData(UserModel userModel) async {
    try {
      userModel =
          userModel.copyWith(uid: userModel.uid, createdAt: Timestamp.now());
      await _firestore
          .collection("users")
          .doc(userModel.uid)
          .set(userModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  // login user

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        var userModel = await getCurrentUser(user.uid);
        return userModel;
      } else {
        print('Email is not verified. Logging out...');
        await FirebaseAuth.instance.signOut();
        return null;

        // Notify user to verify email
      }
    } on FirebaseAuthException catch (e) {
      print('Login error: ${e.message}');
      throw e;
    }
  }

  Future<UserModel> getCurrentUser(String? uid) async {
    try {
      var data = await _firestore.collection("users").doc(uid).get();
      return UserModel.fromMap(data.data() as Map<String, dynamic>);
    } catch (e) {
      throw e;
    }
  }

  // get admins from user collection
  Future<List<UserModel>> getAdmins() async {
    try {
      var data = await _firestore
          .collection("users")
          .where("role", isEqualTo: "admin")
          .get();
      return data.docs.map((e) => UserModel.fromMap(e.data())).toList();
    } catch (e) {
      throw e;
    }
  }

  // Check email verification and update Firestore
  Future<void> checkEmailVerificationAndUpdate({required String uid}) async {
    User? user = firebaseAuth.currentUser;

    try {
      // Update emailVerified field in Firestore
      await _firestore.collection("users").doc(uid).update({
        'emailVerified': true,
      });
      print('Email verification status updated in Firestore');
    } catch (e) {
      print('Error updating emailVerified: $e');
      throw e;
    }
  }

}
