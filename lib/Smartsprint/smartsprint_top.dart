import 'package:flutter/material.dart';

class SmartsprintTop extends StatelessWidget {
  const SmartsprintTop({super.key});

  List<Widget> pageChildren(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return <Widget>[
      Container(
        width: screenWidth * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("All You Need to Know About".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image.asset(
                "assets/images/smartsprint-quiz-logo.png",
                width: screenWidth * 0.3,
                alignment: Alignment.centerLeft,
                ),
            ),
            SizedBox(
              width: screenWidth * 0.5,
              child: RichText(
                textAlign: TextAlign.left,
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
                textAlign: TextAlign.left,
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
      )
    ];
    
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>800){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(context),
          );
        } else {
          return Column(
            children: pageChildren(context),
          );
        }
      }
    );
  }
}