import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/models/question_model/question_model.dart';

import 'package:lenovo_hiring/repository/question/question_repository.dart';
import 'package:file_picker/file_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Question"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          var image = await questionRepository.pickImage();
                          if (image != null) {
                            setState(() {
                              pickedImage = image;
                            });
                          }
                        },
                        child: Container(
                            color: Colors.black,
                            height: 200,
                            width: 200,
                            child: pickedImage != null
                                ? Image.memory(pickedImage!.bytes!)
                                : Text(
                                    "Select Image",
                                    style: TextStyle(color: Colors.white),
                                  )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: titleController,
                          decoration: InputDecoration(
                            hintText: "Enter Title",
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
                              return "Please Enter Title";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 400,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: optionController,
                                decoration: InputDecoration(
                                  hintText: "options",
                                  hintStyle: TextStyle(color: Colors.black),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (optionController.text == null ||
                                      optionController.text.trim().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('option cant be empty')));
                                  } else {
                                    setState(() {
                                      options.add(optionController.text.trim());
                                      optionController.clear();
                                    });
                                  }
                                },
                                child: Text("Add"))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: options.isNotEmpty,
                        child: Container(
                          width: 300,
                          child: Wrap(
                            children: options.asMap().entries.map((entry) {
                              int index = entry.key; // Get the index
                              String value = entry.value; // Get the value

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      answerIndex = index;
                                    });
                                  },
                                  child: Chip(
                                    backgroundColor: answerIndex != null &&
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
                        height: 15,
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: explanationController,
                          decoration: InputDecoration(
                            hintText: "Enter explanation",
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
                              return "Please Enter Title";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      loading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  if (options.isNotEmpty) {
                                    if (answerIndex != null) {
                                      try {
                                        setState(() {
                                          loading = true;
                                        });
                                        QuestionModel question = QuestionModel(
                                            questionTitle:
                                                titleController.text.trim(),
                                            options: options,
                                            answerIndex: answerIndex!,
                                            explanation: explanationController
                                                .text
                                                .trim());

                                        await questionRepository.CreateQuestion(
                                            question, pickedImage);
                                        setState(() {
                                          loading = false;
                                        });
                                        // clear();
                                        context
                                            .pushReplacement('/add-question');
                                        print("picked image : $pickedImage");
                                      } catch (e) {
                                        setState(() {
                                          loading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(e.toString())));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Please select Answer')));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('option cant be empty')));
                                  }
                                }
                              },
                              child: Text("Add Question"))
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(children: [
                    AppBar(
                      title: Text("Questions List"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // StreamBuilder(
                    //     stream: questionRepository.listenAllQuestions(),
                    //     builder: (c, s) {
                    //       var questions = s.data;
                    //       if (s.hasError) {
                    //         return Text("error");
                    //       }
                    //       if (s.connectionState == ConnectionState.waiting) {
                    //         return CircularProgressIndicator();
                    //       }
                    //       return ListView.builder(
                    //           physics: NeverScrollableScrollPhysics(),
                    //           shrinkWrap: true,
                    //           itemCount: questions!.length,
                    //           itemBuilder: (c, i) {
                    //             var question = questions![i];
                    //             return Container(
                    //               child: Column(
                    //                 children: [
                    //                   Text(question.questionTitle),
                    //                   Wrap(
                    //                     children: question.options
                    //                         .map((e) => Text(e))
                    //                         .toList(),
                    //                   ),
                    //                   Text(
                    //                       "Answer : ${question.options[question.answerIndex]}"),
                    //                   Text(
                    //                       "Explanation : \n${question.explanation}"),
                    //                   Divider()
                    //                 ],
                    //               ),
                    //             );
                    //           });
                    //     })
                  ]))
            ],
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
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
