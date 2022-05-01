import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:videocall/model/call_model.dart';
import 'package:videocall/model/store_user.dart';
import 'package:videocall/service/call_methods.dart';
import 'package:videocall/pages/callscreens/main_call_screen.dart';
import 'dart:math';

class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({
    Userlar from,
    Userlar to,
    context,
    ClientRole role,
  }) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.name,
      callerPic: from.profilePhoto,
      callerRole: role.toString(),
      receiverId: to.uid,
      receiverName: to.name,
      receiverPic: to.profilePhoto,
      receiverRole: role.toString(),
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainCallScreen(
              call: call,
              role: role,
            ),
          ));
    }
  }
}
