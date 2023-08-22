import 'package:flutter/material.dart';
import 'dart:math';

final randomizeDiceRolls =
    Random(); // for optimal reasons this is initialized here

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState(); // execute the DiceRollerState
  }
}

// private class only for use in this file
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 3;

  void rollDice() {
    setState(
      () {
        currentDiceRoll = randomizeDiceRolls.nextInt(6) +
            1; // generates numbers between 1 and 6
      },
    );
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // centers the dice vertically
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png', // inject the state value
          width: 170,
        ),
        const SizedBox(height: 20),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 24)),
            child: const Text('Roll Dice'))
      ],
    );
  }
}
