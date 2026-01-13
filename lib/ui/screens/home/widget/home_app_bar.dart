import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onCartTap;
  final VoidCallback onProfileTap;
  final VoidCallback onLogoutTap;
  final VoidCallback? onBackTap;
  final bool showBack;

  const HomeAppBar({
    super.key,
    required this.onMenuTap,
    required this.onNotificationTap,
    required this.onCartTap,
    required this.onProfileTap,
    required this.onLogoutTap,
    this.onBackTap,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,

      title: Row(
        children: [
          /// 🔙 BACK BUTTON (only when needed)
          if (showBack)
            InkWell(
              onTap: onBackTap,
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            )
          else
            InkWell(
              onTap: onMenuTap,
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.menu, color: Colors.black),
              ),
            ),

          Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHMYkH--qHAdG3yZ9MLPTG81pL5FHEsM71J09rx0pKcA&s',
                  height: 25,
                  fit: BoxFit.contain,
                ),
        ],
      ),

      actions: [
        appBarIcon(Icons.notifications,onNotificationTap),
        appBarIcon(Icons.shopping_cart,onCartTap),
        appBarIcon(Icons.person,onProfileTap),
        appBarIcon(Icons.logout,onLogoutTap),
      ],
    );
  }

  Widget appBarIcon(IconData icon, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(30),
    child: Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: Colors.black),
    ),
  );
}
}
