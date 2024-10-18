import 'package:flutter/foundation.dart';
import 'package:lenovo_hiring/models/leader_board_model/leader_board_model.dart';
import 'package:lenovo_hiring/repository/leader_board/leader_board_repository.dart';

class LeaderBoardState extends ChangeNotifier {
  LeaderBoardRepository leaderBoardRepository = LeaderBoardRepository();
  List<LeaderBoardModel> leaderBoardList = [];

  Future<void> setLeaderBoardList(String quizId) async {
    try {
      var list = await leaderBoardRepository.getLeaderBordbyQuizId(quizId);
      leaderBoardList = list;
    } catch (e) {
      print(e);
      throw e;
    }
    notifyListeners();
  }
}
