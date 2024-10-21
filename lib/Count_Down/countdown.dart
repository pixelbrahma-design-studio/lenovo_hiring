import 'dart:async';
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
  QuizRepository quizRepository = QuizRepository();
  AttendeeRepository attendeeRepository = AttendeeRepository();
  late Timer _timer;
  Duration _remainingTime = Duration();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    DateTime targetDate = DateTime(2024, 10, 15, 10, 0,
        0); // Set your target date here (year, month, day, hour, min, sec)

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      setState(() {
        _remainingTime = targetDate.difference(now);
        if (_remainingTime.isNegative) {
          _timer.cancel();
          _remainingTime = Duration.zero;
        }
      });
    });
  }

  String formatTime(int timeUnit) {
    return timeUnit.toString().padLeft(2, '0'); // Ensure two digits
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int days = _remainingTime.inDays;
    int hours = _remainingTime.inHours.remainder(24);
    int minutes = _remainingTime.inMinutes.remainder(60);
    int seconds = _remainingTime.inSeconds.remainder(60);

    return Column(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Smartsprint-logo.png",
                    width: screenWidth < 600
                        ? screenWidth * 0.85
                        : screenWidth * 0.5,
                  )),
            ),
            if (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
              if (context.read<AuthState>().user?.role == "admin")
                SizedBox()
              else
                Column(
                  children: [
                    Text(
                      "Day ${context.read<CoundownState>().currentQuizOrder} Quiz Starts in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Text(
                    //   _remainingTime.inSeconds > 0
                    //     ? _formatDuration(_remainingTime)
                    //     : "00 00 00 00",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 48,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Consumer<CoundownState>(builder: (context, state, _) {
                      if (state.allQuizzesFinished) {
                        return Text(
                          "Quiz day finished",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }

                      if (state.showTimer) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildTimeCard(formatTime(state.days), "Days"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildTimeCard(formatTime(state.hours), "Hours"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildTimeCard(
                                formatTime(state.minutes), "Minutes"),
                            SizedBox(
                              width: 10,
                            ),
                            _buildTimeCard(
                                formatTime(state.seconds), "Seconds"),
                          ],
                        );
                      } else {
                        return Text(
                          "Quiz ongoing",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }
                    }),

                    // Consumer<CoundownState>(builder: (context, state, _) {
                    //   return Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text("${state.days}"),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text("${state.hours}"),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text("${state.minutes}"),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text("${state.seconds}"),
                    // _buildTimeCard(formatTime(), "Days"),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // _buildTimeCard(formatTime(hours), "Hours"),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // _buildTimeCard(formatTime(minutes), "Minutes"),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    // _buildTimeCard(formatTime(seconds), "Seconds"),
                    //     ],
                    //   );
                    // }),
                    const SizedBox(height: 40),

                    if (context.read<CoundownState>().allQuizzesFinished)
                      Text(
                        "All quizzes finished",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else if (context.read<CoundownState>().showTimer)
                      Text(
                        "be ready for the quiz",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else
                      Consumer<AttendeeState>(builder: (context, state, _) {
                        return state.loading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  try {
                                    state.setLoading();
                                    var a = await quizRepository.getQuizByCount(
                                        DateFormat.yMd().format(DateTime.now()),
                                        context);
                                    AttendeeModel attendeeModel = AttendeeModel(
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
                                    var result =
                                        await attendeeRepository.createAttendee(
                                            attendeeModel, a, context);
                                    if (result == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Already attended")));
                                      state.setLoading();
                                    } else {
                                      state.setLoading();

                                      context.go('/quiz');
                                    }
                                  } catch (e) {
                                    state.setLoading();
                                    print(e);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(e.toString())));
                                  }
                                },
                                // _remainingTime.inSeconds > 0 ? null : () {
                                // Action to take when countdown is over
                                //  },
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
  }

  Widget _buildTimeCard(String time, String label) {
    double screenWidth = MediaQuery.of(context).size.width;
    double timeFontSize = screenWidth < 769 ? 40 : 60; // 10% of screen width
    //double labelFontSize = screenWidth * 0.04; // 4% of screen width
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

void main() => runApp(MaterialApp(
      home: CountdownTimer(),
    ));
