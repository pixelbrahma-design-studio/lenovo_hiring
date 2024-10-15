import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lenovo_hiring/controllers/quiz_controller/quiz_state.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Quiz"),
      ),
      body: SingleChildScrollView(
        child: Consumer<QuizState>(
          builder: (context, state, _) {
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: state.themeController,
                      decoration: InputDecoration(
                        hintText: "Enter Theme",
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                      validator: (value) {
                        if (value == null || value!.trim().isEmpty) {
                          return "Please Enter Theme";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 600,
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
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value!.trim().isEmpty) {
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
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value!.trim().isEmpty) {
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
                    height: 15,
                  ),
                  SizedBox(
                    width: 600,
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
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value!.trim().isEmpty) {
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
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value!.trim().isEmpty) {
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
                    height: 15,
                  ),
                  SizedBox(
                    width: 400,
                    child: ElevatedButton(
                      child: Text(state.formateDate ?? "Select Date"),
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(DateTime.now().year + 5),
                            initialDate: DateTime.now());
                        if (selectedDate != null) {
                          state.setQuizDate(selectedDate);
                          state.setFormateDate(selectedDate);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 600,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
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
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ElevatedButton(
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
                          ),
                        ),
                      ],
                    ),
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
                                bool check = state.stateCheck(context);
                                if (check) {
                                  state.setAddLoading();
                                  QuizModel quizModel = QuizModel(
                                      numberOfQuestions: int.tryParse(state
                                          .noOfquestionController.text
                                          .trim())!,
                                      theme: state.themeController.text.trim(),
                                      formateDate: state.formateDate,
                                      order: int.tryParse(
                                          state.orderCorntroller.text.trim())!,
                                      point: double.tryParse(
                                          state.pointController.text.trim())!,
                                      quizDate: state.quizDate,
                                      startTime:
                                          state.startTime!.format(context),
                                      endTime: state.endTime!.format(context),
                                      coundown: int.tryParse(
                                          state.countController.text.trim())!,
                                      questions: []);
                                  await _quizRepository.CreateQuiz(quizModel);

                                  state.clearState();

                                  state.getQuizList();
                                }
                              }
                            } catch (e) {
                              state.setAddLoading();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          },
                          child: Text("Add Quiz")),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<QuizState>(
                    builder: (context, ref, child) {
                      return ref.fetchLoading
                          ? CircularProgressIndicator()
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: ref.quizModelList.length,
                              itemBuilder: (c, i) {
                                QuizModel quiz = ref.quizModelList[i];
                                return ListTile(
                                  title: Text(quiz.theme ?? ""),
                                );
                              });
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
