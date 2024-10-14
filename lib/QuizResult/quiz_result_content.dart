import 'package:flutter/material.dart';

class QuizResultContent extends StatelessWidget {
  const QuizResultContent({super.key});

  List<Widget> pageChildren(BuildContext context){
    //double screenWidth = MediaQuery.of(context).size.width;
    return <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/Smartsprint-logo.png")
                ),
              ),

              Text(
                "Completed!",
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20,),

              Text(
                "The leaderboard will be announced tomorrow at 10 AM.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              Text(
                "Join us again for Quiz 2 tomorrow at 7 PM!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
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