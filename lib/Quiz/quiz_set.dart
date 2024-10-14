import 'dart:async';
import 'package:flutter/material.dart';

class QuizSet extends StatefulWidget {
  const QuizSet({super.key});

  @override
  State<QuizSet> createState() => _QuizSetState();
}

class _QuizSetState extends State<QuizSet> {
  late Timer _timer;
  int _remainingSeconds = 30; // Set your quiz time limit
  int _selectedOption = -1; // To track selected radio button

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // Start countdown timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
        // Handle timeout, for example, move to the next question
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
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

              SizedBox(
                height: 30,
              ),

              Container(
                width: screenWidth*0.8,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.timer_outlined, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        '00:${_remainingSeconds.toString().padLeft(2, '0')} s remaining',
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
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Question 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                  
                      SizedBox(height: 20),
                  
                      Text(
                        "Lenovo's strategic direction emphasizes the creation of transformative technologies to advance a more equitable, reliable, and eco-friendly digital landscape. Which of the following best encapsulates this vision?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  
                      SizedBox(height: 20),
                  
                      // Multiple-choice options using radio buttons
                      _buildRadioOption(0, 'Smarter Technology for All'),
                      _buildRadioOption(1, 'Smarter AI for All'),
                      _buildRadioOption(2, 'Innovation for Tomorrow'),
                      _buildRadioOption(3, 'Smart Devices for Everyone'),

                      SizedBox(height: 30,),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Opacity(
                          opacity: _selectedOption != -1 ? 1.0 : 0.7, // Full opacity when enabled, reduced opacity when disabled
                          child: ElevatedButton(
                            onPressed: _selectedOption != -1 ? _nextQuestion : null, // Button enabled if an option is selected
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                              backgroundColor: Colors.white, // Button color remains the same
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Color.fromRGBO(28, 10, 103, 1.0), // Text color adjusts based on state
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    );
  }

  // Build Radio option widgets
  Widget _buildRadioOption(int value, String text) {
    return RadioListTile(
      value: value,
      groupValue: _selectedOption,
      activeColor: Colors.white,
      fillColor: WidgetStateColor.resolveWith(
        (states) => Colors.white,
      ),
      onChanged: (int? newValue) {
        setState(() {
          _selectedOption = newValue!;
        });
      },
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  // Action on "Next" button press
  void _nextQuestion() {
    // Logic to proceed to the next question
    // You can either update the UI with the next question or navigate to another screen.
  }
}
