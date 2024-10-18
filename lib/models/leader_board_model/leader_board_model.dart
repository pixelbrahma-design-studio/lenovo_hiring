// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/models/user_model/user_model.dart';

class LeaderBoardModel {
  String id;
  QuizModel quizModel;

  UserModel user;
  double totoalScore;
  int totalTimeTaken;
  String showTime;

  LeaderBoardModel({
    required this.id,
    required this.quizModel,
    required this.user,
    required this.totoalScore,
    required this.totalTimeTaken,
    required this.showTime,
  });

  LeaderBoardModel copyWith({
    String? id,
    QuizModel? quizModel,
    UserModel? user,
    double? totoalScore,
    int? totalTimeTaken,
    String? showTime,
  }) {
    return LeaderBoardModel(
      id: id ?? this.id,
      quizModel: quizModel ?? this.quizModel,
      user: user ?? this.user,
      totoalScore: totoalScore ?? this.totoalScore,
      totalTimeTaken: totalTimeTaken ?? this.totalTimeTaken,
      showTime: showTime ?? this.showTime,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'quizModel': quizModel.toMap(),
  //     'user': user.toMap(),
  //     'totoalScore': totoalScore,
  //     'totalTimeTaken': totalTimeTaken,
  //     'showTime': showTime,
  //   };
  // }

  // factory LeaderBoardModel.fromMap(Map<String, dynamic> map) {
  //   return LeaderBoardModel(
  //     id: map['id'],
  //     quizModel: QuizModel.fromMap(map['quizModel']),
  //     user: UserModel.fromMap(map['user']),
  //     totoalScore: map['totoalScore'],
  //     totalTimeTaken: map['totalTimeTaken'],
  //     showTime: map['showTime'],
  //   );
  // }
}
