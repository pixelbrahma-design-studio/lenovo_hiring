import 'package:flutter/material.dart';

class SmartsprintTop extends StatelessWidget {
  const SmartsprintTop({super.key});

  List<Widget> pageChildren(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return <Widget>[
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
            height: 330,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
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