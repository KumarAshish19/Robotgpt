import 'package:flutter/material.dart';
import 'package:robotgpt/Client.dart';

void main()
{
  runApp(robotgpt());
}

class robotgpt extends StatelessWidget {
  const robotgpt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: clientside(),);
  }
}
