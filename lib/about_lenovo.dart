import 'package:flutter/material.dart';
import 'package:lenovo_hiring/About_Lenovo/about_lenovo_content.dart';
import 'package:lenovo_hiring/Footer/Footer_About.dart';
import 'package:lenovo_hiring/Navbar/Navbar_About.dart';

class AboutLenovoPage extends StatelessWidget {
  const AboutLenovoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              NavbarAbout(),
              AboutLenovoContent(),
              FooterAbout(),
            ],
          ),
        ),
      ),
    );
  }
}