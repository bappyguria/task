import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/routs/app_routes.dart';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  String? selectedDivision;
  String? selectedDistrict;
  String? selectedUpazila;

  bool isLoading = false;

  void setDivision(String? value) {
    selectedDivision = value;
    update();
  }

  void setDistrict(String? value) {
    selectedDistrict = value;
    update();
  }

  void setUpazila(String? value) {
    selectedUpazila = value;
    update();
  }

  void register() async {
    if (!formKey.currentState!.validate()) return;

    isLoading = true;
    update();

    // 🔹 fake API delay
    await Future.delayed(const Duration(seconds: 1));

    isLoading = false;
    update();

    Get.snackbar(
      'Success',
      'Registration successful',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(AppRoutes.login);
  }

  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
