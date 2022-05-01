/* import 'package:get/get.dart';

class GetxRouteController extends GetxController {
  String route = "/LoginPage";
  String currentRoute = "MainCustomerHomePage";
  
  setNewRoute(String newRoute) {
    route += "/" + newRoute;
    currentRoute = newRoute;
    update();
  }

  deletePreviousRoute() {
    if (route != "") {
      List<String> splitedRoute = route.split("/");
      currentRoute = splitedRoute[splitedRoute.length - 2];
      splitedRoute.removeLast();
      route = splitedRoute.join('/');
    }
    update();
  }

  deleteAllRoute() {
    route = "";
    update();
  }
}
 */