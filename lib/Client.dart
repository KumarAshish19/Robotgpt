import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:read_pdf_text/read_pdf_text.dart';
import 'package:robotgpt/recruiter.dart';

class clientside extends StatefulWidget {
  const clientside({super.key});

  @override
  State<clientside> createState() => _clientsideState();
}

class _clientsideState extends State<clientside> {
  var screensize;
  String? doctext;
  String filepath = "";

  Future<void> sendTextToAPI() async {
    final String apiUrl = 'https://1e30-103-4-220-252.ngrok-free.app/evaluate';
    print('Sending text to API: $apiUrl');
    print('Headers: Content-Type: application/json');
    print('Body: Role: security guard watchman, Information: $doctext');
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'role': 'security guard watchman',
          'information': doctext!,
        }),
      );

      print('Response Status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Text sent successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResponseDisplayScreen(response: response.body)),
        );
        try {
          var data = jsonDecode(response.body);
          print('Response Data: $data');
        } catch (e) {
          print('Error decoding response: $e');
          print('Raw response body: ${response.body}');
        }
      } else {
        print('Failed to send text. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error sending text: $e');
    }
  }

  Future<String> getPDFtext(String path) async {
    print('Getting text from PDF at path: $path');
    try {
      doctext = await ReadPdfText.getPDFtext(path);
      print('Extracted text: $doctext');
    } on PlatformException {
      print('Failed to get PDF text.');
    }
    setState(() {});
    return doctext!;
  }

  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        "Welcome to ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Hire.ai!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4F6F52)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () async {
                    var res = await FilePicker.platform.pickFiles();
                    if (res != null) {
                      filepath = res.files.first.path!;
                      print('File picked: $filepath');
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Color(0xff4F6F52)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Icon(
                        Icons.upload_file,
                        color: Color(0xff4F6F52),
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  getPDFtext(filepath);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff5F8670)), // Custom color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Text color
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10)), // Button padding
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold) // Text style
                        ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ))),
                child: Text("Get Text"),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 10), // Adds space around the text
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff4F6F52),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(doctext ?? 'No text extracted yet.',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffE8DFCA),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: sendTextToAPI,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff4F6F52)), // Custom color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Color(0xffE8DFCA)), // Text color
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10)), // Button padding
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold) // Text style
                        ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ))),
                child: Text(
                  "Send Text",
                  style: TextStyle(color: Color(0xffE8DFCA)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
