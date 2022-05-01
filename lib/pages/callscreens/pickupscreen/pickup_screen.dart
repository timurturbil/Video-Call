import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:videocall/model/call_model.dart';
import 'package:videocall/service/call_methods.dart';
import 'package:videocall/pages/callscreens/main_call_screen.dart';
import 'package:videocall/widgets/cached_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:videocall/pages/home_screen.dart';
import 'package:videocall/model/store_user.dart';

class PickupScreen extends StatefulWidget {
  final Call call;

  PickupScreen({this.call});

  @override
  _PickupScreenState createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  final CallMethods callMethods = CallMethods();

  ClientRole _role = ClientRole.Broadcaster;

  Userlar sender;

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Incoming...",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 50),
              CachedImage(
                widget.call.callerPic,
                isRound: true,
                radius: 180,
              ),
              SizedBox(height: 15),
              Text(
                widget.call.callerName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.call_end),
                    color: Colors.redAccent,
                    onPressed: () async {
                      await callMethods.endCall(call: widget.call);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                  ),
                  SizedBox(width: 25),
                  IconButton(
                      icon: Icon(Icons.call),
                      color: Colors.green,
                      onPressed: () async {
                        await _handleCameraAndMic(Permission.camera);
                        await _handleCameraAndMic(Permission.microphone);
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainCallScreen(
                              call: widget.call,
                              role: _role,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
