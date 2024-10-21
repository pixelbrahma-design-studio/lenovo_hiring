import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';

class CoundownState extends ChangeNotifier {
  QuizRepository quizRepository = QuizRepository();

  CoundownState() {
    QuizeList();
  }

  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  bool showTimer = true;
  bool allQuizzesFinished = false;
  int currentQuizOrder = 0; // To store the current quiz order

  List<QuizModel> quizList = [];

  void updateCountDown(int days, int hours, int minutes, int seconds) {
    this.days = days;
    this.hours = hours;
    this.minutes = minutes;
    this.seconds = seconds;
    notifyListeners();
  }

  void showFinishedMessage() {
    allQuizzesFinished = true;
    showTimer = false;
    notifyListeners();
  }

  // Fetch quiz list and set the countdown logic
  Future<void> QuizeList() async {
    try {
      var list = await quizRepository.getQuizeForCountDown();
      quizList = list;
      print("QuizList: ${quizList.length}");

      // Sort quizzes by start time to ensure correct order
      quizList.sort(
          (a, b) => a.startTime!.toDate().compareTo(b.startTime!.toDate()));
      DateTime now = DateTime.now();

      // Iterate over quizzes and set the timer for each in order
      for (int i = 0; i < quizList.length; i++) {
        var quiz = quizList[i];
        DateTime now = DateTime.now();
        DateTime startTime = quiz.startTime!.toDate();
        DateTime endTime = quiz.endTime!.toDate();

        // Check if the current time is before the quiz start time
        if (now.isBefore(startTime)) {
          print("Upcoming quiz: ${quiz.startTime}");
          DateTime targetDate = startTime;

          // Set the order of the current quiz
          currentQuizOrder = quiz.order ?? 0;

          // Show the timer for the upcoming quiz
          showTimer = true;
          allQuizzesFinished = false;

          Timer.periodic(const Duration(seconds: 1), (timer) {
            DateTime now = DateTime.now();
            Duration remainingTime = targetDate.difference(now);

            if (remainingTime.isNegative) {
              // Time has passed, stop the timer
              timer.cancel();
              updateCountDown(0, 0, 0, 0);

              // Start the next quiz timer if the current one has ended
              if (now.isAfter(endTime)) {
                print("Quiz ended, starting next quiz timer...");
                if (i + 1 < quizList.length) {
                  var nextQuiz = quizList[i + 1];
                  DateTime nextStartTime = nextQuiz.startTime!.toDate();
                  startNextQuizTimer(nextStartTime, nextQuiz.order ?? 0);
                } else {
                  // All quizzes have ended, show finished message
                  showFinishedMessage();
                }
              }
            } else {
              // Update the countdown timer display
              updateCountDown(
                remainingTime.inDays,
                remainingTime.inHours.remainder(24),
                remainingTime.inMinutes.remainder(60),
                remainingTime.inSeconds.remainder(60),
              );
            }
          });
          break; // Exit loop after setting the timer for the first valid quiz
        } else if (now.isBefore(endTime)) {
          // The current quiz is ongoing, hide the timer
          print("Current quiz is ongoing, hiding timer.");
          showTimer = false;
          notifyListeners();
          break; // Exit loop, timer will resume for the next quiz
        }
      }

      // If no upcoming quizzes, show "Quiz day finished"
      if (quizList.isEmpty || now.isAfter(quizList.last.endTime!.toDate())) {
        showFinishedMessage();
      }

      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  void startNextQuizTimer(DateTime nextStartTime, int nextQuizOrder) {
    currentQuizOrder = nextQuizOrder;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      Duration remainingTime = nextStartTime.difference(now);

      if (remainingTime.isNegative) {
        timer.cancel();
        updateCountDown(0, 0, 0, 0);
        notifyListeners();
      } else {
        updateCountDown(
          remainingTime.inDays,
          remainingTime.inHours.remainder(24),
          remainingTime.inMinutes.remainder(60),
          remainingTime.inSeconds.remainder(60),
        );
      }
    });
  }
}
