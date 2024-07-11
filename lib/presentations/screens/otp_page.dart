import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  final String phoneNumber;

  OTPPage({required this.phoneNumber});

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _validateOTP() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simulate a network call
    await Future.delayed(Duration(seconds: 2));

    // Replace this with your actual OTP validation logic
    bool isValid = _otpController.text == "123456";

    setState(() {
      _isLoading = false;
      if (isValid) {
        // Navigate to the next page or show success message
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _errorMessage = "Invalid OTP. Please try again.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone Number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the OTP sent to ${widget.phoneNumber}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OTP',
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _validateOTP,
                    child: Text('Verify'),
                  ),
          ],
        ),
      ),
    );
  }
}
