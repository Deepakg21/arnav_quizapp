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
      "question": "In which country is transylvania?",
      "answers": ["bulgaria", "romania", "croatia", "serbia"],
      "correctAns": "romania",
    },
    {
      "question": "which of the following animals can run the fastest?",
      "answers": ["cheetah", "leopard", "tiger", "lion"],
      "correctAns": "cheetah",
    },
    {
      "question": "what is the main component of the sun?",
      "answers": ["liquid lava", "gas", "molten iron", "rock"],
      "correctAns": "gas",
    },
    {
      "question": "first country to use tanks in combat during world war 1",
      "answers": ["france", "japan", "britian", "germany"],
      "correctAns": "britian",
    },
    {
      "question": "most point player can score with single throw in darts? ",
      "answers": ["20", "40", "60", "80"],
      "correctAns": "60",
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
      theme: ThemeData(primarySwatch: Colors.brown),
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
