import 'package:basics/dice_roller.dart';
import 'package:flutter/material.dart';

class BasicGradientContainer extends StatelessWidget {
  const BasicGradientContainer(this.colors, {super.key});

  BasicGradientContainer.dark({super.key})
      : colors = [
          Colors.black,
          Colors.black87,
          Colors.black,
        ];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
