import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
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
      // appBar: AppBar(
      //   title: Text("Quize Question Random Check"),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromRGBO(222, 6, 191, 1.0), Color.fromRGBO(77, 20, 74, 1.0)]
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/grid-2.png"),
            repeat: ImageRepeat.repeatY,
            opacity: 0.5,
            fit: BoxFit.cover,
          )
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Navbar(),
            SizedBox(height: 50,),
            Container(
              child: Column(
                children: [
                  Text(
                    "Quiz Question Random Check",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    quizModel?.theme ?? "no theme",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 30,),
                  // fetch the question usign quistion id
                  if (quizModel == null)
                    CircularProgressIndicator()
                  else
                    Column(
                      children: quizModel?.questions.map((e) {
                        return Column(
                          children: [
                            FutureBuilder(
                              future: questionRepository.getQuestionByUid(e),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text("Error: ${snapshot.error}");
                                }
                                return Text(
                                  snapshot.data?.questionTitle ?? "no title",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 16), // Adds a gap between each item
                          ],
                        );
                      }).toList() ??
                      [],
                    ),
                ],
              ),
            ),
            
            Footer()
          ],
        )),
      ),
    );
  }
}
