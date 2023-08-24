import 'package:flutter/material.dart';

class BasicStyledText extends StatelessWidget {
  const BasicStyledText(
    this.text, {
    this.fontSize = 30,
    super.key,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
