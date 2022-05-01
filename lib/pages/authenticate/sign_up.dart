import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocall/service/auth.dart';
import 'package:videocall/model/store_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:videocall/pages/authenticate/onboarding_screen.dart';
import 'package:videocall/utils/style/colors.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appBar(),
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Divider(height: 0),
                SizedBox(height: 20.0),
                Divider(height: 0),
                textFormFielForName(),
                Divider(height: 0),
                SizedBox(height: Get.width / 40),
                Divider(height: 0),
                textFormFielForEmail(),
                Divider(height: 0),
                SizedBox(height: Get.width / 40),
                Divider(height: 0),
                textFormFielForPassword(),
                Divider(height: 0),
                SizedBox(height: Get.width / 40),
                Divider(height: 0),
                textFormFielForConfirmPassword(),
                Divider(height: 0),
                SizedBox(height: 20.0),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: AutoSizeText(
                        "You accepts privacy contract by pressing 'Sign up'. You can change your mind later.")),
                SizedBox(height: 20.0),
                signUpButton(),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container signUpButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              dynamic result = await _auth.registerWithEmailandPassaword(
                  email, password, name);
              if (result == null) {
                setState(() {
                  error = 'Please supply a valid email';
                });
              }
            }
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.blue[800],
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16.0),
              )),
          child: Container(
            alignment: Alignment.center,
            width: Get.width,
            padding: EdgeInsets.only(right: 45, left: 45, top: 15, bottom: 15),
            child: Text(
              "Sign Up",
              style: TextStyle(color: whiteColor),
            ),
          )),
    );
  }

  TextFormField textFormFielForConfirmPassword() {
    return TextFormField(
      obscureText: true,
      validator: (val) =>
          val.length < 6 ? 'Enter a password 6+ chars long' : null,
      onChanged: (val) {
        setState(() => password = val);
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Confirm Password',
      ),
    );
  }

  TextFormField textFormFielForPassword() {
    return TextFormField(
      obscureText: true,
      validator: (val) =>
          val.length < 6 ? 'Enter a password 6+ chars long' : null,
      onChanged: (val) {
        setState(() => password = val);
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Password',
      ),
    );
  }

  TextFormField textFormFielForEmail() {
    return TextFormField(
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() => email = val);
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Email Adress',
      ),
    );
  }

  TextFormField textFormFielForName() {
    return TextFormField(
      validator: (val) => val.isEmpty ? 'Enter a name' : null,
      onChanged: (val) {
        setState(() => name = val);
      },
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: 'Name',
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          padding: const EdgeInsets.all(14.0),
          alignment: Alignment.centerLeft,
          color: mainColor,
          onPressed: () {
            Get.to(OnboardingPage());
          },
          icon: Icon(Icons.arrow_back_ios)),
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                widget.toggleView();
              },
              child: Text("Sign In",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue[800]))),
        ],
      ),
      leadingWidth: 85,
    );
  }
}
