import 'package:flutter/material.dart';
import 'package:task/model/stat_item_model.dart';
import 'package:task/ui/widget/status_card.dart';

List<StatItem> dashboardStatsData = [
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

class DashboardStatsGrid extends StatelessWidget {
  const DashboardStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: dashboardStatsData.length,
      itemBuilder: (context, index) {
        final item = dashboardStatsData[index];
        return StatCard(item: item);
      },
    );
  }
}

