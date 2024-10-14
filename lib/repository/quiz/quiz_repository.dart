import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';

class QuizRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> CreateQuiz(QuizModel quiz) async {
    try {
      String id = _firestore.collection("quiz").doc().id;
      quiz = quiz.copyWith(createdAt: Timestamp.now(), uid: id);
      await _firestore.collection("quiz").doc(id).set(quiz.toMap());
    } catch (e) {
      throw e;
    }
  }

  Future<List<QuizModel>> listenQuiz() async {
    try {
      var data = await _firestore.collection("quiz").get();
      return data.docs
          .map((e) => QuizModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw e;
    }
  }
}
