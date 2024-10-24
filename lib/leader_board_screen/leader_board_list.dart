import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/models/leader_board_model/leader_board_model.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
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
        child: Consumer<LeaderBoardState>(builder: (context, state, _) {
          return Column(
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
                    child: Image.asset(
                      "assets/images/Smartsprint-logo.png",
                      width: screenWidth < 600
                          ? screenWidth * 0.5
                          : screenWidth * 0.2,
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    if (context.read<AuthState>().user?.role == "admin")
                      Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            children: [
                              // select leader board start time
                              InkWell(
                                onTap: () async {
                                  var time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  if (time != null) {
                                    state.setStartTime(DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        time.hour,
                                        time.minute));
                                  }
                                },
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.startTime != null
                                          ? DateFormat('hh:mm a')
                                              .format(state.startTime.toDate())
                                          : "start time",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  var time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  if (time != null) {
                                    state.setEndTime(DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        time.hour,
                                        time.minute));
                                  }
                                },
                                child: Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      state.endTime != null
                                          ? DateFormat('hh:mm a')
                                              .format(state.endTime.toDate())
                                          : "End time",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // hide buttom
                              SizedBox(
                                width: 20,
                              ),
                              // switch button for  hide
                              Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Row(
                                  children: [
                                    Text("Show"),
                                    Switch(
                                        value: state.show,
                                        onChanged: (val) {
                                          state.setShow(val);
                                        }),
                                  ],
                                )),
                              ),
                            ],
                          )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                    width: screenWidth * 0.8,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors
                          .transparent, // Background color for the container
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          10.0), // Optional: Rounded corners
                    ),
                    child: state.leaderBoardList.isEmpty
                        ? null
                        : check(
                            state,
                            ListView.builder(
                              itemCount: state.leaderBoardList.length,
                              itemBuilder: (context, index) {
                                LeaderBoardModel leaderBoardModel =
                                    state.leaderBoardList[index];
                                return Card(
                                  color: Color.fromRGBO(255, 255, 255, 0.2),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16.0),
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
                                      "${leaderBoardModel.user.name} ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        context.read<AuthState>().user?.role ==
                                                "admin"
                                            ? "Score: ${leaderBoardModel.totoalScore} | Time: ${leaderBoardModel.totalTimeTaken}"
                                            : leaderBoardModel.user.collegeName,
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                  ),
                                );
                              },
                            ))),
              ),

              Footer()
            ],
          );
        }),
      ),
    );
  }

  Widget check(LeaderBoardState state, Widget widget) {
    // Extract time only by setting the same date for all comparisons
    DateTime now = DateTime.now();
    DateTime? todayStartTime;

    DateTime? todayEndTime;

    DateTime currentTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);

    if (state.startTime != null) {
      todayStartTime = DateTime(now.year, now.month, now.day,
          state.startTime.toDate().hour, state.startTime.toDate().minute);
    }

    if (state.endTime != null) {
      todayEndTime = DateTime(now.year, now.month, now.day,
          state.endTime.toDate().hour, state.endTime.toDate().minute);
    }

    if (state.startTime == null || state.endTime == null) {
      if (state.show) {
        return widget;
      }
    }

    if (!state.show) {
      return SizedBox();
    }
    if (state.startTime != null || state.endTime != null) {
      if (currentTime.isAfter(todayStartTime!) &&
          currentTime.isBefore(todayEndTime!) &&
          state.show) {
        return widget;
      }
    }

    return SizedBox();
    // Check if the current time is within the start and end times
  }
}
