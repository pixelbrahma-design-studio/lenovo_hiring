import 'package:flutter/material.dart';
import 'package:lenovo_hiring/About_Lenovo/about_lenovo_content.dart';
import 'package:lenovo_hiring/About_Lenovo/about_lenovo_content_mobile.dart';
import 'package:lenovo_hiring/About_Lenovo/about_lenovo_content_tablet.dart';
import 'package:lenovo_hiring/Footer/Footer_About.dart';
import 'package:lenovo_hiring/Navbar/Navbar_About.dart';

class AboutLenovoPage extends StatefulWidget {
  const AboutLenovoPage({super.key});

  @override
  State<AboutLenovoPage> createState() => _AboutLenovoPageState();
}

class _AboutLenovoPageState extends State<AboutLenovoPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const NavbarAbout(),
              screenWidth > 1024 ? AboutLenovoContent() : screenWidth < 769 ? AboutLenovoContentMobile() : AboutLenovoContentTablet(),
              const FooterAbout(),
            ],
          ),
        ),
      ),
    );
  }
}