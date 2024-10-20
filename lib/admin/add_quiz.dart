import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_state.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_repository.dart';
import 'package:provider/provider.dart';

class AddQuiz extends StatefulWidget {
  AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  QuizRepository _quizRepository = QuizRepository();
  final formKey = GlobalKey<FormState>();

  // int? order;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Add Quiz"),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromRGBO(222, 6, 191, 1.0),
              Color.fromRGBO(77, 20, 74, 1.0)
            ]),
            image: DecorationImage(
              image: AssetImage("assets/images/grid-2.png"),
              repeat: ImageRepeat.repeatY,
              opacity: 0.5,
              fit: BoxFit.cover,
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Navbar(),
              SizedBox(
                height: 50,
              ),
              Container(
                width: screenWidth * 0.5,
                padding: const EdgeInsets.symmetric(
                    vertical: 50.0, horizontal: 80.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Consumer<QuizState>(
                  builder: (context, state, _) {
                    return Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "ADD QUIZ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            //width: screenWidth * 0.5,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: state.themeController,
                              decoration: InputDecoration(
                                hintText: "Enter Theme",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                errorStyle: TextStyle(color: Colors.white),
                                errorBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                              ),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value == null || value!.trim().isEmpty) {
                                  return "Please Enter Theme";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            //width: 600,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: state.orderCorntroller,
                                    decoration: InputDecoration(
                                      hintText: "Enter order",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value == null ||
                                          value!.trim().isEmpty) {
                                        return "Please Enter Order";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: state.noOfquestionController,
                                    decoration: InputDecoration(
                                      hintText: "Enter number of questions",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value == null ||
                                          value!.trim().isEmpty) {
                                        return "Please Enter number of questions";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            //width: 600,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: state.countController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Count down",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value == null ||
                                          value!.trim().isEmpty) {
                                        return "Please Enter count down";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: state.pointController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Point",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      errorStyle:
                                          TextStyle(color: Colors.white),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value == null ||
                                          value!.trim().isEmpty) {
                                        return "Please Enter point";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            //width: 400,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                child: Text(
                                  state.formateDate ?? "Select Date",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2000),
                                      lastDate:
                                          DateTime(DateTime.now().year + 5),
                                      initialDate: DateTime.now());
                                  if (selectedDate != null) {
                                    state.setQuizDate(selectedDate);
                                    state.setFormateDate(selectedDate);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 50),
                                    backgroundColor:
                                        const Color.fromRGBO(28, 10, 103, 0.5),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ))),
                              ),
                              //],
                              // ),
                              // SizedBox(
                              //   height: 30,
                              // ),
                              // SizedBox(
                              //   //width: 600,
                              // Row(
                              //   children: [
                              ElevatedButton(
                                child: Text(state.startTime == null
                                    ? "Start Time"
                                    : state.startTime!.format(context)),
                                onPressed: () async {
                                  TimeOfDay? time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  if (time != null) {
                                    state.setStartTime(time);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 50),
                                    backgroundColor:
                                        const Color.fromRGBO(28, 10, 103, 0.5),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ))),
                              ),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              ElevatedButton(
                                child: Text(state.endTime == null
                                    ? "End Time"
                                    : state.endTime!.format(context)),
                                onPressed: () async {
                                  TimeOfDay? time = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                  if (time != null) {
                                    state.setEndTime(time);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 50),
                                    backgroundColor:
                                        const Color.fromRGBO(28, 10, 103, 0.5),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: Colors.white,
                                          width: 2,
                                        ))),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          state.addLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      if (formKey.currentState!.validate()) {
                                        DateTime now = DateTime.now();
                                        bool check = state.stateCheck(context);
                                        if (check) {
                                          state.setAddLoading();
                                          QuizModel quizModel = QuizModel(
                                              numberOfQuestions: int.tryParse(
                                                  state.noOfquestionController
                                                      .text
                                                      .trim())!,
                                              theme: state.themeController.text
                                                  .trim(),
                                              formateDate: state.formateDate,
                                              order: int.tryParse(state
                                                  .orderCorntroller.text
                                                  .trim())!,
                                              point: double.tryParse(state
                                                  .pointController.text
                                                  .trim())!,
                                              quizDate: state.quizDate,
                                              startTime: Timestamp.fromDate(
                                                  DateTime(now.year, now.month, now.day, state.startTime.hour, state.startTime.minute)),
                                              endTime: Timestamp.fromDate(DateTime(now.year, now.month, now.day, state.endTime.hour, state.endTime.minute)),
                                              coundown: int.tryParse(state.countController.text.trim())!,
                                              questions: []);
                                          await _quizRepository.CreateQuiz(
                                              quizModel);

                                          state.clearState();

                                          state.getQuizList();
                                        }
                                      }
                                    } catch (e) {
                                      state.setAddLoading();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 50),
                                      backgroundColor: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      foregroundColor:
                                          Color.fromRGBO(28, 10, 103, 1.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ))),
                                  child: Text(
                                    "Add Quiz",
                                    style: TextStyle(
                                      color: Color.fromRGBO(28, 10, 103, 1.0),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      letterSpacing: 0.0,
                                    ),
                                  )),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(28, 10, 103, 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              child: Consumer<QuizState>(
                                builder: (context, ref, child) {
                                  return ref.fetchLoading
                                      ? CircularProgressIndicator()
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: ref.quizModelList.length,
                                          itemBuilder: (c, i) {
                                            QuizModel quiz =
                                                ref.quizModelList[i];
                                            return ListTile(
                                              title: Text(
                                                quiz.theme ?? "",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  //backgroundColor: Color.fromRGBO(28, 10, 103, 1.0),
                                                ),
                                              ),
                                            );
                                          });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
