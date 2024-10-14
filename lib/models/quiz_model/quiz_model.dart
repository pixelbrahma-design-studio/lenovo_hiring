import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizModel {
  String theme;
  String? uid;
  int order;
  double point;
  dynamic quizDate;
  dynamic startTime;
  dynamic endTime;
  int coundown;
  List<String> questions = [];
  dynamic createdAt;
  String? formateDate;
  QuizModel({
    required this.theme,
    this.formateDate,
    this.uid,
    required this.order,
    required this.point,
    required this.quizDate,
    required this.startTime,
    required this.endTime,
    required this.coundown,
    required this.questions,
    this.createdAt,
  });

  QuizModel copyWith({
    String? theme,
    String? uid,
    int? order,
    double? point,
    dynamic? quizDate,
    dynamic? startTime,
    dynamic? endTime,
    int? coundown,
    List<String>? questions,
    dynamic? createdAt,
    String? formateDate,
  }) {
    return QuizModel(
      theme: theme ?? this.theme,
      uid: uid ?? this.uid,
      order: order ?? this.order,
      point: point ?? this.point,
      quizDate: quizDate ?? this.quizDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      coundown: coundown ?? this.coundown,
      questions: questions ?? this.questions,
      createdAt: createdAt ?? this.createdAt,
      formateDate: formateDate ?? this.formateDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'theme': theme,
      'uid': uid,
      'order': order,
      'point': point,
      'quizDate': quizDate,
      'startTime': startTime,
      'endTime': endTime,
      'coundown': coundown,
      'questions': questions,
      'createdAt': createdAt,
      'formateDate': formateDate,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      theme: map['theme'] as String,
      uid: map['uid'] != null ? map['uid'] as String : null,
      order: map['order'] as int,
      point: map['point'] as double,
      quizDate: map['quizDate'] as dynamic,
      startTime: map['startTime'] as dynamic,
      endTime: map['endTime'] as dynamic,
      coundown: map['coundown'] as int,
      questions: List<String>.from(map['questions'] ?? []),
      createdAt: map['createdAt'] as dynamic,
      formateDate:
          map['formateDate'] != null ? map['formateDate'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
