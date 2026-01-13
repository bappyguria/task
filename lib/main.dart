import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/binding/app_binding.dart';
import 'package:task/core/theme/app_theme.dart';
import 'package:task/routs/app_pages.dart';
import 'package:task/routs/app_routes.dart';

void main() {
  runApp(const AppDashbordApp());
}

class AppDashbordApp extends StatelessWidget {
  const AppDashbordApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CP Contact Farming',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      smartManagement: SmartManagement.full,
    );
  }
}
