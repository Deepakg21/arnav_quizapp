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
      "question": "Who invented C programming?",
      "answers": [
        "james gosling",
        "dennis ritche",
        "bjarne stroustrup",
        "tim berners"
      ],
      "correctAns": "dennis ritche",
    },
    {
      "question": "where does c language get invented?",
      "answers": [
        "ritche's lab",
        "AT & T Bell labs",
        "under oak tree",
        "fringe labs"
      ],
      "correctAns": "AT & T Bell labs",
    },
    {
      "question": "which symbol terminates a C statement?",
      "answers": [".", ",", ";", "}"],
      "correctAns": ";",
    },
    {
      "question": "diagram representation of an algorithm is called",
      "answers": [
        "data flow diagram",
        "E-R diagram",
        "flowchart",
        "none of the above"
      ],
      "correctAns": "flowchart",
    },
    {
      "question": "C was developed in the year ",
      "answers": ["1970", "1972", "1976", "1980"],
      "correctAns": "1972",
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
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UE218120"),
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
