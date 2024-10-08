//import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/LandingPage/AboutSmartSprint.dart';
import 'package:lenovo_hiring/LandingPage/rules.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/footer/footer.dart';

class Smartsprint extends StatelessWidget{
  const Smartsprint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromRGBO(222, 6, 191, 1.0), Color.fromRGBO(77, 20, 74, 1.0)]
            )
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(), 
              Aboutsmartsprint(),
              Rules(),
              Footer(),
            ],
          ),
        ),
      ),
    );
    
  }
}