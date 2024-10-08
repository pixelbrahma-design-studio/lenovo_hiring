import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  List<Widget> pageChildren(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return <Widget>[
      Transform.translate(
        offset: const Offset(0.0, -90.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/grid.png"),
              fit: BoxFit.cover,
            )
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height, // Full-screen height (100vh)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                child: Image.asset(
                  "assets/images/SmartSprint-logo.png",
                  width: screenWidth * 0.4,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF)),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0))
                  ),
                  child: const Text("08\u1d57\u02b0 October 2024  -  11\u1d57\u02b0 October 2024",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text("Top 15 Winners Get a",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Pre-Placement Interview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                  ),
                ),
              ),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                child: MaterialButton(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                  onPressed: (){},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
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
        
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Registered? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: "Login Here.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
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