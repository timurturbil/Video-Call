
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videocall/utils/loading.dart';
import 'package:videocall/utils/style/decoration.dart';

String _dialogMessage = "Loading...";
enum ProgressDialogType { Normal, Download }

ProgressDialogType _progressDialogType = ProgressDialogType.Normal;
double _progress = 0.0;

bool _isShowing = false;

class ProgressDialog {
  _MyDialog _dialog;

  BuildContext _buildContext, _context;

  ProgressDialog(
      BuildContext buildContext, ProgressDialogType progressDialogtype) {
    _buildContext = buildContext;

    _progressDialogType = progressDialogtype;
  }

  void setMessage(String mess) {
    _dialogMessage = mess;
  }

  void update({double progress, String message}) {
    if (_progressDialogType == ProgressDialogType.Download) {
      _progress = progress;
    }
    _dialogMessage = message;
    _dialog.update();
  }

  bool isShowing() {
    return _isShowing;
  }

  void hide() {
    if (_isShowing) {
      _isShowing = false;
      Navigator.of(_context).pop();
    }
  }

  void show() {
    if (!_isShowing) {
      _dialog = new _MyDialog();
      _isShowing = true;
      showDialog<dynamic>(
        context: _buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          return Dialog(
              insetAnimationCurve: Curves.easeInOut,
              insetAnimationDuration: Duration(milliseconds: 100),
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: _dialog);
        },
      );
    }
  }
}

// ignore: must_be_immutable
class _MyDialog extends StatefulWidget {
  var _dialog = new _MyDialogState();

  update() {
    _dialog.changeState();
  }

  @override
  // ignore: must_be_immutable
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _MyDialogState extends State<_MyDialog> {
  changeState() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _isShowing = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 84.0,
        child: Row(children: <Widget>[
          const SizedBox(width: 15.0),
          SizedBox(
            width: 60.0,
            child: LoadingState(),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: _progressDialogType == ProgressDialogType.Normal
                ? Text(_dialogMessage,
                    textAlign: TextAlign.justify,
                    // style: Styles.progressDialogMessage(22.0, FontWeight.w400)
                    )
                : Stack(
                    children: <Widget>[
                      Positioned(
                        child: Text(_dialogMessage,
                            // style: Styles.progressDialogMessage(
                            //     22.0, FontWeight.w700)
                                ),
                        top: 35.0,
                      ),
                      Positioned(
                        child: Text("$_progress/100",
                            // style: Styles.progressDialogMessage(
                            //     15.0, FontWeight.w400)
                                ),
                        bottom: 15.0,
                        right: 15.0,
                      ),
                    ],
                  ),
          )
        ]));
  }
}
