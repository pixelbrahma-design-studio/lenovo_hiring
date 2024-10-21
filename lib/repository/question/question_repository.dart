import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:lenovo_hiring/models/question_model/question_model.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';

class QuestionRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseStorage _storage = FirebaseStorage.instance;

  // create Questions
  Future<void> CreateQuestion(
      QuestionModel question, PlatformFile? file) async {
    try {
      String id = _firestore.collection("questions").doc().id;
      question = question.copyWith(
          uid: id,
          createdAt: Timestamp.now(),
          createdBy: firebaseAuth.currentUser?.uid);

      if (file == null) {
        await _firestore.collection("questions").doc(id).set(question.toMap());
      } else {
        // add image
        var url = await saveImage(file, id);
        question = question.copyWith(questionImage: url);
        await _firestore.collection("questions").doc(id).set(question.toMap());
      }
    } catch (e) {
      throw e;
    }
  }

  Future<PlatformFile?> pickImage() async {
    final pickedFile = await FilePicker.platform.pickFiles();

    return pickedFile?.files[0];
  }

  Future<String> saveImage(PlatformFile? image, String id) async {
    try {
      // String fileName = image!.path!;
      Reference storageRef =
          _storage.ref().child('questions/${id}.${image?.extension}');
      UploadTask uploadTask = kIsWeb
          ? storageRef.putData(image!.bytes!)
          : storageRef.putFile(File(image!.path!));

      // Step 2: Get the download URL
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      throw e;
    }
  }

  Stream<List<QuestionModel>> listenAllQuestions() async* {
    yield* _firestore.collection('questions').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return QuestionModel.fromMap(doc.data());
      }).toList();
    }).handleError((e) {
      print("error : $e");
    });
  }

  // get question by uid
  Future<QuestionModel> getQuestionByUid(String uid) async {
    try {
      var data = await _firestore.collection("questions").doc(uid).get();
      return QuestionModel.fromMap(data.data() as Map<String, dynamic>);
    } catch (e) {
      throw e;
    }
  }
}
