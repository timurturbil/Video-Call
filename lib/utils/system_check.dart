/* import 'dart:io';

import 'package:Tahsilist/model/system_control.dart';
import 'package:Tahsilist/services/system_control_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class System {
  static Future<void> systemCheck() async {
    String storeUrl;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    int deviceVersion = int.parse(packageInfo.version.replaceAll(".", ""));
    SystemControlRepository.check().then((SystemControl data) {
      if (Platform.isAndroid) {
        storeUrl = data.playStoreUrl;
      } else if (Platform.isIOS) {
        storeUrl = data.appStoreUrl;
      }
      int lastVersion = int.parse(data.version.replaceAll(".", ""));
      if (data.isForceupdate == 1) {
        if (lastVersion > deviceVersion) {
          System().updateDialog(
              "Güncelleme Gerekli",
              "Uygulamanın düzgün çalışabilmesi için uygulamayı güncellemeniz gerekmektedir.",
              "Güncelle", () async {
            if (await canLaunch(storeUrl)) {
              await launch(storeUrl);
            } else {
              throw storeUrl;
            }
          });
        } else {
          print("the app already updated");
        }
      }
      if (data.isMaintenance == 1) {
        System().updateDialog(
            "Bakım",
            "Size daha iyi hizmet verebilmek için geçici olarak bakımdayız. Kısa zamanda düzelecektir. :)",
            "Tamam", () async {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        });
      }
    });
  }

  void updateDialog(title, description, butonText, Function function) {
    Get.defaultDialog(
      title: title,
      radius: 5.0,
      middleText: description,
      barrierDismissible: false,
      actions: [
        RaisedButton(
          onPressed: () async {
            await function();
          },
          child: Text(
            butonText,
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.black,
        )
      ],
    );
  }
}
 */