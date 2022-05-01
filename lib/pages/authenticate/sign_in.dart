import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:videocall/service/auth.dart';
import 'package:videocall/pages/authenticate/onboarding_screen.dart';
import 'package:videocall/utils/style/colors.dart';

/* import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger; */
class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: appBarMethod(),
        body: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Divider(height: 0),
                  SizedBox(height: 20.0),
                  Divider(height: 0),
                  TextFormField(
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
                  ),
                  Divider(height: 0),
                  SizedBox(height: Get.width / 40),
                  Divider(height: 0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
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
                  ),
                  Divider(height: 0),
                  SizedBox(height: Get.width / 15),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.signInWithEmailandPassaword(
                                        email.trim(), password.toString());
                                if (result == null) {
                                  setState(() {
                                    error =
                                        "could not sign in with those credentialsss";
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
                              padding: EdgeInsets.only(
                                  right: 45, left: 45, top: 15, bottom: 15),
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: whiteColor),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await _auth.signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(16.0),
                                )),
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.only(
                                  right: Get.width / 7, top: 15, bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                      width: 25,
                                      height: 25,
                                      image: AssetImage(
                                          'assets/images/real_google_icon.png')),
                                  Container(
                                    alignment: Alignment.center,
                                    width: Get.width / 1.92,
                                    child: Text(
                                      "Sign In with Google",
                                      style: TextStyle(
                                          color: blackColor.withOpacity(0.8)),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                     
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  AppBar appBarMethod() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: TextButton(
          onPressed: () {
            Get.to(OnboardingPage());
          },
          child: Text("Cancel",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue[800]))),
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                /* Get.to(Authenticate(isregistered: false)); */
                widget.toggleView();
              },
              child: Text("Sign Up",
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
