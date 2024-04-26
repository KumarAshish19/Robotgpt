import 'package:flutter/material.dart';
import 'package:robotgpt/Client.dart';

void main()
{
  runApp(RobotGpt());
}

class RobotGpt extends StatelessWidget {
  const RobotGpt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: clientside(),);
  }
}
