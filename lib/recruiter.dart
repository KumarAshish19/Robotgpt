import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding/decoding

class ResponseDisplayScreen extends StatefulWidget {
  final String response;

  const ResponseDisplayScreen({Key? key, required this.response})
      : super(key: key);

  @override
  _ResponseDisplayScreenState createState() => _ResponseDisplayScreenState();
}

class _ResponseDisplayScreenState extends State<ResponseDisplayScreen> {
  TextEditingController _phoneController = TextEditingController();

  static const String callBaseUrl = 'https://api.bland.ai/v1/calls';

  @override
  Widget build(BuildContext context) {
    List<String> paragraphs = widget.response.split('\n\n');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Good Morning',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text('Shinjan !',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff235543))),
                ],
              ),
              Spacer(),
              CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png')),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...paragraphs
                .map((paragraph) => buildParagraph(paragraph))
                .toList(),
            _buildCallSection(),
            _buildMailSection(),
          ],
        ),
      ),
    );
  }

  Widget buildParagraph(String paragraph) {
    if (paragraph.startsWith('###')) {
      return Padding(
          padding: EdgeInsets.all(5.0),
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff4F6F52),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Text(paragraph.substring(4),
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffE8DFCA))),
              ),
            ),
          ));
    } else if (paragraph.contains('-')) {
      List<String> items = paragraph.split('\n');
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) => buildListItem(item)).toList());
    }
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Text(paragraph, style: TextStyle(fontSize: 16, height: 1.5)));
  }

  Widget buildListItem(String item) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        child: Text(item, style: TextStyle(fontSize: 16)));
  }

  Widget _buildCallSection() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffAED7C5), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Initiate Hire.ai initiated interview",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff235543))),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Write Phone No. to call',
                          labelStyle:
                              TextStyle(color: Color(0xff235543), fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff235543)),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.phone_forwarded),
                    color: Color(0xff235543),
                    onPressed: () => makePhoneCall(_phoneController.text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMailSection() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffAED7C5), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Automatic Mail for selected candidates",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff235543))),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Write Email ID to send',
                          labelStyle:
                              TextStyle(color: Color(0xff235543), fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff235543)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.phone_forwarded),
                    color: Color(0xff235543),
                    onPressed: () => makePhoneCall(_phoneController.text),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final payload = {
      "phone_number": "+916267702526",
      "task": """The main objective of this phone interview is to gather 
        additional information about the candidate who has been shortlisted 
        based on their resume. The goal is to assess the candidate's 
        qualifications, experiences, and overall suitability for the job role.Only ask 3 or minimal questions. If the user asks anything related to the 
        company or the job role, simply say that the the organisation is a AI based consultancy firm having us based clients. Dont dive deeper into questions. 
        Simply ask and move on""",
      "first_sentence": """Hello, I'm calling from Hire.AI regarding
          the application you expressed interest in. Could you 
          confirm if this is a convenient time to speak?""",
      "wait_for_greeting": true,
      "model": "base",
      "tools": [],
      "record": true,
      "voice_settings": {},
      "language": "eng",
      "answered_by_enabled": true,
      "temperature": 0,
      "amd": false,
    };
    final headers = {
      "authorization":
          "sk-zkic20236xlh90oguo8fek0aclmpnrv0t8youl8yc8lt0lkvnniffsmzlyd8yhul69",
      "Content-Type": "application/json",
    };

    try {
      final response = await http.post(
        Uri.parse(callBaseUrl),
        headers: headers,
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        print('Call initiated: ${json.decode(response.body)['message']}');
      } else {
        print(
            'Failed to make call with status code: ${response.statusCode} and message: ${json.decode(response.body)['message']}');
      }
    } catch (e) {
      print('Error making call: $e');
    }
  }
}
