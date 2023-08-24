import 'package:basics/basic_styled_text.dart';
import 'package:flutter/material.dart';

import 'package:basics/basic_gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const BasicStyledText(
            'DICE ROLLER 3000',
            fontSize: 25,
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: BasicGradientContainer.dark(),
      ),
    ),
  );
}
