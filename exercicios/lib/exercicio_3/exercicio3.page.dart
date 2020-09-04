import 'package:exercicios/exercicio_5/verification.page.dart';
import 'package:flutter/material.dart';

class Exercicio3Page extends StatefulWidget {
  static final routeName = '/register';

  @override
  _Exercicio3PageState createState() => _Exercicio3PageState();
}

class _Exercicio3PageState extends State<Exercicio3Page> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  _register() {
    if (_formKey.currentState.validate()) {
      var printField = (TextEditingController controller, String name) =>
          print('$name: ${controller.value.text}');

      printField(nameController, 'NAME');
      printField(emailController, 'EMAIL');
      printField(numberController, 'NUMBER');
      printField(countryController, 'COUNTRY');
      printField(passwordController, 'PASSWORD');
      printField(referralCodeController, 'REFERRAL CODE');

      Navigator.pushNamed(context, VerificationPage.routeName);
    }
  }

  _validatePassword(value, value2) {
    if (value != value2) {
      return 'Password don`t match';
    }

    return null;
  }

  _clear() {
    _formKey.currentState.reset();
  }

  InputDecoration _getDecoration(String placeholder) {
    return InputDecoration(
        labelText: placeholder,
        labelStyle: TextStyle(fontSize: 18, color: Colors.grey));
  }

  String _validateNotEmptyField(String value) {
    if (value.isEmpty) {
      return 'Please fill this field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: _clear,
            child: Text(
              'Clear',
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 32,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        validator: _validateNotEmptyField,
                        decoration: _getDecoration('Full Name'),
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: _validateNotEmptyField,
                        decoration: _getDecoration('Email Address'),
                      ),
                      TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        validator: _validateNotEmptyField,
                        decoration: _getDecoration('Mobile Number'),
                      ),
                      TextFormField(
                        controller: countryController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        validator: _validateNotEmptyField,
                        decoration: _getDecoration('Country'),
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) => _validatePassword(
                            passwordController.value.text,
                            passwordConfirmationController.value.text),
                        decoration: _getDecoration('Password'),
                      ),
                      TextFormField(
                        controller: passwordConfirmationController,
                        obscureText: true,
                        validator: (value) => _validatePassword(
                            passwordController.value.text,
                            passwordConfirmationController.value.text),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: _getDecoration('Password confirmation'),
                      ),
                      TextFormField(
                        controller: referralCodeController,
                        keyboardType: TextInputType.text,
                        decoration: _getDecoration('Referral Code (optional)'),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          color: Colors.red,
                          textColor: Colors.white,
                          onPressed: _register,
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
