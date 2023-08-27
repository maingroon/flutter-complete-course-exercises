import 'package:adv_basics/models/quiz_user_answer.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.userAnswers, {super.key});

  final List<QuizUserAnswer> userAnswers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: userAnswers.map((userAnswer) {
            return QuestionSummary(userAnswer);
          }).toList(),
        ),
      ),
    );
  }
}
