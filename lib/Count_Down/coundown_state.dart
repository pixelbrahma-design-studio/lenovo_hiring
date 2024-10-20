import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizTimerProvider with ChangeNotifier {
  Timer? _timer;
  Duration _timeRemaining = Duration();
  DateTime? _startTime;
  DateTime? _endTime;
  bool _isStarted = false;
  bool _isEnded = false;

  Duration get timeRemaining => _timeRemaining;
  bool get isStarted => _isStarted;
  bool get isEnded => _isEnded;

  QuizTimerProvider() {
    _fetchQuizTimes();
  }

  void _fetchQuizTimes() async {
    // Fetch quiz start and end times from Firestore
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('quizzes')
        .doc('quizId') // Replace with your document ID
        .get();

    Timestamp startTime = snapshot['start_time'];
    Timestamp endTime = snapshot['end_time'];

    _startTime = startTime.toDate();
    _endTime = endTime.toDate();

    _startCountdown();
  }

  void _startCountdown() {
    if (_startTime == null || _endTime == null) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();

      if (now.isBefore(_startTime!)) {
        // Countdown to quiz start
        _isStarted = false;
        _isEnded = false;
        _timeRemaining = _startTime!.difference(now);
      } else if (now.isAfter(_startTime!) && now.isBefore(_endTime!)) {
        // Quiz is live
        _isStarted = true;
        _isEnded = false;
        _timeRemaining = Duration();
      } else if (now.isAfter(_endTime!)) {
        // Quiz has ended
        _isStarted = false;
        _isEnded = true;
        _timer?.cancel(); // Stop current countdown
        _fetchNextQuizTime(); // Fetch the next quiz time
      }
      notifyListeners(); // Notify listeners of changes
    });
  }

  void _fetchNextQuizTime() async {
    // Fetch the next quiz start time from Firestore
    DocumentSnapshot nextQuizSnapshot = await FirebaseFirestore.instance
        .collection('quizzes')
        .doc('nextQuizId') // Replace with next quiz document ID
        .get();

    Timestamp nextStartTime = nextQuizSnapshot['start_time'];

    _startTime = nextStartTime.toDate();
    _startCountdown(); // Restart the countdown for the next quiz
  }

  @override
  void dispose() {
    _timer?.cancel(); // Dispose the timer when the provider is disposed
    super.dispose();
  }
}
