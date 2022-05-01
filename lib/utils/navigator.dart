//import 'package:Tahsilist/utils/getx_route_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Nav {
  static route(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => screen,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 280),
      ),
    );
  }

  static pop(BuildContext context) {
    //final GetxRouteController routeController = Get.find<GetxRouteController>();
    //routeController.deletePreviousRoute();
    Navigator.pop(context);
  }

  static offAll(BuildContext context, Widget screen, String screenName) async {
    //final GetxRouteController routeController = Get.find<GetxRouteController>();
    //routeController.deleteAllRoute();
    //routeController.setNewRoute(screenName);
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => screen,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 280),
      ),
    );
  }

  static offAllWithoutContext(Widget screen, String screenName) {
    // bu fonksiyonu bottom navigator bar'ı artık kullanmak istemediğimiz zaman, ekrandan kaldırmak için çalıştırıyoruz.
    //final GetxRouteController routeController = Get.find<GetxRouteController>();
    //routeController.deleteAllRoute();
    //routeController.setNewRoute(screenName);
    Get.offAll(screen);
  }

  static routeReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}
