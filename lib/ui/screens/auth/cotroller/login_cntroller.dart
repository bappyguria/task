import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/routs/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isLodding = false;

  bool rememberMe = false;

  void toggleRemember(bool value) {
    rememberMe = value;
    update();
  }

  void login() async {
  isLodding = true;
  update();

  if (!formKey.currentState!.validate()) {
    isLodding = false;
    update();

    Get.snackbar(
      'Error',
      'Please fill all required fields',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }


  await Future.delayed(const Duration(seconds: 1));

  isLodding = false;
  update();

  Get.snackbar(
    'Success',
    'Login successful',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
  );


  await Future.delayed(const Duration(seconds: 2));

  Get.offAllNamed(AppRoutes.home);
}

  void goToSignup() {
    Get.offAllNamed(AppRoutes.registration);
  }
}
