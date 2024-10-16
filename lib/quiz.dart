import 'package:flutter/material.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/Quiz/quiz_set.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.quizModel});
  final QuizModel quizModel;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromRGBO(222, 6, 191, 1.0),
              Color.fromRGBO(77, 20, 74, 1.0)
            ]),
            image: DecorationImage(
              image: AssetImage("assets/images/grid.png"),
              repeat: ImageRepeat.repeatY,
              opacity: 0.5,
              fit: BoxFit.cover,
            )),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Navbar(),
                  ],
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuizSet(quizModel: widget.quizModel),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Footer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
