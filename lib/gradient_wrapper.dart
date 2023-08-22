import 'package:flutter/material.dart';
import 'package:my_app/styled_text.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientWrapper extends StatelessWidget {
  const GradientWrapper({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: [Colors.amber, Color.fromARGB(255, 197, 63, 221)]),
      ),
      child: const Center(
        child: StyledText('Hey there, Jane Doe'),
      ),
    );
  }
}
