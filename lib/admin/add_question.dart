import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/Footer/Footer.dart';
import 'package:lenovo_hiring/Navbar/Navbar.dart';
import 'package:lenovo_hiring/Quiz/quiz_set.dart';
import 'package:lenovo_hiring/repository/quiz/quiz_state.dart';
import 'package:lenovo_hiring/models/question_model/question_model.dart';
import 'package:lenovo_hiring/models/quiz_model/quiz_model.dart';

import 'package:lenovo_hiring/repository/question/question_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  QuestionRepository questionRepository = QuestionRepository();
  final formKey = GlobalKey<FormState>();

  bool loading = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController optionController = TextEditingController();
  TextEditingController explanationController = TextEditingController();
  PlatformFile? pickedImage;
  List<String> options = [];
  int? answerIndex;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Add Question"),
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Navbar(),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            padding: EdgeInsets.all(60.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          var image = await questionRepository
                                              .pickImage();
                                          if (image != null) {
                                            setState(() {
                                              pickedImage = image;
                                            });
                                          }
                                        },
                                        child: Container(
                                            color: const Color.fromARGB(
                                                255, 214, 214, 214),
                                            alignment: Alignment.center,
                                            height: 200,
                                            width: 200,
                                            child: pickedImage != null
                                                ? Image.memory(
                                                    pickedImage!.bytes!)
                                                : Text(
                                                    "Select Image",
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          28, 10, 103, 1.0),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    //width: 400,
                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: titleController,
                                      decoration: InputDecoration(
                                        hintText: "Enter Title",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
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
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      validator: (value) {
                                        if (value == null ||
                                            value!.trim().isEmpty) {
                                          return "Please Enter Title";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    //width: 400,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: optionController,
                                            decoration: InputDecoration(
                                              hintText: "Options",
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              errorStyle: TextStyle(
                                                  color: Colors.white),
                                              errorBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white)),
                                            ),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              if (optionController.text ==
                                                      null ||
                                                  optionController.text
                                                      .trim()
                                                      .isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'Option cant be empty')));
                                              } else {
                                                setState(() {
                                                  options.add(optionController
                                                      .text
                                                      .trim());
                                                  optionController.clear();
                                                });
                                              }
                                            },
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    28, 10, 103, 1.0),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                letterSpacing: 0.0,
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: options.isNotEmpty,
                                    child: Container(
                                      //width: 300,
                                      child: Wrap(
                                        children: options
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          int index =
                                              entry.key; // Get the index
                                          String value =
                                              entry.value; // Get the value

                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  answerIndex = index;
                                                });
                                              },
                                              child: Chip(
                                                backgroundColor:
                                                    answerIndex != null &&
                                                            index == answerIndex
                                                        ? Colors.green
                                                        : null,
                                                onDeleted: () {
                                                  setState(() {
                                                    if (index == answerIndex) {
                                                      answerIndex = null;
                                                    }
                                                    options.removeAt(index);
                                                  });
                                                },
                                                label: Text('$value'),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    //width: 400,
                                    child: TextFormField(
                                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                                      controller: explanationController,
                                      decoration: InputDecoration(
                                        hintText: "Enter Explanation",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
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
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      validator: (value) {
                                        // if (value == null || value!.trim().isEmpty) {
                                        //   return "Please Enter Explanation";
                                        // }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Consumer<QuizState>(
                                    builder: (context, ref, child) {
                                      return DropdownButtonFormField(
                                          hint: Text(
                                            ref.selectedQuiz?.theme ??
                                                "Select Quiz Theme",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "Gotham",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          iconEnabledColor: Colors.white,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            errorStyle:
                                                TextStyle(color: Colors.white),
                                            errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white)),
                                          ),
                                          items: ref.quizModelList
                                              .map((QuizModel quiz) {
                                            return DropdownMenuItem<QuizModel>(
                                                value: quiz,
                                                child: Text(
                                                  quiz.theme,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        17, 24, 79, 1),
                                                    fontSize: 16,
                                                    fontFamily: "Gotham",
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ));
                                          }).toList(),
                                          onChanged: (val) {
                                            if (val != null) {
                                              ref.setQuizTheme(val);
                                            }
                                          });
                                    },
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  loading
                                      ? CircularProgressIndicator()
                                      : ElevatedButton(
                                          onPressed: () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              if (options.isNotEmpty) {
                                                if (answerIndex != null) {
                                                  if (context
                                                          .read<QuizState>()
                                                          .selectedQuiz !=
                                                      null) {
                                                    try {
                                                      setState(() {
                                                        loading = true;
                                                      });
                                                      QuestionModel question =
                                                          QuestionModel(
                                                              timeTaken: 0,
                                                              quizId: context
                                                                  .read<
                                                                      QuizState>()
                                                                  .selectedQuiz!
                                                                  .uid!,
                                                              quizTheme: context
                                                                  .read<
                                                                      QuizState>()
                                                                  .selectedQuiz!
                                                                  .theme,
                                                              questionTitle:
                                                                  titleController
                                                                      .text
                                                                      .trim(),
                                                              options: options,
                                                              answerIndex:
                                                                  answerIndex!,
                                                              explanation:
                                                                  explanationController
                                                                      .text
                                                                      .trim());

                                                      await questionRepository
                                                          .CreateQuestion(
                                                              question,
                                                              pickedImage);
                                                      setState(() {
                                                        loading = false;
                                                      });
                                                      // clear();
                                                      context.pushReplacement(
                                                          '/add-question');
                                                      print(
                                                          "picked image : $pickedImage");
                                                    } catch (e) {
                                                      setState(() {
                                                        loading = false;
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(e
                                                                  .toString())));
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                'Please select Qize theme')));
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Please select Answer')));
                                                }
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'option cant be empty')));
                                              }
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20, horizontal: 50),
                                              backgroundColor:
                                                  const Color.fromRGBO(
                                                      255, 255, 255, 1),
                                              foregroundColor: Color.fromRGBO(
                                                  28, 10, 103, 1.0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  side: BorderSide(
                                                    color: Colors.white,
                                                    width: 2,
                                                  ))),
                                          child: Text(
                                            "Add Question",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  28, 10, 103, 1.0),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              letterSpacing: 0.0,
                                            ),
                                          )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: AppBar(
                                title: Text(
                                  "Questions List",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    Color.fromRGBO(28, 10, 103, 1.0),
                                centerTitle: true,
                              ),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(28, 10, 103, 0.5),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.only(bottom: 50),
                              child: StreamBuilder(
                                  stream:
                                      questionRepository.listenAllQuestions(),
                                  builder: (c, s) {
                                    var questions = s.data;
                                    if (s.hasError) {
                                      return Text("error");
                                    }
                                    if (s.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    return ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: questions!.length,
                                        itemBuilder: (c, i) {
                                          var question = questions![i];
                                          return Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      50, 30, 50, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Question : \n${question.questionTitle}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Options : ',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Wrap(
                                                        children: question
                                                            .options
                                                            .map((e) => Text(
                                                                  "$e, ",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Answer : \n${question.options[question.answerIndex]}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Explanation : \n${question.explanation}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Divider()
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                            )
                          ]))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  clear() {
    setState(() {
      pickedImage = null;
      options.clear();
      titleController.clear();
      explanationController.clear();
      answerIndex = null;
      formKey.currentState?.reset();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
