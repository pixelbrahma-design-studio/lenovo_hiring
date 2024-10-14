import 'package:flutter/material.dart';

class FooterAbout extends StatelessWidget {
  const FooterAbout({super.key});

  List<Widget> pageChildren(BuildContext context){
    
    return <Widget>[
      
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "© 2024 Lenovo. All rights reserved.",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(27, 9, 20, 1)
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