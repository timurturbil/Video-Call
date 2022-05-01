
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:videocall/utils/style/colors.dart';

class LoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitPulse(
        size: 48,
        color: mainColor,
      ),
    );
  }
}
