import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocall/pages/callscreens/quick_call_screen.dart';
import 'package:videocall/utils/settings.dart';
import 'package:videocall/utils/style/colors.dart';

class JoinMeetingPage extends StatefulWidget {
  const JoinMeetingPage({Key key}) : super(key: key);

  @override
  _JoinMeetingPageState createState() => _JoinMeetingPageState();
}

class _JoinMeetingPageState extends State<JoinMeetingPage> {
  TextEditingController meetingIdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool joinWithId = true;
  final _formKey = GlobalKey<FormState>();
  RtcEngine _engine;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await _initAgoraRtcEngine();
    await _engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(APP_ID);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(ClientRole.Broadcaster);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: appBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Divider(height: 0),
              SizedBox(height: 20.0),
              Divider(height: 0),
              TextFormField(
                controller: meetingIdController,
                validator: (val) => val.isEmpty
                    ? joinWithId
                        ? "Join with a personal link"
                        : "Join with meeting ID"
                    : null,
                onChanged: (val) {
                  setState(() {});
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Join with meeting ID",
                ),
              ),
              Divider(height: 0),
              SizedBox(height: Get.width / 40),
              Divider(height: 0),
              TextFormField(
                controller: nameController,
                validator: (val) => val.isEmpty ? 'Enter name' : null,
                onChanged: (val) {
                  setState(() {});
                },
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name and Surname',
                ),
              ),
              Divider(height: 0),
              SizedBox(height: 20.0),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20), //538
                  child: AutoSizeText(
                      "You accepts privacy contract by pressing 'Join'. You can change your mind later.")),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                    onPressed: () async {
                      await _engine.joinChannel(
                          null, meetingIdController.text, null, 0);
                      Get.to(() => QuickCallScreen(
                            rtcEngine: _engine,
                            userName: nameController.text,
                          ));
                      // if (_formKey.currentState.validate()) {
                      //   // dynamic result =
                      //   //     await _auth.registerWithEmailandPassaword(email, password);
                      //   // if (result == null) {
                      //   //   setState(() {
                      //   //     error = 'Please supply a valid email';
                      //   //   });
                      //   // }
                      // }
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
                        "Join",
                        style: TextStyle(color: whiteColor),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: TextButton(
          onPressed: () {
            Get.back();
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
          Text("Join a meeting",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: blackColor)),
          SizedBox(
            width: Get.width / 4,
          )
        ],
      ),
      leadingWidth: 85,
    );
  }

  items(RtcEngine engine) => <Widget>[
        Divider(height: 0),
        SizedBox(height: 20.0),
        Divider(height: 0),
        TextFormField(
          controller: meetingIdController,
          validator: (val) => val.isEmpty
              ? joinWithId
                  ? "Join with a personal link"
                  : "Join with meeting ID"
              : null,
          onChanged: (val) {
            setState(() {});
          },
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            hintText: "Join with meeting ID",
          ),
        ),
        Divider(height: 0),
        SizedBox(height: Get.width / 40),
        Divider(height: 0),
        TextFormField(
          validator: (val) => val.isEmpty ? 'Enter name' : null,
          onChanged: (val) {},
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            hintText: 'Name and Surname',
          ),
        ),
        Divider(height: 0),
        SizedBox(height: 20.0),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: AutoSizeText(
                "You accepts privacy contract by pressing 'Join'. You can change your mind later.")),
        SizedBox(height: 20.0),
        signUpButton(_formKey, engine, meetingIdController.text)
      ];
}

Container signUpButton(_formKey, RtcEngine engine, String channelId) {
  //502
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20),
    child: ElevatedButton(
        onPressed: () async {
          await engine.joinChannel(null, channelId, null, 0);
          // if (_formKey.currentState.validate()) {
          //   // dynamic result =
          //   //     await _auth.registerWithEmailandPassaword(email, password);
          //   // if (result == null) {
          //   //   setState(() {
          //   //     error = 'Please supply a valid email';
          //   //   });
          //   // }
          // }
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
            "Join",
            style: TextStyle(color: whiteColor),
          ),
        )),
  );
}
