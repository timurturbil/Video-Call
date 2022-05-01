import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocall/model/user.dart';
import 'package:videocall/pages/home_screen.dart';
import 'package:videocall/service/auth.dart';
import 'package:videocall/service/firebase_methods.dart';
import 'package:videocall/pages/authenticate/onboarding_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  AuthServices _auth = AuthServices();
  FirebaseMethods _firebaseMethods = FirebaseMethods();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    // return either the Home or Authenticate widget
    
    if (user == null) {
      return OnboardingPage();
    } else {
      return FutureBuilder(
          future: _firebaseMethods.getCurrentUser(),
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              _auth
                  .addDataToDb(
                    user: snapshot.data,
                  )
                  .then((value) => Get.to(() => HomeScreen()));
              return Container();
            } else if (snapshot.hasError) {
              return Container(child: Center(child: Text("hass error")));
            } else {
              return Container(child: CircularProgressIndicator());
            }
          });
    }
  }
}
