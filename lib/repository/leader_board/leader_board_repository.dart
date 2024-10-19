import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenovo_hiring/models/attendee_model/attendee_model.dart';
import 'package:lenovo_hiring/models/leader_board_model/leader_board_model.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';

class LeaderBoardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LeaderBoardModel>> getLeaderBord() async {
    try {
      var snap = await _firestore.collection('attendees').get();

      List<LeaderBoardModel> leaderBoardList = [];

      // Use a for loop with await to handle async operations correctly
      for (var element in snap.docs) {
        AttendeeModel attendeeModel = AttendeeModel.fromMap(element.data());
        print("repo attend: ${attendeeModel.attendBy}");

        // Await the result of async getuserById call
        UserModel user = await getuserById(attendeeModel.attendBy);

        // Create the LeaderBoardModel instance
        LeaderBoardModel leaderBoardModel = LeaderBoardModel(
          id: attendeeModel.id!,
          quizModel: attendeeModel.quizModel!,
          user: user,
          totoalScore: 0,
          totalTimeTaken: 0,
          showTime: attendeeModel.attendedAt.toString(),
        );

        // Loop through attendeeModel.questions and sum the time taken
        for (var i = 0; i < attendeeModel.questions.length; i++) {
          if (attendeeModel.questions[i].answerIndex ==
              attendeeModel.questions[i].userAnswerIndex) {
            leaderBoardModel = leaderBoardModel.copyWith(
              totoalScore: leaderBoardModel.totoalScore + attendeeModel.points,
              totalTimeTaken: leaderBoardModel.totalTimeTaken +
                  attendeeModel.questions[i].timeTaken!,
            );
            print("leaderBoardModel score: ${leaderBoardModel.totoalScore}");
          } else {
            leaderBoardModel = leaderBoardModel.copyWith(
              totalTimeTaken: leaderBoardModel.totalTimeTaken +
                  attendeeModel.questions[i].timeTaken!,
            );
          }
        }

        print("leaderBoardModel time: ${leaderBoardModel.totalTimeTaken}");

        // Add the processed leaderboard model to the list
        leaderBoardList.add(leaderBoardModel);
      }

      // Sort the leaderboard: first by highest score, then by lowest time
      leaderBoardList.sort((a, b) {
        // Compare by total score first
        int scoreComparison = b.totoalScore.compareTo(a.totoalScore);
        if (scoreComparison != 0) {
          return scoreComparison; // Higher score comes first
        } else {
          // If scores are the same, compare by time (lower time comes first)
          return a.totalTimeTaken.compareTo(b.totalTimeTaken);
        }
      });

      print("leaderBoardList length: ${leaderBoardList.length}");

      return leaderBoardList; // Return the populated list
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // getUser by id
  Future<UserModel> getuserById(String id) async {
    try {
      return await _firestore.collection('users').doc(id).get().then((value) {
        return UserModel.fromMap(value.data() as Map<String, dynamic>);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
