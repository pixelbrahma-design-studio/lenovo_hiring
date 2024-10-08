import 'package:flutter/material.dart';

class CampusHiring extends StatelessWidget {
  const CampusHiring({super.key});

  List<Widget> pageChildren(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return <Widget>[
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:30.0, horizontal: 0.0),
            child: SizedBox(
              width: screenWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "ABOUT BUSINESS",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet egestas turpis, quis gravida arcu. Nam mollis urna vestibulum faucibus sollicitudin. Aenean quis pellentesque nisi. Nulla dictum, eros ut convallis vehicula, ante lorem varius purus, quis mattis nisl orci sed eros.",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 38, 27, 1.0),
                    ), 
                    child: const Text(
                      "Know More",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
            child: SizedBox(
              width: screenWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "ABOUT THE ROLE",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (screenWidth * 0.8)/2.2,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/id-card.png"
                              ),
                               SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Title:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),
                                  ),
                                  Text(
                                    "Graduate Engineer Trainee",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),

                      Container(
                        width: (screenWidth * 0.8)/2.2,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/location.png"
                              ),
                              SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),
                                  ),
                                  Text(
                                    "Bangalore",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (screenWidth * 0.8)/2.2,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/work-schedule.png"
                              ),
                               SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Work Schedule:",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),
                                  ),
                                  Text(
                                    "Rotational shifts, 5 days working\n"
                                    "from our vibrant office.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),

                      Container(
                        width: (screenWidth * 0.8)/2.2,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/search.png"
                              ),
                              SizedBox(width: 20),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Eligibility Criteria:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    ),
                                  ),
                                  Text(
                                    "2024 Full-time BE/BTech/BCA with\n"
                                    "70% in 10th, 12th & graduation",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
            child: Container(
              width: screenWidth*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (screenWidth * 0.8)/2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ROLE REQUIREMENTS",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          )
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Basic knowledge of network, compute, and cloud.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Familiarity with basic administration tasks.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Strong communication skills (both verbal and written).",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Good analytical and problem-solving abilities.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Collaborative team player with an eagerness to learn.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Attention to detail and accuracy.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),
                  
                        SizedBox(height: 10),
                          
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\u2022", 
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Ability to work across geographics and in multicultural environments.",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bonus: Knowledge of ITIL principles; industry certificates are advantageous.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              
                  SizedBox(
                    width: (screenWidth * 0.8)/2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/search-ai.png",
                          width: (screenWidth * 0.8)/5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
            child: Container(
              width: screenWidth*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (screenWidth * 0.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "HIRING PROCESS",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          )
                        ),
                  
                        SizedBox(height: 10),

                        Text(
                          "Two ways to get hired in Lenovo",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1.", 
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "General Process:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
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
              
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
            child: Container(
              width: screenWidth*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/preplacement-talk.png",
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/6,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "01\u02e2\u1d57 October 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Pre-Placement Talk",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                   children: [
                    Image.asset(
                      "assets/images/process-line.png",
                      width: 100,
                    )
                    ]
                  ),

                  Column(
                    children: [
                      Image.asset(
                        "assets/images/aptitude.png",
                      
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/6,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "11\u02e2\u1d57 October 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Aptitude Assessment",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                   children: [
                    Image.asset(
                      "assets/images/process-line.png",
                      width: 100,
                    )
                    ]
                  ),

                  Column(
                    children: [
                      Image.asset(
                        "assets/images/group.png",
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/6,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "31\u02e2\u1d57 October 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Group Discussion",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                   children: [
                    Image.asset(
                      "assets/images/process-line.png",
                      width: 100,
                    )
                    ]
                  ),

                  Column(
                    children: [
                      Image.asset(
                        "assets/images/final-interview.png",
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/6,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "01\u02e2\u1d57 November 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Final Interview",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
            child: Container(
              width: screenWidth*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: (screenWidth * 0.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2.", 
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Text(
                                "Lenovo Smartsprint way:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
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
              
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
            child: Container(
              width: screenWidth*0.8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/preplacement-2.png",
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/5,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(17, 24, 79, 1),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "01\u02e2\u1d57 October 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Pre-Placement Talk",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                   children: [
                    Image.asset(
                      "assets/images/process-line.png",
                      width: 100,
                    )
                    ]
                  ),

                  Column(
                    children: [
                      Image.asset(
                        "assets/images/smartsprint-winner.png",
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/5,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(184, 37, 46, 1),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "31\u02e2\u1d57 October 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Smartsprint Winner",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),

                  Column(
                   children: [
                    Image.asset(
                      "assets/images/process-line.png",
                      width: 100,
                    )
                    ]
                  ),

                  Column(
                    children: [
                      Image.asset(
                        "assets/images/final-interview-2.png",
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: (screenWidth * 0.8)/5,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(17, 24, 79, 1),
                          borderRadius: BorderRadius.all(Radius.circular(100.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "01\u02e2\u1d57 November 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Final Interview",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
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