import 'package:flutter/material.dart';

class AttendeeState extends ChangeNotifier {
  int currentQuestionIndex = 0;
  int get attendeeCount => currentQuestionIndex;

  void incrementAttendeeCount(int questionsLength, BuildContext context) {
    if (currentQuestionIndex < questionsLength - 1) {
      currentQuestionIndex++;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully Attended All the Questions'),
        ),
      );
    }
    notifyListeners();
  }

  // void decrementAttendeeCount(int questionsLength) {
  //   if (currentQuestionIndex > 0) {
  //     currentQuestionIndex--;
  //   }
  //   notifyListeners();
  // }
}
