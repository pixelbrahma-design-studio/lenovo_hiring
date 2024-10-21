
import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 992) {
          return DesktopRules();
        } else if (constraints.maxWidth > 425 && constraints.maxWidth < 992) {
          return TabletRules();
        } else {
          return MobileRules();
        }
      },
    );
  }
}

class DesktopRules extends StatelessWidget {
  const DesktopRules({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Container(
                width: screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //width: screenWidth * 0.8,
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          //crossAxisSize: CrossAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                //width: (screenWidth  *  0.79) / 2,
                                //width: double.infinity,
                                //alignment: Alignment.center,
                                //height: 310,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                ),
                                
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      //width: (screenWidth * 0.79) / 3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "QUIZ OVERVIEW",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                                      
                                            SizedBox(height: 10),
                                            
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Launch Date: To be announced.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Registration Period Details will be provided soon.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Quiz Duration: 4 days, starting 08th October 2024.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Time: The quiz opens at 7:00 PM daily, with a 30-minute window to complete.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Number of Questions: 10 questions each day.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Daily Leaderboards: The top 50 participants will be highlighted on the website each day.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
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
                            ),
                                  
                            SizedBox(width: 20,),
                                  
                            Expanded(
                              child: Container(
                                //width: (screenWidth  *  0.79) / 2,
                                //alignment: Alignment.center,
                                //height: 310,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                ),
                                
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "ELIGIBILITY",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Open to final-year B.Tech/B.E. students (Batch of 2025) from selected colleges (Tier X, Y, Z).",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "No academic backlogs.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "•",
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    SizedBox(
                                                      width: (screenWidth*0.79) / 3,
                                                      child: Text(
                                                        "Individual participation only—no team entries.",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                
                                              ],
                                            ),
                                            //Container(alignment: const Alignment(30, 50),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              
                    const SizedBox(
                      height: 30.0,
                    ),
              
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                              Text(
                                "Timeline".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),

                              Container(
                                width: screenWidth * 0.8,
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/question.png",
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "01\u02e2\u1d57 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Pre-Placement Talk",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                  
                                      Expanded(
                                        child: Container(
                                          width: 250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/online.png",
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "04\u1d57\u02b0 - 07\u1d57\u02b0 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Registration",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                  
                                      Expanded(
                                        child: Container(
                                          width: 250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/brain.png",
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "08\u1d57\u02b0 - 11\u1d57\u02b0 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Quiz for 4 Days",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                  
                                      Expanded(
                                        child: Container(
                                          width: 250,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/trophy.png",
                                                  //width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "31\u02e2\u1d57 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Winner Announcement",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
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
                        ),
                      ],
                    ),
              
              
                    const SizedBox(
                      height: 40.0,
                    ),
              
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Column(
                            children: [
                              Text(
                                "Quiz Structure".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
                                "Each day covers a different theme:",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                              
                          
                                
                          const SizedBox(
                            height: 20.0,
                          ),
                        
                          Container(
                            width: screenWidth * 0.8,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  Expanded(
                                    child: Container(
                                      //width: 200,
                                      //height: 200,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                        //borderRadius: BorderRadius.circular(171.0)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            
                                            Text(
                                              "Day 1",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 0.4),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                            Text(
                                              "Lenovo Overview",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                
                                              ),
                                            ),
                                          ], 
                                        ),
                                      ),
                                    ),
                                  ),
                              
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                              
                                  Expanded(
                                    child: Container(
                                      //width: 200,
                                      //height: 200,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                        //borderRadius: BorderRadius.circular(171.0)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            
                                            Text(
                                              "Day 2",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 0.4),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                            Text(
                                              "Solutions and Services Group (SSG)",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                
                                              ),
                                            ),
                                          ], 
                                        ),
                                      ),
                                    ),
                                  ),
                              
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                              
                                  Expanded(
                                    child: Container(
                                      //width: 200,
                                      //height: 200,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                        //borderRadius: BorderRadius.circular(171.0)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            
                                            Text(
                                              "Day 3",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 0.4),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                            Text(
                                              "Digital Workplace Solution (DWS) Delivery Business",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                
                                              ),
                                            ),
                                          ], 
                                        ),
                                      ),
                                    ),
                                  ),
                              
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                              
                                  Expanded(
                                    child: Container(
                                      //width: 200,
                                      //height: 200,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                        //borderRadius: BorderRadius.circular(171.0)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            
                                            Text(
                                              "Day 4",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 0.4),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20
                                              ),
                                            ),
                                            Text(
                                              "General Business Knowledge",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                
                                              ),
                                            ),
                                          ], 
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
                    ),

                    SizedBox(height: 40,),
              
                    // Container(
                    //  // width: screenWidth * 0.8,
                    //   child: IntrinsicWidth(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Expanded(
                    //           child: Container(
                    //             //width: screenWidth * 0.5,
                    //             //alignment: Alignment.center,
                               
                    //             decoration: const BoxDecoration(
                    //               color: Color.fromRGBO(255, 255, 255, 0.2),
                    //               borderRadius: BorderRadius.all(Radius.circular(20.0))
                    //             ),
                                
                    //             child: Container(
                    //               child: SizedBox(
                                                  
                    //                 //width: screenWidth * 0.4,
                    //                 child: const Padding(
                    //                   padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                    //                   child: Column(
                    //                     crossAxisAlignment: CrossAxisAlignment.start,
                    //                     children: [
                    //                       Text(
                    //                         "RULES & SCORING",
                    //                         style: TextStyle(
                    //                           fontSize: 18,
                    //                           fontWeight: FontWeight.bold,
                    //                           color: Colors.white,
                    //                         ),
                    //                       ),
                                          
                    //                       SizedBox(height: 10),
                                          
                    //                       Row(
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Text(
                    //                             "1.", 
                    //                             style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           ),
                    //                           SizedBox(width: 10,),
                    //                           Expanded(
                    //                             child: Text(
                    //                               "Submission: All answers must be submitted through the online quiz platform within the allotted time.Participation : Individual Participation only.",
                    //                               style: TextStyle(
                    //                                 color: Colors.white,
                    //                               ),
                    //                             )
                    //                           ),
                    //                         ],
                    //                       ),
                                          
                    //                       SizedBox(height: 10,),
                                          
                    //                       Row(
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Text(
                    //                             "2.", 
                    //                             style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           ),
                    //                           SizedBox(width: 10,),
                    //                           Expanded(child: Text(
                    //                             "Scoring: Points are awarded for correct answers, with increasing weightage each day.",
                    //                             style: TextStyle(
                    //                                 color: Colors.white,
                    //                               ),
                    //                             )
                    //                           ),
                    //                         ],
                    //                       ),
                                          
                    //                       SizedBox(height: 10,),
                                          
                    //                       Row(
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Text(
                    //                             "3.", 
                    //                             style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           ),
                    //                           SizedBox(width: 10,),
                    //                           Expanded(child: Text(
                    //                             "Proctoring: The quiz is proctored. Any use of external resources or assistance will result in disqualification.",
                    //                             style: TextStyle(
                    //                                 color: Colors.white,
                    //                               ),
                    //                             )
                    //                           ),
                    //                         ],
                    //                       ),
                                          
                    //                       SizedBox(height: 10,),
                                          
                    //                       Row(
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Text(
                    //                             "4.", 
                    //                             style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           ),
                    //                           SizedBox(width: 10,),
                    //                           Expanded(child: Text(
                    //                             "Technical Issues: If you face any technical problems, try rejoining the quiz as quickly as possible. Persistent issues should be reported to the support team.",
                    //                             style: TextStyle(
                    //                                 color: Colors.white,
                    //                               ),
                    //                             )
                    //                           ),
                    //                         ],
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                        
                    //         // const SizedBox(
                    //         //   width: 20.0,
                    //         // ),
                        
                    //         Expanded(
                    //           child: Container(
                    //             //width: screenWidth/2,
                    //             alignment: Alignment.center,
                    //             //height: 220,
                    //             child: Column(
                    //               children: [
                    //                 Image.asset(
                    //                   "assets/images/qstn.png",
                                      
                    //                 )
                    //               ],
                    //             )
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    Container(
                      child: IntrinsicWidth(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "RULES & SCORING",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "1.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              "Submission: All answers must be submitted through the online quiz platform within the allotted time.Participation : Individual Participation only.",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 10,),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "2.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(child: Text(
                                            "Scoring: Points are awarded for correct answers, with increasing weightage each day.",
                                            style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 10,),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "3.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(child: Text(
                                            "Proctoring: The quiz is proctored. Any use of external resources or assistance will result in disqualification.",
                                            style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 10,),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "4.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(child: Text(
                                            "Technical Issues: If you face any technical problems, try rejoining the quiz as quickly as possible. Persistent issues should be reported to the support team.",
                                            style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/qstn.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

              
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
              
                    //       Container(
                    //         width: screenWidth * 0.3,
                    //         alignment: Alignment.center,
                    //         //height: 220,
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               "assets/images/gift-box-2.png",
                                  
                    //             )
                    //           ],
                    //         )
                    //       ),
              
                    //       const SizedBox(
                    //         width: 20.0,
                    //       ),
              
                    //       Container(
                    //         //width: screenWidth * 0.5,
                    //         //alignment: Alignment.center,
                           
                    //         decoration: const BoxDecoration(
                    //           color: Color.fromRGBO(255, 255, 255, 0.2),
                    //           borderRadius: BorderRadius.all(Radius.circular(20.0))
                    //         ),
                            
                    //         child: Row(
                    //           children: [
                    //             SizedBox(
                    //               width: screenWidth * 0.4,
                    //               child: const Padding(
                    //                 padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                    //                 child: Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   children: [
                    //                     Text(
                    //                       "PRIZES",
                    //                       style: TextStyle(
                    //                         fontSize: 18,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.white,
                    //                       ),
                    //                     ),
                                        
                    //                     SizedBox(height: 10),
                                        
                    //                     Row(
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           "1.", 
                    //                           style: TextStyle(
                    //                             color: Colors.white,
                    //                           ),
                    //                         ),
                    //                         SizedBox(width: 10,),
                    //                         Expanded(
                    //                           child: Text(
                    //                             "Grand Prize: The top 15 students will receive a Pre-Placement Interview (PPI) opportunity with Lenovo.",
                    //                             style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           )
                    //                         ),
                    //                       ],
                    //                     ),
                                        
                    //                     SizedBox(height: 10,),
                                        
                    //                     Row(
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           "2.", 
                    //                           style: TextStyle(
                    //                             color: Colors.white,
                    //                           ),
                    //                         ),
                    //                         SizedBox(width: 10,),
                    //                         Expanded(child: Text(
                    //                           "Daily Winners: The highest scorer each day will receive Lenovo merchandise.",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           )
                    //                         ),
                    //                       ],
                    //                     ),
                                        
                    //                     SizedBox(height: 10,),
                                        
                    //                     Row(
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           "3.", 
                    //                           style: TextStyle(
                    //                             color: Colors.white,
                    //                           ),
                    //                         ),
                    //                         SizedBox(width: 10,),
                    //                         Expanded(child: Text(
                    //                           "Participation Certificates: All participants who complete the quiz on all 4 days will receive a digital certificate.",
                    //                           style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           )
                    //                         ),
                    //                       ],
                    //                     )
                                        
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                          
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenWidth * 0.3,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/gift-box-2.png",
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded( // Add Expanded here to allow dynamic sizing
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "PRIZES",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Grand Prize: The top 15 students will receive a Pre-Placement Interview (PPI) opportunity with Lenovo.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "2.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Daily Winners: The highest scorer each day will receive Lenovo merchandise.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "3.",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Participation Certificates: All participants who complete the quiz on all 4 days will receive a digital certificate.",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

              
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              children: [
                                Expanded(
                                  //width: screenWidth * 0.5,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "FAQs",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Who can participate?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Final-year B.Tech/B.E. students from selected colleges are eligible to participate.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "2.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Can I participate as part of a team?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "No, the quiz is strictly for individual participants.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "3.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "How do I access the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "You can access the quiz online. Log in at the scheduled time each day to participate.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What should I do if I face technical difficulties during the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Try to rejoin the quiz immediately. If the problem persists, contact our support team.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "5.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "How are winners determined?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Winners are selected based on the number of correct answers and the time taken to complete the quiz. The overall winner will be chosen based on cumulative performance across all four days.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "6.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What happens if I don’t finish the quiz on time?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "The quiz will automatically submit when the time expires.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "7.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What if I engage in misconduct during the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Any cheating or academic dishonesty will lead to immediate disqualification.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
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
                      ),
                    ),

                    

              
                    
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Container(
                    //         width: screenWidth * 0.8,
                    //         //alignment: Alignment.center,
                           
                    //         decoration: const BoxDecoration(
                    //           color: Color.fromRGBO(17, 24, 79, 0.65),
                    //           borderRadius: BorderRadius.all(Radius.circular(20.0))
                    //         ),
                            
                    //         child: Row(
                    //           children: [
                    //             Expanded(
                    //               //width: screenWidth * 0.8,
                    //               child: const Padding(
                    //                 padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                    //                 child: Column(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     Text(
                    //                       "CONTACT SUPPORT",
                    //                       style: TextStyle(
                    //                         fontSize: 18,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.white,
                    //                       ),
                    //                     ),
                                        
                    //                     SizedBox(height: 10),
                                        
                    //                     Row(
                    //                       crossAxisAlignment: CrossAxisAlignment.start,
                    //                       children: [
                    //                         Text(
                    //                           "For any questions or technical issues, please reach out to us at…", 
                    //                           style: TextStyle(
                    //                             color: Colors.white,
                    //                           ),
                    //                         ),
                                            
                    //                       ],
                    //                     )
                                        
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                          
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(17, 24, 79, 0.65), // Dark blue with opacity
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "CONTACT SUPPORT",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "For any questions or technical issues, please reach out to us at…", 
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

              
                  ],
                  
                ),
              ),
            ),
          ],
        ),
      );
  
  }

}

class TabletRules extends StatelessWidget {
  const TabletRules({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Container(
                width: screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //width: screenWidth * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        //crossAxisSize: CrossAxisSize.max,
                        children: [
                          Container(
                            //width: (screenWidth  *  0.79) / 2,
                            //width: double.infinity,
                            //alignment: Alignment.center,
                            //height: 310,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  //width: (screenWidth * 0.79) / 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "QUIZ OVERVIEW",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                                  
                                        SizedBox(height: 10),
                                        
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Launch Date: To be announced.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Registration Period Details will be provided soon.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Quiz Duration: 4 days, starting 08th October 2024.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Time: The quiz opens at 7:00 PM daily, with a 30-minute window to complete.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Number of Questions: 10 questions each day.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Daily Leaderboards: The top 50 participants will be highlighted on the website each day.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
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
                                
                          SizedBox(height: 20,),
                                
                          Container(
                            //width: (screenWidth  *  0.79) / 2,
                            //alignment: Alignment.center,
                            //height: 310,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "ELIGIBILITY",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Open to final-year B.Tech/B.E. students (Batch of 2025) from selected colleges (Tier X, Y, Z).",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "No academic backlogs.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.6),
                                                  child: Text(
                                                    "Individual participation only—no team entries.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                        //Container(alignment: const Alignment(30, 50),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              
                    const SizedBox(
                      height: 30.0,
                    ),
              
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                              Text(
                                "Timeline".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),

                              Container(
                                width: screenWidth * 0.8,
                                child: IntrinsicHeight(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              //width: 200,
                                              height: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "assets/images/question.png",
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                    const Text(
                                                      "01\u02e2\u1d57 October 2024",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(122, 18, 101, 1.0)
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Pre-Placement Talk",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        
                                                      ),
                                                    ),
                                                  ], 
                                                ),
                                              ),
                                            ),
                                          ),
                                      
                                          const SizedBox(
                                            width: 20.0,
                                          ),
                                      
                                          Expanded(
                                            child: Container(
                                              //width: 200,
                                              height: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "assets/images/online.png",
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                    const Text(
                                                      "04\u1d57\u02b0 - 07\u1d57\u02b0 October 2024",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(122, 18, 101, 1.0)
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Registration",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        
                                                      ),
                                                    ),
                                                  ], 
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                            height: 20.0,
                                          ),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              //width: (screenWidth*0.8) / 2,
                                              height: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "assets/images/brain.png",
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                    const Text(
                                                      "08\u1d57\u02b0 - 11\u1d57\u02b0 October 2024",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(122, 18, 101, 1.0)
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Quiz for 4 Days",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        
                                                      ),
                                                    ),
                                                  ], 
                                                ),
                                              ),
                                            ),
                                          ),
                                        
                                          const SizedBox(
                                            width: 20.0,
                                          ),
                                      
                                          Expanded(
                                            child: Container(
                                              height: 250,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "assets/images/trophy.png",
                                                      //width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                    const Text(
                                                      "31\u02e2\u1d57 October 2024",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(122, 18, 101, 1.0)
                                                      ),
                                                    ),
                                                    const Text(
                                                      "Winner Announcement",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(17, 24, 79, 1.0),
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.bold,
                                                        
                                                      ),
                                                    ),
                                                  ], 
                                                ),
                                              ),
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
                    ),
              
              
                    const SizedBox(
                      height: 40.0,
                    ),
              
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Column(
                            children: [
                              Text(
                                "Quiz Structure".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
                                "Each day covers a different theme:",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                              
                          
                                
                          const SizedBox(
                            height: 20.0,
                          ),
                        
                          Container(
                            width: screenWidth * 0.8,
                            child: Column(
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Expanded(
                                        child: Container(
                                          //width: 200,
                                          //height: 200,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(17, 24, 79, 1.0),
                                            //borderRadius: BorderRadius.circular(171.0)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                Text(
                                                  "Day 1",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  "Lenovo Overview",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                  
                                      Expanded(
                                        child: Container(
                                          //width: 200,
                                          //height: 200,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(17, 24, 79, 1.0),
                                            //borderRadius: BorderRadius.circular(171.0)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                Text(
                                                  "Day 2",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  "Solutions and Services Group (SSG)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                                
                                const SizedBox(
                                  height: 20.0,
                                ),
                                
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          //width: 200,
                                          //height: 200,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(17, 24, 79, 1.0),
                                            //borderRadius: BorderRadius.circular(171.0)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                Text(
                                                  "Day 3",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  "Digital Workplace Solution (DWS) Delivery Business",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                      const SizedBox(
                                        width: 20.0,
                                      ),
                                  
                                      Expanded(
                                        child: Container(
                                          //width: 200,
                                          //height: 200,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(17, 24, 79, 1.0),
                                            //borderRadius: BorderRadius.circular(171.0)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                Text(
                                                  "Day 4",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  "General Business Knowledge",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40,),
              
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "RULES & SCORING",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "1.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Submission: All answers must be submitted through the online quiz platform within the allotted time. Participation: Individual Participation only.",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "2.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Scoring: Points are awarded for correct answers, with increasing weightage each day.",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "3.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Proctoring: The quiz is proctored. Any use of external resources or assistance will result in disqualification.",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "4.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            "Technical Issues: If you face any technical problems, try rejoining the quiz as quickly as possible. Persistent issues should be reported to the support team.",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Image.asset("assets/images/qstn.png"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

              
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image Container
                          Container(
                            width: screenWidth * 0.3,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/gift-box-2.png",
                                  fit: BoxFit.contain, // To make sure the image fits properly.
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 20.0),

                          // Prizes Container
                          Container(
                            width: screenWidth * 0.4, // Adjusted for better responsive design.
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "PRIZES",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // Grand Prize
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "1.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "Grand Prize: The top 15 students will receive a Pre-Placement Interview (PPI) opportunity with Lenovo.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),

                                  // Daily Winners
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "2.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "Daily Winners: The highest scorer each day will receive Lenovo merchandise.",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),

                                  // Participation Certificates
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "3.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          "Participation Certificates: All participants who complete the quiz on all 4 days will receive a digital certificate.",
                                          style: TextStyle(color: Colors.white),
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

              
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              children: [
                                Expanded(
                                  //width: screenWidth * 0.5,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "FAQs",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Who can participate?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Final-year B.Tech/B.E. students from selected colleges are eligible to participate.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "2.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Can I participate as part of a team?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "No, the quiz is strictly for individual participants.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "3.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "How do I access the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "You can access the quiz online. Log in at the scheduled time each day to participate.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What should I do if I face technical difficulties during the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Try to rejoin the quiz immediately. If the problem persists, contact our support team.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "5.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "How are winners determined?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Winners are selected based on the number of correct answers and the time taken to complete the quiz. The overall winner will be chosen based on cumulative performance across all four days.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "6.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What happens if I don’t finish the quiz on time?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "The quiz will automatically submit when the time expires.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "7.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What if I engage in misconduct during the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Any cheating or academic dishonesty will lead to immediate disqualification.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
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
                      ),
                    ),
              
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(17, 24, 79, 0.65),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              children: [
                                Expanded(
                                  //width: screenWidth * 0.8,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "CONTACT SUPPORT",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "For any questions or technical issues, please reach out to us at…", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            
                                          ],
                                        )
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
              
                  ],
                  
                ),
              ),
            ),
          ],
        ),
      );
  }

}

class MobileRules extends StatelessWidget {
  const MobileRules({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Container(
                width: screenWidth * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      //width: screenWidth * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                        //crossAxisSize: CrossAxisSize.max,
                        children: [
                          Container(
                            //width: (screenWidth  *  0.79) / 2,
                            //width: double.infinity,
                            //alignment: Alignment.center,
                            //height: 310,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  //width: (screenWidth * 0.79) / 3,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "QUIZ OVERVIEW",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                                  
                                        SizedBox(height: 10),
                                        
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Launch Date: To be announced.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Registration Period Details will be provided soon.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Quiz Duration: 4 days, starting 08th October 2024.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Time: The quiz opens at 7:00 PM daily, with a 30-minute window to complete.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Number of Questions: 10 questions each day.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Daily Leaderboards: The top 50 participants will be highlighted on the website each day.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
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
                                
                          SizedBox(height: 20,),
                                
                          Container(
                            //width: (screenWidth  *  0.79) / 2,
                            //alignment: Alignment.center,
                            //height: 310,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "ELIGIBILITY",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Open to final-year B.Tech/B.E. students (Batch of 2025) from selected colleges (Tier X, Y, Z).",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "No academic backlogs.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(
                                                  "•",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                                SizedBox(width: 10,),
                                                SizedBox(
                                                  width: (screenWidth*0.5),
                                                  child: Text(
                                                    "Individual participation only—no team entries.",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                        //Container(alignment: const Alignment(30, 50),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              
                    const SizedBox(
                      height: 30.0,
                    ),
              
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            
                            children: [
                              Text(
                                "Timeline".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),

                              Container(
                                width: screenWidth * 0.8,
                                child: IntrinsicHeight(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/question.png",
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "01\u02e2\u1d57 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Pre-Placement Talk",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                                                            
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                                                            
                                      Expanded(
                                        child: Container(
                                          height: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/online.png",
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "04\u1d57\u02b0 - 07\u1d57\u02b0 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Registration",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 20.0,
                                      ),

                                      Expanded(
                                        child: Container(
                                          height: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/brain.png",
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "08\u1d57\u02b0 - 11\u1d57\u02b0 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Quiz for 4 Days",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                                                              
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                                                            
                                      Expanded(
                                        child: Container(
                                          height: 250,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Image.asset(
                                                  "assets/images/trophy.png",
                                                  //width: 50.0,
                                                  height: 50.0,
                                                ),
                                                const Text(
                                                  "31\u02e2\u1d57 October 2024",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(122, 18, 101, 1.0)
                                                  ),
                                                ),
                                                const Text(
                                                  "Winner Announcement",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(17, 24, 79, 1.0),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
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
                        ),
                      ],
                    ),
              
              
                    const SizedBox(
                      height: 40.0,
                    ),
              
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Column(
                            children: [
                              Text(
                                "Quiz Structure".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                              const Text(
                                "Each day covers a different theme:",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),
                        
                          Container(
                            width: screenWidth * 0.8,
                            child: Column(
                              children: [
                                IntrinsicHeight(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Expanded(
                                        child: Container(
                                          //width: 200,
                                          //height: 200,
                                          width: screenWidth * 0.8,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(17, 24, 79, 1.0),
                                            //borderRadius: BorderRadius.circular(171.0)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                Text(
                                                  "Day 1",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  "Lenovo Overview",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                  
                                      Expanded(
                                        child: Container(
                                          //width: 200,
                                          //height: 200,
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(17, 24, 79, 1.0),
                                            //borderRadius: BorderRadius.circular(171.0)
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                
                                                Text(
                                                  "Day 2",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                  ),
                                                ),
                                                Text(
                                                  "Solutions and Services Group (SSG)",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    
                                                  ),
                                                ),
                                              ], 
                                            ),
                                          ),
                                        ),
                                      ),
                                
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                
                                    Expanded(
                                      child: Container(
                                        width: screenWidth * 0.8,
                                        //width: 200,
                                        //height: 200,
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(17, 24, 79, 1.0),
                                          //borderRadius: BorderRadius.circular(171.0)
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              
                                              Text(
                                                "Day 3",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(255, 255, 255, 0.4),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                                ),
                                              ),
                                              Text(
                                                "Digital Workplace Solution (DWS) Delivery Business",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  
                                                ),
                                              ),
                                            ], 
                                          ),
                                        ),
                                      ),
                                    ),
                                                                
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                                                
                                    Expanded(
                                      child: Container(
                                        //width: 200,
                                        //height: 200,
                                        width: screenWidth * 0.8,
                                        decoration: const BoxDecoration(
                                          color: Color.fromRGBO(17, 24, 79, 1.0),
                                          //borderRadius: BorderRadius.circular(171.0)
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              
                                              Text(
                                                "Day 4",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(255, 255, 255, 0.4),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                                ),
                                              ),
                                              Text(
                                                "General Business Knowledge",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  
                                                ),
                                              ),
                                            ], 
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40,),
              
                    Container(
                      width: screenWidth * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //width: screenWidth/2,
                            alignment: Alignment.center,
                            //height: 220,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/qstn.png",
                                  
                                )
                              ],
                            )
                          ),
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Container(
                              child: SizedBox(
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "RULES & SCORING",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      
                                      SizedBox(height: 10),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "1.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              "Submission: All answers must be submitted through the online quiz platform within the allotted time.Participation : Individual Participation only.",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 10,),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "2.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              "Scoring: Points are awarded for correct answers, with increasing weightage each day.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 10,),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "3.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              "Proctoring: The quiz is proctored. Any use of external resources or assistance will result in disqualification.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                          ),
                                        ],
                                      ),
                                      
                                      SizedBox(height: 10,),
                                      
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "4.", 
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Text(
                                              "Technical Issues: If you face any technical problems, try rejoining the quiz as quickly as possible. Persistent issues should be reported to the support team.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      
                          // const SizedBox(
                          //   width: 20.0,
                          // ),
                      
                          
                        ],
                      ),
                    ),
              
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
              
                          Container(
                            width: screenWidth * 0.8,
                            alignment: Alignment.center,
                            //height: 220,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/gift-box-2.png",
                                  
                                )
                              ],
                            )
                          ),
              
                          const SizedBox(
                            height: 20.0,
                          ),
              
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.6,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "PRIZES",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Text(
                                                "Grand Prize: The top 15 students will receive a Pre-Placement Interview (PPI) opportunity with Lenovo.",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10,),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "2.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(child: Text(
                                              "Daily Winners: The highest scorer each day will receive Lenovo merchandise.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10,),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "3.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(child: Text(
                                              "Participation Certificates: All participants who complete the quiz on all 4 days will receive a digital certificate.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ),
                                          ],
                                        )
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
              
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              children: [
                                Expanded(
                                  //width: screenWidth * 0.5,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "FAQs",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "1.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Who can participate?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Final-year B.Tech/B.E. students from selected colleges are eligible to participate.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "2.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Can I participate as part of a team?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "No, the quiz is strictly for individual participants.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "3.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "How do I access the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "You can access the quiz online. Log in at the scheduled time each day to participate.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "4.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What should I do if I face technical difficulties during the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Try to rejoin the quiz immediately. If the problem persists, contact our support team.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "5.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "How are winners determined?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Winners are selected based on the number of correct answers and the time taken to complete the quiz. The overall winner will be chosen based on cumulative performance across all four days.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "6.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What happens if I don’t finish the quiz on time?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "The quiz will automatically submit when the time expires.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "7.", 
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "What if I engage in misconduct during the quiz?",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Any cheating or academic dishonesty will lead to immediate disqualification.",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
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
                      ),
                    ),
              
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: screenWidth * 0.8,
                            //alignment: Alignment.center,
                           
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(17, 24, 79, 0.65),
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            
                            child: Row(
                              children: [
                                Expanded(
                                  //width: screenWidth * 0.8,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "CONTACT SUPPORT",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        
                                        SizedBox(height: 10),
                                        
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "For any questions or technical issues, please reach out to us at…", 
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            
                                          ],
                                        )
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
              
                  ],
                  
                ),
              ),
            ),
          ],
        ),
      );
  }

}