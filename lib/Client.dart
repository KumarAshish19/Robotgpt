import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:read_pdf_text/read_pdf_text.dart';

class clientside extends StatefulWidget {
  const clientside({super.key});

  @override
  State<clientside> createState() => _clientsideState();
}

class _clientsideState extends State<clientside> {
  var screensize;
  String? doctext;
  String? extractedtextfromdb;
  String filepath = "";

  Future<void> sendTextToAPI() async {
      // Define the API endpoint URL
      final String apiUrl = 'https://1e30-103-4-220-252.ngrok-free.app/evaluate';


      try {
        // Make a POST request with the text string as the body
        final http.Response response = await http.post(
          Uri.parse(apiUrl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'role': 'security guard watchman',
            'information': '''${doctext!}''',
          }),
        );

        // Check if the request was successful (status code 200)
        if (response.statusCode == 200) {
          // Handle successful response
          print('Text sent successfully');
          var data = jsonDecode(response.body);
          print(data);
        } else {
          // Handle other response codes (e.g., error)
          print('Failed to send text. Status code: ${response.statusCode}');
        }
      } catch (e) {
        // Handle network or other errors
        print('Error sending text: $e');
      }
    }


    Future<String> getPDFtext(String path) async {
    try {
      doctext = await ReadPdfText.getPDFtext(path);
    } on PlatformException {
      print('Failed to get PDF text.');
    }
    setState(() {});
    return doctext!;
  }


  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              child: Column(children: [
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
                    "RoboHire!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent
                    ),
                  ),
                ),

              ],) ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                  onTap: () async {
                    var res = await FilePicker.platform.pickFiles();
                    if (res != null) {
                      filepath = res.files.first.path!;
                      setState(() {});
                    }

                  },
                  child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.lightBlueAccent),borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Icon(
                            Icons.upload_file,
                            size: 50,
                          ))))),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: (){
            getPDFtext(filepath);
          }, child: Text("Get Text")),

          Container(
            child: Text("${doctext}"),
          ),

          ElevatedButton(onPressed: sendTextToAPI, child: Text("Send Text")),
          // Padding(padding: EdgeInsets.all(15),child: SingleChildScrollView(child: Container(height: 100,width: double.infinity,child: Text(${doctext}),),)),
        ],
      ),)
    ));
  }
}
