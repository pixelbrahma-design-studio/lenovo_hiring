import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/models/attendee_model/attendee_model.dart';
import 'package:lenovo_hiring/models/question_model/question_model.dart';
import 'package:lenovo_hiring/repository/attendee/attendee_repository.dart';
import 'package:lenovo_hiring/repository/attendee/attendee_state.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
import 'package:lenovo_hiring/repository/question/question_repository.dart';
import 'package:provider/provider.dart';
import 'dart:html'; // For Flutter web

class QuizSet extends StatefulWidget {
  QuizSet({super.key});

  @override
  State<QuizSet> createState() => _QuizSetState();
}

class _QuizSetState extends State<QuizSet> {
  AttendeeModel? uiattendeeModel; // Make attendeeModel nullable
  QuestionRepository questionRepository = QuestionRepository();
  AttendeeRepository attendeeRepository = AttendeeRepository();
  // late Timer _timer;
  int _selectedOption = -1;
  // int _timeBalanced = 0;

  @override
  void initState() {
    super.initState();
    context.read<AttendeeState>().setAttendeeModel(
        FirebaseAuth.instance.currentUser!.uid,
        context); // Load attendee asynchronously
    // _startTimer();

    window.onBeforeUnload.listen((event) {
      updateTimeTaken();
    });
  }

  Future<void> updateTimeTaken() async {
    try {
      print("update time taken  called");
      await attendeeRepository.updateAttendee(uiattendeeModel!);
      print("update time taken  called after");
    } catch (e) {
      print("update time taken error: $e");
    }
  }

  @override
  void dispose() {
    updateTimeTaken();
    print("Disposing");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    //return Consumer<AttendeeState>(builder: (context, state, _) {

    return Consumer<AttendeeState>(builder: (context, state, _) {
      uiattendeeModel = state.attendeeModel;
      print("AttendeeModelui: ${uiattendeeModel?.toMap()}");
      // First, ensure attendeeModel is loaded before rendering the UI
      if (state.attendeeModel == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state.questionModel == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      print("AttendeeModel: ${state.attendeeModel?.currentQuestionIndex}");

      return Column(
        children: [
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Container(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/Smartsprint-logo.png")),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: screenWidth * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.timer_outlined, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        '00:${state.timeBalanced} s remaining',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: screenWidth * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${state.attendeeModel!.currentQuestionIndex + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${state.questionModel?.questionTitle}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      for (int i = 0;
                          i < state.questionModel!.options.length;
                          i++)
                        _buildRadioOption(
                            i, state.questionModel!.options[i], state),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Opacity(
                          opacity: _selectedOption != -1 ? 1.0 : 0.7,
                          child: ElevatedButton(
                            onPressed: () {
                              state.updateUserAnswerToDatabase(
                                  FirebaseAuth.instance.currentUser!.uid,
                                  context);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              backgroundColor: Colors.white,
                            ),
                            child: Text(
                              state.attendeeModel!.currentQuestionIndex ==
                                      state.attendeeModel!.questions.length - 1
                                  ? "Submit"
                                  : 'Next',
                              style: TextStyle(
                                color: Color.fromRGBO(28, 10, 103, 1.0),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      );
    });
    //  });
  }

  Widget _buildRadioOption(int value, String text, AttendeeState state) {
    return RadioListTile(
      value: value,
      groupValue: state.selectedAnswer,
      activeColor: Colors.white,
      fillColor: WidgetStateColor.resolveWith(
        (states) => Colors.white,
      ),
      onChanged: (int? newValue) {
        state.updateUserAnswerIndex(newValue!);
        print("Selected option: ${state.selectedAnswer}");
      },
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
