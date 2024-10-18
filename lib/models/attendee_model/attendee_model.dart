import 'package:lenovo_hiring/models/question_model/question_model.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';

class AttendeeModel {
  String? id;
  dynamic attendedAt;
  QuizModel? quizModel;
  List<QuestionModel> questions;
  double points;
  String attendBy;
  int currentQuestionIndex;
  bool completed;
  int totalTimeInSeconds = 0;

  AttendeeModel(
      {this.id,
      this.attendedAt,
      this.quizModel,
      required this.questions,
      required this.points,
      required this.attendBy,
      required this.currentQuestionIndex,
      required this.completed,
      required this.totalTimeInSeconds});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'attendedAt': attendedAt,
      'quizModel': quizModel?.toMap(),
      'questions': questions.map((e) => e.toMap()).toList(),
      'points': points,
      'attendBy': attendBy,
      'currentQuestionIndex': currentQuestionIndex,
      'completed': completed,
      'totalTimeInSeconds': totalTimeInSeconds
    };
  }

  factory AttendeeModel.fromMap(Map<String, dynamic> map) {
    return AttendeeModel(
        id: map['id'] != null ? map['id'] as String : null,
        attendedAt: map['attendedAt'] as dynamic,
        quizModel: map['quizModel'] != null
            ? QuizModel.fromMap(map['quizModel'] as Map<String, dynamic>)
            : null,
        questions: List<QuestionModel>.from(
            map['questions']?.map((x) => QuestionModel.fromMap(x)) ?? []),
        points: map['points'] as double,
        attendBy: map['attendBy'] as String,
        currentQuestionIndex: map['currentQuestionIndex'] as int,
        completed: map['completed'] as bool,
        totalTimeInSeconds: map['totalTimeInSeconds'] as int);
  }

  AttendeeModel copyWith(
      {String? id,
      dynamic attendedAt,
      QuizModel? quizModel,
      List<QuestionModel>? questions,
      double? points,
      String? attendBy,
      int? currentQuestionIndex,
      bool? completed,
      int? totalTimeInSeconds}) {
    return AttendeeModel(
        id: id ?? this.id,
        attendedAt: attendedAt ?? this.attendedAt,
        quizModel: quizModel ?? this.quizModel,
        questions: questions ?? this.questions,
        points: points ?? this.points,
        attendBy: attendBy ?? this.attendBy,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        completed: completed ?? this.completed,
        totalTimeInSeconds: totalTimeInSeconds ?? this.totalTimeInSeconds);
  }
}
