import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/screens/home/controller/home_controller.dart';
import 'package:task/ui/screens/home/widget/home_app_bar.dart';
import 'package:task/ui/screens/home/manu/dashboard/dash_bord_screen.dart';
import 'package:task/ui/screens/home/manu/student/student_screen.dart';


class HomeRootScreen extends StatelessWidget {
  const HomeRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    final pages = [
      DashboardScreen(),
      StudentsListScreen(),
    ];

    return GetBuilder<HomeController>(
      builder: (c) {
        return Scaffold(
          appBar: HomeAppBar(
            showBack: c.currentIndex != 0,
            onBackTap: () {
              c.changePage(0);
            },
            onMenuTap: () {
              _showTopDialog(context, c);
            },
            onNotificationTap: () {},
            onCartTap: () {},
            onProfileTap: () {},
            onLogoutTap: () {},
          ),
          body: pages[c.currentIndex],
        );
      },
    );
  }

  /// 🔹 MENU DIALOG
  void _showTopDialog(BuildContext context, HomeController controller) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70, left: 16, right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 220,
                        child: GridView.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 12,
                          children: [
                            _menuGridItem(
                              () {
                                Get.back();
                                controller.changePage(0);
                              },
                              Icons.dashboard,
                              'Dashboard',
                            ),
                            _menuGridItem(
                              () {
                                Get.back();
                                controller.changePage(1);
                              },
                              Icons.star_rounded,
                              'Student',
                            ),
                            _menuGridItem(
                              () => Get.back(),
                              Icons.attach_money,
                              'Three',
                            ),
                            _menuGridItem(
                              () => Get.back(),
                              Icons.person,
                              'Four',
                            ),
                            _menuGridItem(
                              () => Get.back(),
                              Icons.layers,
                              'Five',
                            ),
                            _menuGridItem(
                              () => Get.back(),
                              Icons.store,
                              'Six',
                            ),
                            _menuGridItem(
                              () => Get.back(),
                              Icons.category,
                              'Seven',
                            ),
                            _menuGridItem(
                              () => Get.back(),
                              Icons.settings,
                              'Eight',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// ❌ Close button
                Positioned(
                  top: 75,
                  right: 20,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, size: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 🔹 MENU ITEM
  Widget _menuGridItem(
    VoidCallback onTap,
    IconData icon,
    String title, [
    Color iconColor = Colors.blue,
  ]) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 22, color: iconColor),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
