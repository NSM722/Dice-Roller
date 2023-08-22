import 'package:flutter/material.dart';
import 'package:my_app/styled_text.dart';

var beginAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientWrapper extends StatelessWidget {
  const GradientWrapper({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: const [Colors.amber, Color.fromARGB(255, 197, 63, 221)]),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
