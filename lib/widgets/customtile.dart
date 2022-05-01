import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videocall/utils/style/colors.dart';
import 'package:videocall/service/auth.dart';
import 'package:videocall/utils/call_utilities.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:videocall/model/store_user.dart';

class CustomTile extends StatefulWidget {
  final Widget leading;
  final Widget title;
  final Widget icon;
  final Widget subtitle;
  final Widget trailing;
  final EdgeInsets margin;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  final Userlar receiver;

  CustomTile({
    @required this.leading,
    @required this.title,
    this.icon,
    @required this.subtitle,
    this.trailing,
    this.margin = const EdgeInsets.all(0),
    this.onTap,
    this.onLongPress,
    this.receiver,
  });

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  ClientRole _role = ClientRole.Broadcaster;
  AuthServices _auth = AuthServices();
  Userlar sender;
  @override
  void initState() {
    super.initState();
    _auth.getCurrentUser().then((user) {
      setState(() {
        sender = Userlar(
          uid: user.uid,
          name: user.displayName,
          profilePhoto: user.photoURL,
        );
      });
    });
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
  }

  //TODO: debug kelimesini ekrandan kaldırıp foto çek.
  //TODO: https://pub.dev/packages/flutter_native_splash ile splash ekle.
  //TODO: uygulama iconunu ve istersen ismini değştir.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.receiver.isLive) {
          await _handleCameraAndMic(Permission.camera);
          await _handleCameraAndMic(Permission.microphone);
          return CallUtils.dial(
            from: sender,
            to: widget.receiver,
            context: context,
            role: _role,
          );
        } else {
          Get.snackbar(
              "Warning", "You can not call the person who is not online.",
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.warning,
                color: whiteOpacity(0.8),
              ),
              snackPosition: SnackPosition.TOP,
              margin: EdgeInsets.all(12),
              colorText: whiteOpacity(0.8));
        }
      },
      child: Container(
        decoration: new BoxDecoration(
            color: greyColor(200),
            borderRadius: new BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(6),
        height: 90,
        margin: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            widget.leading,
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15),
                padding: EdgeInsets.symmetric(vertical: Get.height / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        widget.title,
                        SizedBox(height: 5),
                        widget.subtitle
                      ],
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.videocam_outlined,
                        ),
                        onPressed: () async {
                          if (widget.receiver.isLive) {
                            await _handleCameraAndMic(Permission.camera);
                            await _handleCameraAndMic(Permission.microphone);
                            return CallUtils.dial(
                              from: sender,
                              to: widget.receiver,
                              context: context,
                              role: _role,
                            );
                          } else {
                            Get.snackbar("Warning",
                                "You can not call the person who is not online.",
                                backgroundColor: Colors.red,
                                icon: Icon(
                                  Icons.warning,
                                  color: whiteOpacity(0.8),
                                ),
                                snackPosition: SnackPosition.TOP,
                                margin: EdgeInsets.all(12),
                                colorText: whiteOpacity(0.8));
                          }
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
