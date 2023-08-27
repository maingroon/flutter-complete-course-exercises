import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function(String answer) onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onTap(answerText);
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 25,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.white,
        ),
      ),
      child: Text(
        answerText,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}
