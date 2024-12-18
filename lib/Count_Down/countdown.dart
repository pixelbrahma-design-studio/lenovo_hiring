import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lenovo_hiring/Count_Down/coundown_state.dart';
import 'package:lenovo_hiring/models/attendee_model/attendee_model.dart';
import 'package:lenovo_hiring/repository/attendee/attendee_repository.dart';
import 'package:lenovo_hiring/repository/attendee/attendee_state.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';
import 'package:provider/provider.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  void initState() {
    super.initState();
    context.read<CoundownState>().QuizList();

  }

  String formatTime(int timeUnit) {
    return timeUnit.toString().padLeft(2, '0'); // Ensure two digits
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    QuizRepository quizRepository = QuizRepository();
    AttendeeRepository attendeeRepository = AttendeeRepository();

    return Consumer<CoundownState>(builder: (context, state, _) {
      return Column(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/Smartsprint-logo.png",
                      width: screenWidth < 600
                          ? screenWidth * 0.85
                          : screenWidth * 0.5,
                    )),
              ),
              if (state.noQuiz &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
                Text(
                  "No quiz available",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else if (state.allQuizzesFinished &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
                Text(
                  "All quiz finished",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else if (FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
                if (context.read<AuthState>().user?.role == "admin")
                  SizedBox()
                else
                  Column(
                    children: [
                      if (!state.isOngoingQuiz)
                        Text(
                          "Quiz Starts in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        Text(
                          "Day ${state.currentQuizOrder} started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(height: 20),

                      if (state.allQuizzesFinished)
                        Text(
                          "Quiz day finished",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else if (!state.isOngoingQuiz &&
                          state.showTimer &&
                          !state.allQuizzesFinished)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTimeCard(formatTime(state.days), "Days"),
                            SizedBox(width: 10),
                            _buildTimeCard(formatTime(state.hours), "Hours"),
                            SizedBox(width: 10),
                            _buildTimeCard(
                                formatTime(state.minutes), "Minutes"),
                            SizedBox(width: 10),
                            _buildTimeCard(
                                formatTime(state.seconds), "Seconds"),
                          ],
                        )
                      else if (state.isOngoingQuiz)
                        Text(
                          "Quiz ongoing",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        SizedBox(), // If not showing timer or ongoing quiz, return an empty widget

                      const SizedBox(height: 40),
                      if (!state.isOngoingQuiz)
                        Text(
                          "Be ready for the quiz",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (state.isOngoingQuiz)
                        Consumer<AttendeeState>(
                            builder: (context, attendeeState, _) {
                          return attendeeState.loading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      attendeeState.setLoading();
                                      var a =
                                          await quizRepository.getQuizByCount(
                                              DateFormat.yMd()
                                                  .format(DateTime.now()),
                                              context);
                                      AttendeeModel attendeeModel =
                                          AttendeeModel(
                                        totalTimeInSeconds:
                                            a.numberOfQuestions * a.coundown,
                                        completed: false,
                                        attendBy: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        currentQuestionIndex: 0,
                                        points: 0,
                                        quizModel: a,
                                        questions: [],
                                      );
                                      var result = await attendeeRepository
                                          .createAttendee(
                                              attendeeModel, a, context);
                                      if (result == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text("Already attended")));
                                        attendeeState.setLoading();
                                      } else {
                                        attendeeState.setLoading();
                                        context.go('/quiz');
                                      }
                                    } catch (e) {
                                      attendeeState.setLoading();
                                      print(e);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                    }
                                  },
                                  child: Text("Enter"),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 10),
                                    textStyle: TextStyle(
                                      color: Color.fromRGBO(28, 10, 103, 1.0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                );
                        }),
                    ],
                  )
              else
                Text(
                  "Please verify your email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ]);
    });
  }

  Widget _buildTimeCard(String time, String label) {
    double screenWidth = MediaQuery.of(context).size.width;
    double timeFontSize = screenWidth < 769 ? 40 : 60; // 10% of screen width
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontSize: timeFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
