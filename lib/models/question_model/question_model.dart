import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  String? uid;
  String questionTitle;
  String? questionImage;
  List<String> options;
  int answerIndex;
  String? explanation;
  dynamic createdAt;
  String? createdBy;
  String? quizId;
  String? quizTheme;
  int? userAnswerIndex;
  int? timeTaken;
  QuestionModel({
    this.createdBy,
    this.uid,
    required this.questionTitle,
    this.questionImage,
    required this.options,
    required this.answerIndex,
    required this.explanation,
    this.createdAt,
    this.quizId,
    this.quizTheme,
    this.userAnswerIndex,
    this.timeTaken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdBy': createdBy,
      'uid': uid,
      'questionTitle': questionTitle,
      'questionImage': questionImage,
      'options': options,
      'answerIndex': answerIndex,
      'explanation': explanation ?? "",
      'createdAt': createdAt,
      'quizId': quizId,
      'quizTheme': quizTheme,
      'userAnswerIndex': userAnswerIndex,
      'timeTaken': timeTaken,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      createdBy: map['createdBy'] ?? "",
      uid: map['uid'] != null ? map['uid'] as String : null,
      questionTitle: map['questionTitle'] as String,
      questionImage: map['questionImage'] ?? null,
      options: List<String>.from(map['options'] ?? []),
      answerIndex: map['answerIndex'] as int,
      explanation: map['explanation'] ?? "",
      createdAt: map['createdAt'] as dynamic,
      quizId: map['quizId'] ?? "",
      quizTheme: map['quizTheme'] ?? "",
      userAnswerIndex: map['userAnswerIndex'] ?? null,
      timeTaken: map['timeTaken'] ?? null,
    );
  }

  QuestionModel copyWith({
    String? createdBy,
    String? uid,
    String? questionTitle,
    String? questionImage,
    List<String>? options,
    int? answerIndex,
    String? explanation,
    dynamic? createdAt,
    String? quizId,
    String? quizTheme,
    int? userAnswerIndex,
    int? timeTaken,
  }) {
    return QuestionModel(
      createdBy: createdBy ?? this.createdBy,
      uid: uid ?? this.uid,
      questionTitle: questionTitle ?? this.questionTitle,
      questionImage: questionImage ?? this.questionImage,
      options: options ?? this.options,
      answerIndex: answerIndex ?? this.answerIndex,
      explanation: explanation ?? this.explanation,
      createdAt: createdAt ?? this.createdAt,
      quizId: quizId ?? this.quizId,
      quizTheme: quizTheme ?? this.quizTheme,
      userAnswerIndex: userAnswerIndex ?? this.userAnswerIndex,
      timeTaken: timeTaken ?? this.timeTaken,
    );
  }
}
