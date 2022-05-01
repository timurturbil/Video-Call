import 'package:flutter/widgets.dart';
import 'package:videocall/model/store_user.dart';
import 'package:videocall/service/auth.dart';

class UserProvider with ChangeNotifier {
  Userlar _user;
  AuthServices _auth = AuthServices();

  Userlar get getUser => _user;

  void refreshUser() async {
    Userlar user = await _auth.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
