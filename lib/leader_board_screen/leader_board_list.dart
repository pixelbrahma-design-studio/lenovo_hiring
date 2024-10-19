import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leader Board List'),
      ),
      body: Consumer<LeaderBoardState>(builder: (context, state, _) {
        return ListView.builder(
          itemCount: state.leaderBoardList.length,
          itemBuilder: (context, index) {
            LeaderBoardModel leaderBoardModel = state.leaderBoardList[index];
            return ListTile(
              leading: Text('Leader Board ${index + 1}'),
              title: Text(leaderBoardModel.user.name),
              subtitle: Text(
                  "Score: ${leaderBoardModel.totoalScore} , Time: ${leaderBoardModel.totalTimeTaken}"),
            );
          },
        );
      }),
    );
  }
}
