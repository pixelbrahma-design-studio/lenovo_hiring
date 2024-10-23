import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';

class CoundownState extends ChangeNotifier {
  QuizRepository quizRepository = QuizRepository();

  CoundownState() {
    QuizList();
  }

  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  bool noQuiz = false;

  bool showTimer = true;
  bool allQuizzesFinished = false;
  bool isOngoingQuiz = false; // New flag to indicate ongoing quiz
  int currentQuizOrder = 0;

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
    isOngoingQuiz = false; // Reset ongoing quiz flag
    notifyListeners();
  }

  Future<void> QuizList() async {
    try {
      var list = await quizRepository.getQuizeForCountDown();
      if (list.isEmpty) {
        noQuiz = true;
        notifyListeners();
        return;
      }

      quizList = list;
      print("QuizList: ${quizList.length}");

      quizList.sort(
          (a, b) => a.startTime!.toDate().compareTo(b.startTime!.toDate()));
      DateTime now = DateTime.now();
      if (quizList.last.endTime!.toDate().isBefore(now)) {
        allQuizzesFinished = true;
        showTimer = false;
        notifyListeners();
      }

      for (int i = 0; i < quizList.length; i++) {
        var quiz = quizList[i];
        DateTime startTime = quiz.startTime!.toDate();
        DateTime endTime = quiz.endTime!.toDate();
        currentQuizOrder = quiz.order ?? 0;

        if (now.isBefore(startTime)) {
          // Upcoming quiz logic
          print("Upcoming quiz: ${quiz.startTime}");
          startUpcomingQuizTimer(startTime, quiz.order ?? 0, i);
          break; // Exit loop after starting the timer
        } else if (now.isAfter(startTime) && now.isBefore(endTime)) {
          // Ongoing quiz logic
          print("Current quiz is ongoing, showing ongoing message.");
          isOngoingQuiz = true; // Set ongoing flag for current quiz
          startOngoingQuizTimer(endTime, i);
          break; // Exit loop
        }
      }

      notifyListeners();
    } catch (e) {
      print(e);
      // Handle errors appropriately (e.g., notify user)
    }
  }

  void startUpcomingQuizTimer(DateTime targetDate, int quizOrder, int index) {
    currentQuizOrder = quizOrder;
    showTimer = true;
    allQuizzesFinished = false;
    isOngoingQuiz = false; // Upcoming quiz, reset ongoing flag

    Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      Duration remainingTime = targetDate.difference(now);

      if (remainingTime.isNegative) {
        updateCountDown(0, 0, 0, 0);
        timer.cancel(); // Cancel the timer when time is up
        isOngoingQuiz = true; // Set ongoing flag for the upcoming quiz
        showTimer = false; // Hide timer for upcoming quiz
        notifyListeners();

        // Check for the next quiz
        if (index + 1 < quizList.length) {
          var nextQuiz = quizList[index + 1];
          DateTime nextStartTime = nextQuiz.startTime!.toDate();
          startNextQuizTimer(nextStartTime, nextQuiz.order ?? 0);
        } else {
          // Do not show finished message yet
        }
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

  void startOngoingQuizTimer(DateTime endTime, int index) {
    // isOngoingQuiz is already set when we call this method
    showTimer = true; // Show timer for ongoing quiz

    Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      Duration remainingTime = endTime.difference(now);

      if (remainingTime.isNegative) {
        updateCountDown(0, 0, 0, 0);
        timer.cancel(); // Cancel the timer when time is up

        // Check for the next quiz after current one ends
        if (index + 1 < quizList.length) {
          var nextQuiz = quizList[index + 1];
          DateTime nextStartTime = nextQuiz.startTime!.toDate();
          startNextQuizTimer(nextStartTime, nextQuiz.order ?? 0);
        } else {
          // Now it's safe to show the finished message after the last quiz ends
          showFinishedMessage();
          timer.cancel(); // Show finished message only after the last quiz ends
        }
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

  void startNextQuizTimer(DateTime nextStartTime, int nextQuizOrder) {
    currentQuizOrder = nextQuizOrder;
    showTimer = true; // Show timer for the next quiz
    isOngoingQuiz = false; // Reset ongoing flag
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
