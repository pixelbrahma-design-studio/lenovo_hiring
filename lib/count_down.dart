import 'package:flutter/material.dart';
import 'package:lenovo_hiring/Count_Down/countdown.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromRGBO(222, 6, 191, 1.0), Color.fromRGBO(77, 20, 74, 1.0)]
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/grid.png"),
            repeat: ImageRepeat.repeatY,
            opacity: 0.5,
            fit: BoxFit.cover,
          )
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Navbar(), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountdownTimer(),
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