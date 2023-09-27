import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP SMS Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController recipientController = TextEditingController();

  String confirmationMessage = '';
  String otp = '';

  Future<void> sendOTP() async {
    final apiUrl = Uri.parse('https://gateway.excitesms.tech/api/v3/sms/send');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ',
    };

    otp = generateOTP(); // Generate a 6-digit OTP

    final payload = {
      'recipient': recipientController.text,
      'sender_id': 'ExciteSMS',
      'message': 'Your OTP is: $otp',
    };

    final response =
        await http.post(apiUrl, headers: headers, body: jsonEncode(payload));

    if (response.statusCode == 200) {
      setState(() {
        confirmationMessage = 'OTP sent successfully';
      });
    } else {
      setState(() {
        confirmationMessage = 'Error sending OTP';
      });
    }
  }

  String generateOTP() {
    // Generate a 6-digit OTP
    return (100000 + Random().nextInt(900000)).toString();
  }

  Future<void> verifyOTP(String enteredOTP) async {
    if (enteredOTP == otp) {
      setState(() {
        confirmationMessage = 'OTP verified successfully';
      });
    } else {
      setState(() {
        confirmationMessage = 'OTP verification failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP SMS Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Send and Verify OTP using Excite SMS API',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: recipientController,
              decoration: InputDecoration(
                labelText: 'Recipient',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendOTP,
              child: Text('Send OTP'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter OTP',
              ),
              onSubmitted: (value) {
                verifyOTP(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verifyOTP(otp);
              },
              child: Text('Verify OTP'),
            ),
            SizedBox(height: 20),
            Text(
              confirmationMessage,
              style: TextStyle(
                fontSize: 18,
                color: confirmationMessage.contains('failed')
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
