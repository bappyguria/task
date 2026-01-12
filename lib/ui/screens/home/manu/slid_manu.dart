import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String) onItemTap;

  const SideMenu({
    super.key,
    required this.onClose,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose, // outside tap close
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: -1, end: 0),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(
                  MediaQuery.of(context).size.width * value,
                  0,
                ),
                child: child,
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              color: Colors.white,
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  children: [
                    _menuItem(Icons.dashboard, 'Dashboard'),
                    _menuItem(Icons.call_split, 'Request'),
                    _menuItem(Icons.account_tree, 'Branch List'),
                    _menuItem(Icons.person_add, 'Khamari List'),
                    _menuItem(Icons.layers, 'Batch List'),
                    _menuItem(Icons.close, 'Death Entry', Colors.red),
                    _menuItem(Icons.store, 'Supplier'),
                    _menuItem(Icons.category, 'Category'),
                    _menuItem(Icons.balance, 'Unit'),
                    _menuItem(Icons.inventory, 'Product'),
                    _menuItem(Icons.shopping_cart, 'Purchase'),
                    _menuItem(Icons.attach_money, 'Sales'),
                    _menuItem(Icons.keyboard_return, 'Return'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, [Color? color]) {
    return InkWell(
      onTap: () => onItemTap(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: (color ?? Colors.blue).withOpacity(0.15),
              child: Icon(icon, size: 18, color: color ?? Colors.blue),
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
