import 'package:flutter/material.dart';

class Whyparticipate extends StatelessWidget {
  const Whyparticipate({super.key});

   @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth > 992){
          return DesktopWhy();
        } else if (constraints.maxWidth > 425 && constraints.maxWidth < 992) {
          return TabletWhy();
        } else {
          return MobileWhy();
        }
      }
    );
  }
}

class DesktopWhy extends StatelessWidget {
  const DesktopWhy({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return 
      Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
            width: screenWidth * 0.8,
            alignment: Alignment.center,
            height: 500,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
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
                ),
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0.0, -30.0),
                    child: Image.asset("assets/images/gift-box.png",
                    //width: 620,
                    //height: 600,
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

class TabletWhy extends StatelessWidget {
  const TabletWhy({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return 
      Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
            width: screenWidth * 0.8,
            alignment: Alignment.center,
            //height: 500,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
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
                ),
                // Expanded(
                //   child: Transform.translate(
                //     offset: const Offset(0.0, -30.0),
                //     child: Image.asset("assets/images/gift-box.png",
                //     //width: 620,
                //     //height: 600,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      );
    
  }
}

class MobileWhy extends StatelessWidget {
  const MobileWhy({super.key});
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return 
      Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Container(
            width: screenWidth * 0.8,
            alignment: Alignment.center,
            //height: 500,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
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
                ),
                // Expanded(
                //   child: Transform.translate(
                //     offset: const Offset(0.0, -30.0),
                //     child: Image.asset("assets/images/gift-box.png",
                //     //width: 620,
                //     //height: 600,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      );
    
  }
}