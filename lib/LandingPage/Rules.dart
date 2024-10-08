
import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  List<Widget> pageChildren(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    return <Widget>[
      
      Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
         // width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              FractionallySizedBox(
                child: Container(
                  width: screenWidth * 0.8,
                  alignment: Alignment.center,
                  height: 330,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      Transform.translate(
                        offset: const Offset(0.0, -30.0),
                        child: Image.asset("assets/images/gift-box.png",
                        //width: 620,
                        //height: 600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        
              const SizedBox(
                height: 20.0,
              ),
        
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    child: Container(
                      //width: screenWidth/2,
                      //alignment: Alignment.center,
                      height: 220,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "QUIZ OVERVIEW",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "• Launch Date: To be announced.\n"
                                    "• Registration Period Details will be provided soon.\n"
                                    "• Quiz Duration: 4 days, starting 08th October 2024.\n"
                                    "• Time: The quiz opens at 7:00 PM daily, with a 30-minute window to complete.\n"
                                    "• Number of Questions: 10 questions each day.\n"
                                    "• Daily Leaderboards: The top 50 participants will be highlighted on the website each day.",
                                    style: TextStyle(color: Colors.white),
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
                    width: 20.0,
                  ),
        
                  FractionallySizedBox(
                    child: Container(
                      //width: screenWidth/2,
                      alignment: Alignment.center,
                      height: 220,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  const Text(
                                    "• Open to final-year B.Tech/B.E. students (Batch of 2025) from selected colleges (Tier X, Y, Z).\n"
                                    "• No academic backlogs.\n"
                                    "• Individual participation only—no team entries.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(alignment: const Alignment(30, 50),)
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
        
              const SizedBox(
                height: 30.0,
              ),
        
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth * 0.9,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                            FractionallySizedBox(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(171.0)
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
                                        "Pre-Placement \n Talk",
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
                              )
                            ),
                        
                            const SizedBox(
                              width: 40.0,
                            ),
                        
                            FractionallySizedBox(
                              child: Container(
                                width: 200,
                                height: 200,
                                
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(171.0)
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
                              )
                            ),
                        
                            const SizedBox(
                              width: 40.0,
                            ),
                        
                            FractionallySizedBox(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(171.0)
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
                              )
                            ),
                        
                            const SizedBox(
                              width: 40.0,
                            ),
                        
                            FractionallySizedBox(
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(171.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/trophy.png",
                                        width: 50.0,
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
                                        "Winner \n Announcement",
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
                              )
                            ),
                          ],
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
                  
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                        FractionallySizedBox(
                          child: Container(
                            width: 200,
                            height: 200,
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
                          )
                        ),
                    
                        const SizedBox(
                          width: 40.0,
                        ),
                    
                        FractionallySizedBox(
                          child: Container(
                            width: 200,
                            height: 200,
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
                          )
                        ),
                    
                        const SizedBox(
                          width: 40.0,
                        ),
                    
                        FractionallySizedBox(
                          child: Container(
                            width: 200,
                            height: 200,
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
                          )
                        ),
                    
                        const SizedBox(
                          width: 40.0,
                        ),
                    
                        FractionallySizedBox(
                          child: Container(
                            width: 200,
                            height: 200,
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
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FractionallySizedBox(
                      child: Container(
                        width: screenWidth * 0.5,
                        //alignment: Alignment.center,
                       
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        
                        child: Row(
                          children: [
                            SizedBox(
                
                              width: screenWidth * 0.5,
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
                          ],
                        ),
                      ),
                    ),
                
                    const SizedBox(
                      width: 20.0,
                    ),
                
                    FractionallySizedBox(
                      child: Container(
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
                    ),
                  ],
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
        
                    FractionallySizedBox(
                      child: Container(
                        width: screenWidth * 0.3,
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
                    ),
        
                    const SizedBox(
                      width: 20.0,
                    ),
        
                    FractionallySizedBox(
                      child: Container(
                        width: screenWidth * 0.5,
                        //alignment: Alignment.center,
                       
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.4,
                              child: const Padding(
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
                    ),
                    
                  ],
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FractionallySizedBox(
                      child: Container(
                        width: screenWidth * 0.8,
                        //alignment: Alignment.center,
                       
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.8,
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
                    ),
                    
                  ],
                ),
              ),
        
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FractionallySizedBox(
                      child: Container(
                        width: screenWidth * 0.8,
                        //alignment: Alignment.center,
                       
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(17, 24, 79, 0.65),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.8,
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
                    ),
                    
                  ],
                ),
              ),
        
            ],
            
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(context),
          );
        } else {
          return Column(
            children: pageChildren(context),
          );
        }
      },
    );
  }
}