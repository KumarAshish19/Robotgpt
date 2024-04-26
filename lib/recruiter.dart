import 'package:flutter/material.dart';

class ResponseDisplayScreen extends StatelessWidget {
  final String response;

  const ResponseDisplayScreen({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Response"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(response, style: TextStyle(fontSize: 16, height: 1.5)),
      ),
    );
  }
}
