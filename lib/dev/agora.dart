// import 'dart:async';

// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:videocall/utils/settings.dart';

// const appId = APP_ID;
// const token = TOKEN;
// const channel = 'View-Conference-App';


// class AgoraScreen extends StatefulWidget {
//   @override
//   _AgoraScreenState createState() => _AgoraScreenState();
// }

// class _AgoraScreenState extends State<AgoraScreen> {
//   int _remoteUid;
//   bool _localUserJoined = false;
//   RtcEngine _engine;

//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }

//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();

//     //create the engine
//     _engine = await RtcEngine.create(appId);
//     await _engine.enableVideo();
//     _engine.setEventHandler(
//       RtcEngineEventHandler(
//         joinChannelSuccess: (String channel, int uid, int elapsed) {
//           print("local user $uid joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         userJoined: (int uid, int elapsed) {
//           print("remote user $uid joined");
//           setState(() {
//             _remoteUid = uid;
//           });
//         },
//         userOffline: (int uid, UserOfflineReason reason) {
//           print("remote user $uid left channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//       ),
//     );

//     await _engine.joinChannel(token, channel, null, 0);
//   }

//   // Create UI with local view and remote view
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agora Video Call'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: _remoteVideo(),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               width: 100,
//               height: 150,
//               child: Center(
//                 child: _localUserJoined
//                   ? RtcLocalView.SurfaceView()
//                   : CircularProgressIndicator(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     // clear users
//     // _users.clear();
//     // destroy sdk
//     _engine.leaveChannel();
//     _engine.destroy();

//     // callStreamSubscription.cancel();
//     super.dispose();
//   }
//   // Display remote user's video
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return RtcRemoteView.SurfaceView(
//         uid: _remoteUid,
//         channelId: channel,
//       );
//     } else {
//       return Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }
// }