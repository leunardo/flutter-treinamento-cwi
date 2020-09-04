import 'package:exercicios/exercicio_5/login.page.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class VerificationPage extends StatefulWidget {
  static const routeName = '/verification';

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController pinController = TextEditingController();

  _goToLogin() {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification',
                style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                  'a four digit verification code has been sent to your mobile number',
                  style: TextStyle(fontSize: 17)),
              SizedBox(height: 40),
              PinInputTextFormField(
                controller: pinController,
                pinLength: 4,
                decoration: UnderlineDecoration(
                    color: Colors.red,
                    textStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 32,
                        color: Colors.black)),
                autoFocus: true,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton(
                  color: Colors.red,
                  onPressed: _goToLogin,
                  child: Text('Verify',
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                ),
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    'Resend',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
