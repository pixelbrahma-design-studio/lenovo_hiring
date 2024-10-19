import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
//import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'dart:html';  // Already needed for IFrameElement

class AboutLenovoContentMobile extends StatefulWidget {
  const AboutLenovoContentMobile({super.key});

  @override
  State<AboutLenovoContentMobile> createState() => _AboutLenovoContentMobileState();
}
// class GridItem {
//   final String title;
//   final String description;
//   final String imageUrl;

//   GridItem({required this.title, required this.description, required this.imageUrl});
// }
class _AboutLenovoContentMobileState extends State<AboutLenovoContentMobile> {
  // late YoutubePlayerController _controller1;
  // late YoutubePlayerController _controller2;
  // late YoutubePlayerController _controller3;

  
// final List<GridItem> gridItems = [
//   GridItem(
//     title: 'Recognition and Rewards', 
//     description: 'Around here, our work is also our reward. This is a place where ideas grow, initiative wins, achievements are celebrated, and we love the work we get to do.', 
//     imageUrl: 'assets/images/recognition.png'
//   ),
//   GridItem(
//     title: 'Learning and Development', 
//     description: "At Lenovo, you're setting the stage for growth in every corner of the globe - including your own. In addition to our exciting and rewarding work, Grow@Lenovo offers you tens of thousands of free resources including: books, courses, videos, boot-camps, and in-person training. You can also find free professional exam certification training paths and tools to guide, develop and prepare you for the future.", 
//     imageUrl: 'assets/images/learning.png'
//   ),
//   GridItem(
//     title: 'Our Offices', 
//     description: "No matter where you sit, you're working with - and impacting - the rest of us, worldwide. With locations across the globe, we strive to provide dynamic and colorful workplaces that promote creativity and collaboration.", 
//     imageUrl: 'assets/images/office.png'
//   ),
// ];


  @override
  void initState() {
    super.initState();
    registerYoutubeIframes();
  }
  void registerYoutubeIframes(){
    ui.platformViewRegistry.registerViewFactory(
      'youtube-iframe-1',
      (int viewId) => IFrameElement()
        ..src = 'https://www.youtube.com/embed/evHhO5naYco'
        ..style.border = 'none',
    );

    ui.platformViewRegistry.registerViewFactory(
      'youtube-iframe-2',
      (int viewId) => IFrameElement()
        ..src = 'https://www.youtube.com/embed/JV6i5YsDI7o'
        ..style.border = 'none',
    );

    ui.platformViewRegistry.registerViewFactory(
      'youtube-iframe-3',
      (int viewId) => IFrameElement()
        ..src = 'https://www.youtube.com/embed/c3jsG6JrXCw'
        ..style.border = 'none',
    );
  }

  // @override
  // void dispose() {
  //   // _controller1.dispose();
  //   // _controller2.dispose();
  //   // _controller3.dispose();
  //   super.dispose();
  // }

  List<Widget> pageChildren(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return <Widget>[
      
      Column(
        children: [
          // First Section with Background and Text
          Container(
            width: screenWidth,
            
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/abt-lnv-grid-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: screenWidth * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (screenWidth * 0.8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About Lenovo".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "When you work at Lenovo, you make powerful things happen - for you, for Lenovo, and for the world.".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Here at Lenovo, we believe in smarter technology for all, so we spend our time building a society that’s brighter and more inclusive. And we go big. No, not big—huge.\n\n"
                                "Lenovo is a US\$62 billion revenue global technology powerhouse, ranked #217 in the Fortune Global 500, employing 77,000 people around the world, and serving millions of customers every day in 180 markets. Focused on a bold vision to deliver smarter technology for all, Lenovo has built on its success as the world’s largest PC company by further expanding into growth areas that fuel the advancement of ‘New IT’ technologies (client, edge, cloud, network, and intelligence) including server, storage, mobile, software, solutions, and services. This transformation together with Lenovo’s world-changing innovation is building a more inclusive, trustworthy, and smarter future for everyone, everywhere. To find out more visit lenovo.com, and read about the latest news via our StoryHub.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.open_in_new, color: Colors.white),
                                label: Text(
                                  'Go to Website',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(255, 38, 27, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    // Video Column
                    SizedBox(
                      width: (screenWidth * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // YoutubePlayer(
                          //   controller: _controller1,
                          //   aspectRatio: 16 / 9,
                          // ),
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            //width: 600,
                            //height: 400,
                            child: HtmlElementView(viewType: 'youtube-iframe-1'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Culture Section
          Container(
            width: screenWidth * 0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: (screenWidth * 0.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                            //width: 600,
                            //height: 400,
                            child: HtmlElementView(viewType: 'youtube-iframe-2'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  // Culture Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: (screenWidth * 0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "CULTURE".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(122, 18, 107, 1),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "What makes you you, makes Lenovo better.".toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(77, 20, 74, 1),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Around here, no matter how you look, sound, dress or spell your name - no matter what your title your role, or your market – you’re on the team. We believe great ideas comes from anywhere and we need the unique perspective and talent you bring.",
                              style: TextStyle(
                                color: Color.fromRGBO(27, 9, 20, 1),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "At Lenovo, you are part of a company where all add value and all belong. You team together with trust and respect in support of each other and our global community.".toUpperCase(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(27, 9, 20, 1),
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

          // Perks Section
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(77, 20, 74, 1),
            ),
            child: Container(
              width: screenWidth * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: (screenWidth * 0.8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PERKS".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Benefits that make a difference".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Lenovo offers a wide range of best-in-class benefits, to make your daily routine easier. Whether it is health, lifestyle or financial, we want to help you and your family through life's journey. So you can be the best you - and together, we can be the best Lenovo.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    // Video for Perks
                    SizedBox(
                      width: (screenWidth * 0.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // YoutubePlayer(
                          //   controller: _controller3,
                          //   aspectRatio: 16 / 9,
                          // ),
                          // SizedBox(
                          //   width: 600,
                          //   height: 400,
                          //   child: HtmlElementView(viewType: 'youtube-iframe-3'),
                          // )
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: HtmlElementView(viewType: 'youtube-iframe-3'),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(241, 225, 237, 1),
              //borderRadius: BorderRadius.circular(10),
            ),
            //alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 60, bottom: 30, right: 60, left: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Recognition and Rewards".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20, 
                                    color: Color.fromRGBO(27, 9, 20, 1),
                                  )
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Around here, our work is also our reward. This is a place where ideas grow, initiative wins, achievements are celebrated, and we love the work we get to do.",
                                  style: TextStyle(
                                    fontSize: 14, 
                                    color: Color.fromRGBO(27, 9, 20, 1),
                                  )
                                ),
                                                      
                              ],
                            ),
                          ),
                          Container(
                            child: Image.asset("assets/images/recognition.png"),
                          ),
                        ],
                      )
                    ] 
                  ),
              
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          
                          Padding(
                            padding: EdgeInsets.only(top: 60, bottom: 30, right: 60, left: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Learning and Development".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20, 
                                    color: Color.fromRGBO(27, 9, 20, 1),
                                  )
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "At Lenovo, you're setting the stage for growth in every corner of the globe - including your own. In addition to our exciting and rewarding work, Grow@Lenovo offers you tens of thousands of free resources including: books, courses, videos, boot-camps, and in-person training. You can also find free professional exam certification training paths and tools to guide, develop and prepare you for the future.",
                                  style: TextStyle(
                                    fontSize: 14, 
                                    color: Color.fromRGBO(27, 9, 20, 1),
                                  )
                                ),
                                              
                              ],
                            ),
                          ),
                          Container(
                            child: Image.asset("assets/images/learning.png"),
                          ),
                        ],
                      )
                    ] 
                  ),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 60, bottom: 30, right: 60, left: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Our Offices".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20, 
                                    color: Color.fromRGBO(27, 9, 20, 1),
                                  )
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "No matter where you sit, you're working with - and impacting - the rest of us, worldwide. With locations across the globe, we strive to provide dynamic and colorful workplaces that promote creativity and collaboration.",
                                  style: TextStyle(
                                    fontSize: 14, 
                                    color: Color.fromRGBO(27, 9, 20, 1),
                                  )
                                ),
                                              
                              ],
                            ),
                          ),
                          Container(
                            child: Image.asset("assets/images/office.png"),
                          ),
                        ],
                      )
                    ] 
                  ),
                            
                ],
              ),
            ),
          )
  


        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: pageChildren(context),
      ),
    );
  }

  
}
