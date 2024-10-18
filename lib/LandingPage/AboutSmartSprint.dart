import 'package:flutter/material.dart';

class Aboutsmartsprint extends StatelessWidget {
  const Aboutsmartsprint({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>992){
          return DesktopAboutSmartSprint();
        } else if (constraints.maxWidth > 425 && constraints.maxWidth < 992) {
          return TabletAboutSmartSprint();
        } else {
          return MobileAboutSmartSprint();
        }
      }
    );
  }

}


class DesktopAboutSmartSprint extends StatelessWidget {
  const DesktopAboutSmartSprint({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("All You Need to Know About".toUpperCase(),
            textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 30.0),
              child: Image.asset(
                "assets/images/smartsprint-quiz-logo.png",
                width: screenWidth * 0.3,
                ),
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Lenovo SmartSprint Quiz offers final-year students from selected colleges a unique opportunity to showcase their knowledge and skills. Over four days, participants will engage with topics related to Lenovo's Solutions and Services Group (SSG) and Digital Workspace Solution (DWS) Delivery business.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Top performers will gain direct entry into the final interview round of Lenovo’s recruitment process for the 2025 Batch campus hiring.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]
        ),
      );
  }
}
  
class TabletAboutSmartSprint extends StatelessWidget {
  const TabletAboutSmartSprint({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("All You Need to Know About".toUpperCase(),
            textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 30.0),
              child: Image.asset(
                "assets/images/smartsprint-quiz-logo.png",
                width: screenWidth * 0.4,
                ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Lenovo SmartSprint Quiz offers final-year students from selected colleges a unique opportunity to showcase their knowledge and skills. Over four days, participants will engage with topics related to Lenovo's Solutions and Services Group (SSG) and Digital Workspace Solution (DWS) Delivery business.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Top performers will gain direct entry into the final interview round of Lenovo’s recruitment process for the 2025 Batch campus hiring.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]
        ),
      );
  }
}

class MobileAboutSmartSprint extends StatelessWidget {
  const MobileAboutSmartSprint({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("All You Need to Know About".toUpperCase(),
            textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 30.0),
              child: Image.asset(
                "assets/images/smartsprint-quiz-logo.png",
                width: screenWidth * 0.5,
                ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Lenovo SmartSprint Quiz offers final-year students from selected colleges a unique opportunity to showcase their knowledge and skills. Over four days, participants will engage with topics related to Lenovo's Solutions and Services Group (SSG) and Digital Workspace Solution (DWS) Delivery business.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Top performers will gain direct entry into the final interview round of Lenovo’s recruitment process for the 2025 Batch campus hiring.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ]
        ),
      );
  }
}
