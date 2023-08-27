import 'package:adv_basics/models/quiz_user_answer.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.userAnswer, {super.key});

  final QuizUserAnswer userAnswer;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(0, 255, 255, 255),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Card(
              color: userAnswer.isCorrect()
                  ? const Color.fromARGB(255, 71, 155, 211)
                  : const Color.fromARGB(255, 210, 45, 62),
              shape: const CircleBorder(),
              semanticContainer: true,
              elevation: 5,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  userAnswer.questionNumber.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    userAnswer.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    userAnswer.correctAnswer,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 158, 158, 158)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    userAnswer.userAnswer,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 87, 126, 192)),
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
