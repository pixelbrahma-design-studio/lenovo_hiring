import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/question/question_repository.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';

class QuizeQuestionRandomCheck extends StatefulWidget {
  const QuizeQuestionRandomCheck({super.key});

  @override
  State<QuizeQuestionRandomCheck> createState() =>
      _QuizeQuestionRandomCheckState();
}

class _QuizeQuestionRandomCheckState extends State<QuizeQuestionRandomCheck> {
  QuizRepository quizRepository = QuizRepository();
  QuestionRepository questionRepository = QuestionRepository();
  QuizModel? quizModel;
  @override
  void initState() {
    getrandomQuestion();
    super.initState();
  }

  Future<void> getrandomQuestion() async {
    var a = await quizRepository.getQuizByCount(1);
    setState(() {
      quizModel = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quize Question Random Check"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text("Quize Question Random Check"),
          Text(quizModel?.theme ?? "no theme"),
          // fetch the question usign quistion id
          if (quizModel == null)
            CircularProgressIndicator()
          else
            Column(
              children: quizModel?.questions.map((e) {
                    return FutureBuilder(
                      future: questionRepository.getQuestionByUid(e),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        }
                        return Text(snapshot.data?.questionTitle ?? "no title");
                      },
                    );
                  }).toList() ??
                  [],
            )
        ],
      )),
    );
  }
}
