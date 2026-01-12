import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onCartTap;
  final VoidCallback onProfileTap;

  const DashboardHeader({
    super.key,
    required this.onMenuTap,
    required this.onNotificationTap,
    required this.onCartTap,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LEFT SIDE
            Row(
              children: [
                InkWell(
                  onTap: onMenuTap,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu),
                  ),
                ),
                const SizedBox(width: 16),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHMYkH--qHAdG3yZ9MLPTG81pL5FHEsM71J09rx0pKcA&s',
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ],
            ),

            /// RIGHT SIDE
            Row(
              children: [
                _iconButton(Icons.notifications, onNotificationTap),
                const SizedBox(width: 12),
                _iconButton(Icons.shopping_cart, onCartTap),
                const SizedBox(width: 12),
                InkWell(
                  onTap: onProfileTap,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}
