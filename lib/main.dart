import 'package:flutter/material.dart';
import 'package:my_app/gradient_wrapper.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientWrapper(Colors.amber, Color.fromARGB(255, 197, 63, 221)),
    ),
  ));
}
