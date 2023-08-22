import 'package:flutter/material.dart';
// import 'package:my_app/styled_text.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientWrapper extends StatelessWidget {
  const GradientWrapper(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment, end: endAlignment, colors: [color1, color2]),
      ),
      child: Center(
        // child: StyledText('Hey there, Jane Doe'),
        child: Image.asset(
          'assets/images/dice-1.png',
          width: 170,
        ),
      ),
    );
  }
}
