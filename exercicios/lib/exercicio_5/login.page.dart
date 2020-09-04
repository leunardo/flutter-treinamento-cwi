import 'package:exercicios/exercicio_5/home.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  _getContinueWithButton(label, color, icon) {
    return OutlineButton.icon(
      icon: icon,
      onPressed: () {},
      label: Text(label,
          style: TextStyle(
              color: color, fontStyle: FontStyle.italic, fontSize: 18)),
      borderSide: BorderSide(color: color),
      padding: EdgeInsets.all(14),
    );
  }

  _goToHome() {
    if (_formKey.currentState.validate()) {
      Navigator.pushNamed(context, HomePage.routeName,
          arguments: HomePageArguments(email: emailController.value.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login',
                    style:
                        TextStyle(fontSize: 34, fontStyle: FontStyle.italic)),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Adress',
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200,
                      child: CheckboxListTile(
                        title: Text('Remember me'),
                        value: _rememberMe,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.red,
                    padding: EdgeInsets.all(14),
                    onPressed: _goToHome,
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  child: _getContinueWithButton(
                      'Continue with Google', Colors.red, Icon(Icons.phone)),
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  child: _getContinueWithButton('Continue with Facebook',
                      Colors.blue, Icon(Icons.person)),
                ),
                SizedBox(height: 30),
                Center(child: Text('Enter as guest')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
