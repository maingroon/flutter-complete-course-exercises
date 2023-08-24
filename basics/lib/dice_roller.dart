import 'dart:math';

import 'package:basics/basic_styled_text.dart';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  static final randomizer = Random();
  static int _getRandomDiceNumber() {
    return randomizer.nextInt(6) + 1;
  }

  int currentDiceRoll = _getRandomDiceNumber();

  void rollDice() {
    setState(() {
      currentDiceRoll = _getRandomDiceNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(
          height: 10,
        ),
        OutlinedButton(
          onPressed: rollDice,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            side: const BorderSide(
              width: 2.5,
              color: Colors.white,
            ),
            foregroundColor: Colors.white,
          ),
          child: const BasicStyledText('Roll Dice'),
        )
      ],
    );
  }
}
