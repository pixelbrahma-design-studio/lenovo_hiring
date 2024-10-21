import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';

class QuizState extends ChangeNotifier {
  QuizState() {
    getQuizList();
  }
  QuizRepository _quizRepository = QuizRepository();
  var quizFormKey = GlobalKey<FormState>();
  TextEditingController themeController = TextEditingController();
  TextEditingController orderCorntroller = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController noOfquestionController = TextEditingController();
  // int? order;
  // double? point;
  dynamic quizDate;
  dynamic startTime;
  dynamic endTime;
  //int? coundown;

  QuizModel? selectedQuiz;

  String? formateDate;
  List<String> questions = [];
  List<QuizModel> quizModelList = [];
  bool addLoading = false;
  bool fetchLoading = false;

  // void addOrder(int value) {
  //   order = value;
  //   notifyListeners();
  // }

  // void addPoint(double val) {
  //   point = val;
  //   notifyListeners();
  // }

  void setQuizDate(DateTime dateTime) {
    quizDate = Timestamp.fromDate(dateTime);
    notifyListeners();
  }

  void setFormateDate(DateTime dateTime) {
    formateDate = DateFormat.yMd().format(dateTime);
    notifyListeners();
  }

  void setStartTime(TimeOfDay time) {
    startTime = time;
    notifyListeners();
  }

  void setEndTime(TimeOfDay time) {
    endTime = time;
    notifyListeners();
  }

  void setAddLoading() {
    addLoading = !addLoading;
    notifyListeners();
  }

  void setFetchLoading() {
    fetchLoading = !fetchLoading;
    notifyListeners();
  }

  void getQuizList() async {
    setFetchLoading();
    var result = await _quizRepository.listenQuiz();
    quizModelList = result;
    setFetchLoading();
    notifyListeners();
  }

  bool stateCheck(BuildContext context) {
    if (quizDate == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please Select Date")));
      return false;
    }
    if (startTime == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please Select start Time")));
      return false;
    }

    if (endTime == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("please Select end Time")));
      return false;
    }

    // Compare hours first
    if (endTime!.hour < startTime!.hour) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("End time should be after start time")));
      return false;
    } else if (endTime!.hour == startTime!.hour) {
      // If hours are equal, compare minutes
      if (endTime!.minute <= startTime!.minute) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("End time should be after start time")));
        return false;
      }
    }

    return true;
  }

  void setQuizTheme(QuizModel quiz) {
    selectedQuiz = quiz;
    notifyListeners();
  }

  void clearState() {
    quizDate = null;
    formateDate = null;
    startTime = null;
    endTime = null;
    questions = [];
    addLoading = false;
    // quizFormKey.currentState?.reset();
    themeController.clear();
    pointController.clear();
    countController.clear();
    orderCorntroller.clear();
    noOfquestionController.clear();
    //quizFormKey.currentState?.reset();

    notifyListeners();
  }
}
