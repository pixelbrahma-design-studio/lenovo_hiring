import 'package:flutter/material.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/QuizResult/quiz_result_content.dart';

class QuizResult extends StatelessWidget {
  const QuizResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromRGBO(222, 6, 191, 1.0), Color.fromRGBO(77, 20, 74, 1.0)]
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/grid.png"),
            repeat: ImageRepeat.repeatY,
            opacity: 0.5,
            fit: BoxFit.cover,
          )
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Navbar(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuizResultContent(),
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