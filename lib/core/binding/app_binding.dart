import 'package:get/get.dart';
import 'package:task/ui/screens/auth/cotroller/login_cntroller.dart';
import 'package:task/ui/screens/auth/cotroller/regstsion_controller.dart';
import 'package:task/ui/screens/home/controller/home_controller.dart';
import 'package:task/ui/screens/home/manu/dashboard/controller/dashboard_controller.dart';


class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(RegistrationController());
    Get.put(HomeController());
    Get.put(DashboardController());
    
  }
}
