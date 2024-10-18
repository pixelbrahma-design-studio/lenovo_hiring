import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SmartsprintTop extends StatelessWidget {
  const SmartsprintTop({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1025) {
          return DesktopSmartSprintTop();
        } else if (constraints.maxWidth > 425 && constraints.maxWidth < 1025) {
          return TabletSmartSprintTop();
        } else {
          return MobileSmartSprintTop();
        }
      },
    );
  }
}

class DesktopSmartSprintTop extends StatelessWidget {
  const DesktopSmartSprintTop({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Column(
        children: [
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset(
                    "assets/images/smartsprint-quiz-logo.png",
                    width: screenWidth * 0.3,
                    alignment: Alignment.centerLeft,
                    ),
                ),
                SizedBox(height: 20,),
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
          ),

          SizedBox(height: 40,),
          
          Stack(
            children: [
              Container(
                width: screenWidth * 0.8,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Grand Prize",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Image.asset("assets/images/trophy-smrtpnt.png"),
                            SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Top 15 Students",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Get a Preplacement Interview",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Image.asset("assets/images/certfcte-smrtsprnt.png"),
                            SizedBox(width: 30),
                            Text(
                              "Digital Participation Certificates for all who attend the quiz on all 4 days",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                          child: MaterialButton(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            ),
                            onPressed: (){
                              context.go('/register');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              child: const Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Color.fromRGBO(28, 10, 103, 1.0),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/gift-box.png",
                      //width: 100, // Specify width/height to maintain proportions
                    ),
                  ],
                ),
              ),
            ],
          ),


          

          Container(
            width: screenWidth * 0.8,
            alignment: Alignment.center,
            //height: 330,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.7,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Why Participate?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Accelerate Your Career Path:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                              ),
                            ),
                            Text(
                              "Top performers will secure direct entry to Lenovo’s Final Interview Round.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Gain Industry Insights:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Explore Lenovo’s core business areas and deepen your understanding of the industry.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Put Your Skills to the Test:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Challenge yourself with questions that assess your knowledge of Lenovo, along with your logical reasoning and quantitative aptitude.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      );
    
  }

}

class TabletSmartSprintTop extends StatelessWidget {
  const TabletSmartSprintTop({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Column(
        children: [
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset(
                    "assets/images/smartsprint-quiz-logo.png",
                    width: screenWidth * 0.3,
                    alignment: Alignment.centerLeft,
                    ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: screenWidth * 0.8,
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
                  width: screenWidth * 0.8,
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
          ),

          SizedBox(height: 40,),
          
          Stack(
            children: [
              Container(
                width: screenWidth * 0.8,
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Grand Prize",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset("assets/images/trophy-smrtpnt.png",
                                width: 50,
                                ),
                                SizedBox(width: 20),
                                Container(
                                  //width: screenWidth * 0.3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Top 15 Students",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Container(
                                        width: screenWidth * 0.2,
                                        child: Text(
                                          "Get a Preplacement Interview",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Image.asset("assets/images/certfcte-smrtsprnt.png",
                                width: 50,
                                ),
                                SizedBox(width: 30),
                                Container(
                                  width: screenWidth * 0.2,
                                  child: Text(
                                    "Digital Participation Certificates for all who attend the quiz on all 4 days",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                              child: MaterialButton(
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                                ),
                                onPressed: (){
                                  context.go('/register');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  child: const Text(
                                    "Register Now",
                                    style: TextStyle(
                                      color: Color.fromRGBO(28, 10, 103, 1.0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/images/gift-box.png",
                          //width: 100, // Specify width/height to maintain proportions
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 40,),
          

          Container(
            width: screenWidth * 0.8,
            alignment: Alignment.center,
            //height: 330,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.7,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Why Participate?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Accelerate Your Career Path:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                              ),
                            ),
                            Text(
                              "Top performers will secure direct entry to Lenovo’s Final Interview Round.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Gain Industry Insights:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Explore Lenovo’s core business areas and deepen your understanding of the industry.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Put Your Skills to the Test:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Challenge yourself with questions that assess your knowledge of Lenovo, along with your logical reasoning and quantitative aptitude.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      );
    
  }

}


class MobileSmartSprintTop extends StatelessWidget {
  const MobileSmartSprintTop({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Column(
        children: [
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
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset(
                    "assets/images/smartsprint-quiz-logo.png",
                    width: screenWidth * 0.7,
                    alignment: Alignment.centerLeft,
                    ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: screenWidth * 0.8,
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
                  width: screenWidth * 0.8,
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
          ),

          SizedBox(height: 40,),
          
          Stack(
            children: [
              Container(
                width: screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/gift-box.png",
                      //width: 100, // Specify width/height to maintain proportions
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Grand Prize",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/trophy-smrtpnt.png",
                              width: 50,
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Top 15 Students",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Get a Preplacement Interview",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/certfcte-smrtsprnt.png",
                            width: 50,),
                            SizedBox(height: 20),
                            Text(
                              "Digital Participation Certificates for all who attend the quiz on all 4 days",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                          child: MaterialButton(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))
                            ),
                            onPressed: (){
                              context.go('/register');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                              child: const Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Color.fromRGBO(28, 10, 103, 1.0),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ],
          ),


          

          Container(
            width: screenWidth * 0.8,
            alignment: Alignment.center,
            //height: 330,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.7,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Why Participate?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Accelerate Your Career Path:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                              ),
                            ),
                            Text(
                              "Top performers will secure direct entry to Lenovo’s Final Interview Round.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Gain Industry Insights:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Explore Lenovo’s core business areas and deepen your understanding of the industry.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Put Your Skills to the Test:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Challenge yourself with questions that assess your knowledge of Lenovo, along with your logical reasoning and quantitative aptitude.",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      );
    
  }

}