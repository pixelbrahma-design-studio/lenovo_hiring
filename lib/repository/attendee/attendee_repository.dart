import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lenovo_hiring/models/attendee_model/attendee_model.dart';
import 'package:lenovo_hiring/models/question_model/question_model.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';

class AttendeeRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // CREATE ATTDEDEE
  Future<int?> createAttendee(AttendeeModel attendeeModel, QuizModel quizModel,
      BuildContext contex) async {
    try {
      bool exist =
          await checkIfAttendeeExist(attendeeModel.attendBy, true, contex);
      if (exist) {
        return null;
      } else {
        bool exist =
            await checkIfAttendeeExist(attendeeModel.attendBy, false, contex);
        if (exist) {
          return 0;
        } else {
          String id = _firestore.collection('attendees').doc().id;
          attendeeModel = attendeeModel.copyWith(
            id: id,
            attendedAt: Timestamp.now(),
          );

          for (var i = 0; i < quizModel.questions.length; i++) {
            QuestionModel questionModel =
                await getQuestionById(quizModel.questions[i]);
            questionModel = questionModel.copyWith();
            attendeeModel.questions.add(questionModel);
          }

          await _firestore
              .collection('attendees')
              .doc(id)
              .set(attendeeModel.toMap());
          // AttendeeModel attendeeModelFromDataBase = await getAttendee(id);
          return 1;
        }
      }
    } catch (e) {
      print("wrroe : $e");
      throw e;
    }
  }

  // get Questions
  Future<QuestionModel> getQuestionById(String uid) async {
    try {
      return await _firestore
          .collection('questions')
          .doc(uid)
          .get()
          .then((value) {
        return QuestionModel.fromMap(value.data() as Map<String, dynamic>);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // getAteendee
  Future<AttendeeModel> getAttendee(String id) async {
    try {
      return await _firestore
          .collection('attendees')
          .doc(id)
          .get()
          .then((value) {
        return AttendeeModel.fromMap(value.data() as Map<String, dynamic>);
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> updateAttendee(AttendeeModel attendeeModel) async {
    try {
      await _firestore
          .collection('attendees')
          .doc(attendeeModel.id)
          .update(attendeeModel.toMap());
    } catch (e) {
      print("error : $e");
      throw e;
    }
  }

  // stream attendee by attendBy limit 1
  Stream<QuerySnapshot> streamAttendeeByAttendBy(String attendBy) {
    try {
      return _firestore
          .collection('attendees')
          .where('attendBy', isEqualTo: attendBy)
          .limit(1)
          .snapshots();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // get attendee by attendBy limit 1
  Future<AttendeeModel> getAttendeeByAttendBy(
      String attendBy, DateTime date, BuildContext context) async {
    try {
      return await _firestore
          .collection('attendees')
          .where('attendBy', isEqualTo: attendBy)
          .where("quizModel.formateDate",
              isEqualTo: DateFormat.yMd().format(date))
          .where('quizModel.endTime',
              isLessThanOrEqualTo: TimeOfDay.now().format(context))
          .where('quizModel.startTime',
              isGreaterThanOrEqualTo: TimeOfDay.now()
                  .format(context)) // check the date and completed
          .limit(1)
          .get()
          .then((value) {
        print("value.docs.first.data() ${value.docs.first.data()}");
        return AttendeeModel.fromMap(value.docs.first.data());
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> checkIfAttendeeExist(
      String attendBy, bool completed, BuildContext contex) async {
    try {
      return await _firestore
          .collection('attendees')
          .where('attendBy', isEqualTo: attendBy)
          .where('completed', isEqualTo: completed)
          .where("quizModel.formateDate",
              isEqualTo: DateFormat.yMd().format(DateTime.now()))
          .where('startTime',
              isGreaterThanOrEqualTo: TimeOfDay.now().format(contex))
          .where('endTime',
              isLessThan: TimeOfDay.now()
                  .format(contex)) // check the date and completed
          .limit(1)
          .get()
          .then((value) {
        return value.docs.isNotEmpty;
      });
    } catch (e) {
      print("checking errir: $e");
      throw e;
    }
  }

  // // update useranswer Index
  // Future<void> updateUserAnswerIndex(
  //     AttendeeModel attendeeModel, int userAnswerIndex) async {
  //   try {
  //     attendeeModel.questions[attendeeModel.currentQuestionIndex]
  //         .userAnswerIndex = userAnswerIndex;
  //     await updateAttendee(attendeeModel);
  //   } catch (e) {
  //     print(e);
  //     throw e;
  //   }
  // }
}
