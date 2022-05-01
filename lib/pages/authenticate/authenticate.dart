import 'package:flutter/material.dart';
import 'package:videocall/pages/authenticate/sign_up.dart';
import 'package:videocall/pages/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  final bool isregistered;

  const Authenticate({Key key, this.isregistered}) : super(key: key);
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isregistered = false;

  @override
  void initState() {
    super.initState();
    isregistered = widget.isregistered;
  }

  void toggleView() {
    setState(() => isregistered = !isregistered);
  }

  @override
  Widget build(BuildContext context) {
    if (isregistered) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
