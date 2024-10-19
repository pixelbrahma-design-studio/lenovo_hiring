import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/models/attendee_model/attendee_model.dart';
import 'package:lenovo_hiring/models/question_model/question_model.dart';
import 'package:lenovo_hiring/repository/attendee/attendee_repository.dart';

class AttendeeState extends ChangeNotifier {
  AttendeeRepository attendeeRepository = AttendeeRepository();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  int timeBalanced = 0;
  AttendeeModel? attendeeModel;
  QuestionModel? questionModel;
  int? selectedAnswer;
  Timer? timer;

  bool incrementAttendeeCount(BuildContext context) {
    if (attendeeModel!.currentQuestionIndex <
        attendeeModel!.questions.length - 1) {
      attendeeModel!.currentQuestionIndex++;
      return false;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully Attended All the Questions'),
        ),
      );

      return true;
    }
  }

  // setTimeBalanced(int timeBalanced) {
  //   this.timeBalanced = timeBalanced;
  //   notifyListeners();
  // }

  // decrese the time
  void decreaseTime() {
    timeBalanced = timeBalanced - 1;
    notifyListeners();
  }

  void setLoading() {
    loading = !loading;
    notifyListeners();
  }

  Future<void> setAttendeeModel(String uid, BuildContext context) async {
    var a = await attendeeRepository.getAttendeeByAttendBy(uid);
    attendeeModel = a;
    print("AttendeeModel: ${attendeeModel?.id}");
    questionModel = a.questions[a.currentQuestionIndex];
    print("QuestionModel: ${questionModel?.questionTitle}");
    int time = attendeeModel!.quizModel!.coundown -
        a.questions[a.currentQuestionIndex].timeTaken!;
    timeBalanced = time;
    print("TimeBalanced: $timeBalanced");
    startTimer(context);

    notifyListeners();
  }

  // start timer
  void startTimer(BuildContext context) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeBalanced > 0) {
        updateTimeTaken();
        decreaseTime();
      } else {
        updateUserAnswerToDatabase(auth.currentUser!.uid, context);
      }
    });
  }

  // update the time taken
  Future<void> updateTimeTaken() async {
    attendeeModel!.questions[attendeeModel!.currentQuestionIndex].timeTaken =
        attendeeModel!.quizModel!.coundown - timeBalanced;
    print(
        "TimeTaken: ${attendeeModel!.questions[attendeeModel!.currentQuestionIndex].timeTaken}");
    await attendeeRepository.updateAttendee(attendeeModel!);
    notifyListeners();
  }

  // Future<void> updateUserAnswerIndex(int index, BuildContext context) async {
  //   attendeeModel!
  //       .questions[attendeeModel!.currentQuestionIndex].userAnswerIndex = index;
  //   await attendeeRepository.updateAttendee(attendeeModel!);
  //   setAttendeeModel(FirebaseAuth.instance.currentUser!.uid, context);
  //   // incrementAttendeeCount(context);
  //   notifyListeners();
  // }

  // update the user answer index
  void updateUserAnswerIndex(int index) {
    selectedAnswer = index;
    notifyListeners();
  }

  // update the user answer index
  Future<void> updateUserAnswerToDatabase(
      String uid, BuildContext context) async {
    try {
      timer!.cancel();
      // update the user answer index
      attendeeModel = attendeeModel!.copyWith(
        questions: attendeeModel!.questions
            .map((e) => e.copyWith(
                userAnswerIndex: e.uid == questionModel!.uid
                    ? selectedAnswer
                    : e.userAnswerIndex))
            .toList(),
      );
      print(
          "after assign user index: ${attendeeModel?.questions[attendeeModel!.currentQuestionIndex].userAnswerIndex}");

      // updating time taken for the question
      attendeeModel!.questions[attendeeModel!.currentQuestionIndex].timeTaken =
          attendeeModel!.quizModel!.coundown - timeBalanced;

      // check if the last question
      bool last = incrementAttendeeCount(context);
      if (last) {
        attendeeModel = attendeeModel!.copyWith(completed: true);
        await attendeeRepository.updateAttendee(attendeeModel!);
        clear(); // clear the state
        context.go('/');
      } else {
        print(
            "AttendeeModel: ${attendeeModel?.id},, ${attendeeModel?.questions[attendeeModel!.currentQuestionIndex].userAnswerIndex}");
        await attendeeRepository.updateAttendee(attendeeModel!);
        selectedAnswer = null;
        setAttendeeModel(uid, context);
      }
    } catch (e) {
      print("error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Occured'),
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    timer!.cancel();
    selectedAnswer = null;
    attendeeModel = null;
    questionModel = null;
    timeBalanced = 0;
    notifyListeners();
  }
}
