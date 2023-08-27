import 'package:adv_basics/models/quiz_user_answer.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.userAnswers,
    required this.onRestartQuiz,
  });

  final List<QuizUserAnswer> userAnswers;
  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    final int answersCount = userAnswers.length;
    final int correctAnswersCount = userAnswers.where((userAnswer) {
      return userAnswer.isCorrect();
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswersCount out of $answersCount questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            QuestionsSummary(userAnswers),
            const SizedBox(height: 40),
            OutlinedButton.icon(
              onPressed: onRestartQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(9),
                side: const BorderSide(
                  color: Colors.white,
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
