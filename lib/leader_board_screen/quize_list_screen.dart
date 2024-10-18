import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/leader_board/leader_board_state.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_state.dart';
import 'package:provider/provider.dart';

class QuizListScreen extends StatelessWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz List'),
      ),
      body: Consumer<QuizState>(builder: (context, state, _) {
        return ListView.builder(
          itemCount: state.quizModelList.length,
          itemBuilder: (context, index) {
            QuizModel quizModel = state.quizModelList[index];
            return ListTile(
              leading: Text('Quiz $index'),
              title: Text(quizModel.theme),
              subtitle: Text(quizModel.formateDate!),
              onTap: () async {
                try {
                  // await context
                  //     .read<LeaderBoardState>()
                  //     .setLeaderBoardList(quizModel.uid!);
                  context.go('/quiz/${quizModel.uid}');
                } catch (e) {
                  print("erre $e");
                }
              },
            );
          },
        );
      }),
    );
  }
}
