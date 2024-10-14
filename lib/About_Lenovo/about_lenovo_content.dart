import 'package:flutter/material.dart';

class AboutLenovoContent extends StatelessWidget {
  const AboutLenovoContent({super.key});

  List<Widget> pageChildren(BuildContext context){
    
    double screenWidth = MediaQuery.of(context).size.width;
    return <Widget>[
      Container(
       width: MediaQuery.of(context).size.width,
       child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/abt-lnv-grid-bg.png"),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "About Lenovo".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        "When you work at Lenovo, you make powerful things happen - for you, for Lenovo, and for the world.".toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        "Here at Lenovo, we believe in smarter technology for all, so we spend our time building a society that’s brighter and more inclusive. And we go big. No, not big—huge.\n"
                        "Lenovo is a US\$62 billion revenue global technology powerhouse, ranked #217 in the Fortune Global 500, employing 77,000 people around the world, and serving millions of customers every day in 180 markets. Focused on a bold vision to deliver smarter technology for all, Lenovo has built on its success as the world’s largest PC company by further expanding into growth areas that fuel the advancement of ‘New IT’ technologies (client, edge, cloud, network, and intelligence) including server, storage, mobile, software, solutions, and services. This transformation together with Lenovo’s world-changing innovation is building a more inclusive, trustworthy, and smarter future for everyone, everywhere. To find out more visit lenovo.com, and read about the latest news via our StoryHub.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
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