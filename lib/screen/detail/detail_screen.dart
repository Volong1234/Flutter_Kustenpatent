import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/detail_data.dart';
import '../home/widget/dialog.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  void resetState() {
    setState(() {
      containerBackgroundColors = [
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
      ];
      currentQuestionIndex = 0;
      selectedButtonIndex = -1;
    });
  }

  List<Color> containerBackgroundColors = [
    Colors.transparent,
    Colors.transparent,
    Colors.transparent,
  ];
  int currentQuestionIndex = 0;
  int selectedButtonIndex = -1;

  void incrementQuestionIndex() {
    setState(() {
      currentQuestionIndex++;
      selectedButtonIndex = -1;
    });
  }

  void showAnswerResult(bool isCorrect) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            isCorrect
                ? "Correct answer, Good job!"
                : "Oops, wrong answer, try again!",
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  void checkAnswer(int selectedAnswer) {
    final correctAnswer =
        int.parse(DetailData.arrA[currentQuestionIndex]["right"]!);

    for (int i = 0; i < containerBackgroundColors.length; i++) {
      if (i == selectedAnswer - 1) {
        if (selectedAnswer == correctAnswer) {
          containerBackgroundColors[i] = Colors.green;
          showAnswerResult(true);
        } else {
          containerBackgroundColors[i] = Colors.red;
          showAnswerResult(false);// Màu đỏ cho đáp án sai
        }
      } else {
        containerBackgroundColors[i] = Colors.transparent; // Màu trắng
      }
    }

    setState(() {
      selectedButtonIndex = selectedAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<Map<String, String>> arrA = arguments["arrA"];
    final List<Map<String, String>> arrB = arguments["arrB"];
    final int index = arguments["index"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF19598A),
        title: Center(
          child: Text(
            "${arrB[index]["title"]}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Image.asset(
              'assets/images/logow.png',
              width: 60,
              height: 40,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "${arrA[currentQuestionIndex]["question"]}",
                style: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    checkAnswer(1);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerBackgroundColors[0],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding:
                          EdgeInsets.all(selectedButtonIndex == 1 ? 12.0 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "A.${arrA[currentQuestionIndex]["ans2"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: selectedButtonIndex == 1
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            height: selectedButtonIndex == 1 ? 0 : 1,
                            color: selectedButtonIndex == 1
                                ? Colors.transparent
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    checkAnswer(2);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerBackgroundColors[1],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding:
                          EdgeInsets.all(selectedButtonIndex == 2 ? 12.0 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "B.${arrA[currentQuestionIndex]["ans3"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: selectedButtonIndex == 2
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            height: selectedButtonIndex == 2 ? 0 : 1,
                            color: selectedButtonIndex == 2
                                ? Colors.transparent
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    checkAnswer(3);
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: containerBackgroundColors[2],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding:
                          EdgeInsets.all(selectedButtonIndex == 3 ? 12.0 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "C.${arrA[currentQuestionIndex]["ans1"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: selectedButtonIndex == 3
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            height: selectedButtonIndex == 3 ? 0 : 1,
                            color: selectedButtonIndex == 3
                                ? Colors.transparent
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    selectedButtonIndex = -1;
                    if (currentQuestionIndex > 0) {
                      setState(() {
                        currentQuestionIndex--;
                        containerBackgroundColors = [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                        ];
                      });
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 40,
                    margin: const EdgeInsets.all(
                      12.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF19598A),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Vorherige Frage",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedButtonIndex = -1;
                    if (currentQuestionIndex < arrA.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        containerBackgroundColors = [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                        ];
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            onOpenUrl: () async {
                              const url = 'https://www.kuestenpatent-kroatien.at/';
                              if (await canLaunch(url)) {
                              await launch(url);
                              } else {
                              throw 'Could not launch $url';
                              }

                              // Quay lại màn hình câu hỏi và đặt lại trạng thái
                              Navigator.pop(context);
                              resetState();
                            },
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 40,
                    margin: const EdgeInsets.all(
                      12.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF19598A),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.bottomCenter,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Nächste Frage',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
