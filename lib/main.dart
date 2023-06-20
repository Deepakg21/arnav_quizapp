import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  static const List<Map<String, dynamic>> _questions = [
    {
      "question": "word length of a personal computer is",
      "answers": ["4 bits", "8 bits", "16 bits", "64 bits"],
      "correctAns": "8 bits",
    },
    {
      "question": "Which device is required for the internet connection?",
      "answers": ["joystick", "modem", "CD drive", "nic card"],
      "correctAns": "modem",
    },
    {
      "question": "cursor is a",
      "answers": [
        "pixel",
        "thin blinking line",
        "pointing device",
        "none of the above"
      ],
      "correctAns": "thin blinking line",
    },
    {
      "question": "CPU is an example of",
      "answers": ["software", "a program", "hardware", "an output device"],
      "correctAns": "hardware",
    },
    {
      "question": "an example of peripheral equipment is the ",
      "answers": ["CPU", "spreadsheet", "microcomputer", "printer"],
      "correctAns": "printer",
    },
  ];

  void _answerQuestion(int res) {
    setState(() {
      totalScore += res;
      _questionIndex = (_questionIndex + 1);
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UE213111"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "Reset Quiz",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            _resetQuiz();
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: _questionIndex >= _questions.length
              ? Result(totalScore)
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
