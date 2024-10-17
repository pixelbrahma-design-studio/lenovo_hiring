import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  QuizRepository quizRepository = QuizRepository();
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
                  child: Image.asset("assets/images/Smartsprint-logo.png")),
            ),

            Text(
              "Day 1 Quiz Starts in",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimeCard(formatTime(days), "Days"),
                SizedBox(
                  width: 10,
                ),
                _buildTimeCard(formatTime(hours), "Hours"),
                SizedBox(
                  width: 10,
                ),
                _buildTimeCard(formatTime(minutes), "Minutes"),
                SizedBox(
                  width: 10,
                ),
                _buildTimeCard(formatTime(seconds), "Seconds"),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                var a = await quizRepository.getQuizByCount(1);
                context.push('/quiz', extra: a);
              },
              // _remainingTime.inSeconds > 0 ? null : () {
              // Action to take when countdown is over
              //  },
              child: Text("Enter"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildTimeCard(String time, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
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
