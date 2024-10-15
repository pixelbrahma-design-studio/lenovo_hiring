import 'dart:math';

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

  // GET QUIZ BY COUNT WITH RANDOM QUESTION
  Future<QuizModel> getQuizByCount(int count) async {
    try {
      var data = await _firestore
          .collection("quiz")
          .where("order", isEqualTo: count)
          .limit(1)
          .get();
      QuizModel quiz = QuizModel.fromMap(data.docs.first.data());
      // get qustions with quiz id limit 5 with random
      var questions = await _firestore
          .collection("questions")
          .where("quizId", isEqualTo: quiz.uid)
          .get();
      List<DocumentSnapshot<Map<String, dynamic>>> allQuestions =
          questions.docs;

      // Shuffle the list of questions
      allQuestions.shuffle(Random());

      // Get the first 5 random questions
      List<String> randomQuestions =
          allQuestions.take(3).map((e) => e.data()?["uid"] as String).toList();

      // Assuming `quiz` is already defined and is of type `QuizModel`
      quiz.questions = randomQuestions;

      return quiz;
    } catch (e) {
      throw e;
    }
  }
}
