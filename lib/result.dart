import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset('assets/images/well.jpg', width: 400),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(380, 460, 0, 0),
          child: Text(
            "Your Score : $score / 10",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
      ]),
    );
  }
}
