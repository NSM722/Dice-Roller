import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return const Text(
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
        'Hey Jane Doe!');
  }
}
