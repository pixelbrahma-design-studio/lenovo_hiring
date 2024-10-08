import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  List<Widget> pageChildren(BuildContext context){

    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Container(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "© 2024 Lenovo. All rights reserved.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white
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