import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState(); // execute the DiceRollerState
  }
}

// private class only for use in this file
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    setState(
      () {
        currentDiceImage = 'assets/images/dice-3.png';
      },
    );
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // centers the dice vertically
      children: [
        Image.asset(
          currentDiceImage,
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
