import 'package:flutter/material.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/models/leader_board_model/leader_board_model.dart';
import 'package:lenovo_hiring/repository/leader_board/leader_board_state.dart';
import 'package:provider/provider.dart';

class LeaderBoardList extends StatefulWidget {
  LeaderBoardList({super.key});

  @override
  State<LeaderBoardList> createState() => _LeaderBoardListState();
}

class _LeaderBoardListState extends State<LeaderBoardList> {
  @override
  void initState() {
    context.read<LeaderBoardState>().setLeaderBoardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Leader Board List'),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
            Color.fromRGBO(222, 6, 191, 1.0),
            Color.fromRGBO(77, 20, 74, 1.0)
          ]),
          image: DecorationImage(
            image: AssetImage("assets/images/grid-2.png"),
            repeat: ImageRepeat.repeatY,
            opacity: 0.5,
            fit: BoxFit.cover,
          )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Navbar(),
              ],
            ),
            // Expanded(
            //   child: Consumer<LeaderBoardState>(
            //     builder: (context, state, _) {
            //       return ListView.builder(
            //         itemCount: state.leaderBoardList.length,
            //         itemBuilder: (context, index) {
            //           LeaderBoardModel leaderBoardModel = state.leaderBoardList[index];
            //           return ListTile(
            //             leading: Text(
            //               'Leader Board ${index + 1}',
            //               style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //             ),
            //             title: Text(leaderBoardModel.user.name),
            //             subtitle: Text(
            //                 "Score: ${leaderBoardModel.totoalScore} , Time: ${leaderBoardModel.totalTimeTaken}"),
            //           );
            //         },
            //       );
            //     }
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/Smartsprint-logo.png",
                  width: screenWidth < 600 ? screenWidth * 0.5 : screenWidth * 0.2,
                  )),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/lb-icon.png"),
                  Text(
                    "Leaderboard".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                width: screenWidth * 0.8,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.transparent, // Background color for the container
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 2.0,               // Border width
                  ),
                  borderRadius: BorderRadius.circular(10.0), // Optional: Rounded corners
                ),
                child: Consumer<LeaderBoardState>(
                  builder: (context, state, _) {
                    return ListView.builder(
                      itemCount: state.leaderBoardList.length,
                      itemBuilder: (context, index) {
                        LeaderBoardModel leaderBoardModel = state.leaderBoardList[index];
                        return Card(
                          color: Color.fromRGBO(255, 255, 255, 0.2),
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              leaderBoardModel.user.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                "Score: ${leaderBoardModel.totoalScore} | Time: ${leaderBoardModel.totalTimeTaken}",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                           
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),


            Footer()
                
          ],
        ),
      ),
    );
  }
}
