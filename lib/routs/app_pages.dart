import 'package:get/get.dart';
import 'package:task/ui/screens/auth/login/login_screen.dart';
import 'package:task/ui/screens/auth/signup/signup_screen.dart';
import 'package:task/ui/screens/home/home_root_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.registration,
      page: () => const RegistrationScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeRootScreen(),
    ),
  ];
}
