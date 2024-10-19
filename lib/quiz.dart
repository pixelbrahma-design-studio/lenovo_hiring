import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/Quiz/quiz_set.dart';
import 'package:lenovo_hiring/models/attendee_model/attendee_model.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late Timer _timer;
  final String startTime = "07:00 PM"; // 7 PM
  final String endTime = "08:00 PM"; // 8 PM

  @override
  void initState() {
    super.initState();
    // Start a timer to check the time every minute
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      _checkTimeAndRedirect();
    });
  }

  void _checkTimeAndRedirect() {
    final now = DateTime.now();
    final endHour = 20; // 8 PM

    // Check if the current time is equal to or past the end time
    if (now.hour >= endHour) {
      // Cancel the timer
      _timer.cancel();
      // Navigate to another page (replace with your end page)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => EndPage()),
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Color.fromRGBO(222, 6, 191, 1.0),
            Color.fromRGBO(77, 20, 74, 1.0)
          ]),
          image: DecorationImage(
            image: AssetImage("assets/images/grid.png"),
            repeat: ImageRepeat.repeatY,
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Navbar(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                  child: Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/Smartsprint-logo.png",
                      width: screenWidth < 600 ? screenWidth * 0.85 : screenWidth * 0.5,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                // Display Quiz Time
                Text(
                  'Quiz will be live till $endTime.',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QuizSet(),
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

// Example End Page (you can customize this)
class EndPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Ended'),
      ),
      body: Center(
        child: Text(
          'The quiz has ended!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
