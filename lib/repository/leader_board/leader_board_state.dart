import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lenovo_hiring/models/leader_board_model/leader_board_model.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/leader_board/leader_board_repository.dart';

class LeaderBoardState extends ChangeNotifier {
  LeaderBoardRepository leaderBoardRepository = LeaderBoardRepository();
  List<LeaderBoardModel> leaderBoardList = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  dynamic startTime;
  dynamic endTime;
  bool show = false;

  LeaderBoardState() {
    listenTime();
  }

  Future<void> setLeaderBoardList() async {
    try {
      var list = await leaderBoardRepository.getLeaderBord();
      leaderBoardList = list;
    } catch (e) {
      print(e);
      throw e;
    }
    notifyListeners();
  }

  void setStartTime(DateTime dateTime) async {
    startTime = Timestamp.fromDate(dateTime);
    await saveTime();
    notifyListeners();
  }

  void setEndTime(DateTime dateTime) async {
    endTime = Timestamp.fromDate(dateTime);
    await saveTime();
    notifyListeners();
  }

  void setShow(bool value) async {
    show = value;
    await saveTime();
    notifyListeners();
  }

  // save time to firestore
  Future<void> saveTime() async {
    try {
      await firestore.collection("leaderBoardTime").doc("time").set({
        "startTime": startTime,
        "endTime": endTime,
        "show": show,
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // listent the time from firestore
  void listenTime() {
    firestore
        .collection("leaderBoardTime")
        .doc("time")
        .snapshots()
        .listen((event) {
      if (event.exists) {
        startTime = event.data()?["startTime"];
        endTime = event.data()?["endTime"];
        show = event.data()?["show"];
        notifyListeners();
      }
    });
  }
}
