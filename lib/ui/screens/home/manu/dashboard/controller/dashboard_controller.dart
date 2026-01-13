import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:task/model/stat_item_model.dart';

class DashboardController extends GetxController {
  int currentSlide = 0;

  final List<String> sliderImages = [
    'https://img.freepik.com/free-photo/website-hosting-concept-with-bright-light_23-2149406783.jpg?semt=ais_hybrid&w=740&q=80',
    'https://thumbs.dreamstime.com/b/consultant-presenting-tag-cloud-information-technology-213591032.jpg',
    'https://media.istockphoto.com/id/1830042746/photo/document-management-system-dms-with-arrange-folder-and-files-icons-man-setup-storage-backup.jpg',
  ];

  final List<StatItem> dashboardStatsData = [
    StatItem(
      title: 'Total Khamari',
      value: '120',
      icon: Icons.people,
      color: Colors.red,
      progress: 70,
      subtitle: '20 Unactive',
    ),
    StatItem(
      title: 'Total Batch',
      value: '45',
      icon: Icons.layers,
      color: Colors.green,
      progress: 45,
      subtitle: '40 Today running',
    ),
    StatItem(
      title: 'Total Purchase',
      value: '8500',
      icon: Icons.shopping_cart,
      color: Colors.purple,
      progress: 80,
      subtitle: 'Monthly target 80%',
    ),
    StatItem(
      title: 'Total Sales',
      value: '10000',
      icon: Icons.receipt_long,
      color: Colors.blue,
      progress: 35,
      subtitle: 'Sales to khamari',
    ),
    StatItem(
      title: 'Sales Due',
      value: '2000',
      icon: Icons.attach_money,
      color: Colors.orange,
      progress: 25,
      subtitle: 'Receivable from khamari',
    ),
    StatItem(
      title: 'Profit/Loss',
      value: '1500',
      icon: Icons.trending_up,
      color: Colors.teal,
      progress: 65,
      subtitle: 'Net Margin 15%',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _startAutoSlider();
  }

  void _startAutoSlider() {
    Future.delayed(const Duration(seconds: 3), () {
      currentSlide = (currentSlide + 1) % sliderImages.length;
      update();
      _startAutoSlider();
    });
  }
}
