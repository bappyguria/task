import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task/ui/screens/home/recent_purchase/screens/recent_purchase_section.dart';
import 'package:task/ui/screens/student/student_screen.dart';
import 'package:task/ui/widget/dashboard_header.dart';
import 'package:task/ui/widget/dashbord_status_gred.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isMenuOpen = false;
  int _currentSlide = 0;
  final List<String> _sliderImages = [
    'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800',
    'https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=800',
    'https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?w=800',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlider();
  }

  void _startAutoSlider() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentSlide = (_currentSlide + 1) % _sliderImages.length;
        });
        _startAutoSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              DashboardHeader(
                onMenuTap: () {
                  setState(() {
                    _isMenuOpen = true;
                  });
                  _showTopDialog(context, 'Menu');
                },
                onNotificationTap: () {},
                onCartTap: () {},
                onProfileTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      _buildImageSlider(),
                      const SizedBox(height: 16),
                      DashboardStatsGrid(),
                      const SizedBox(height: 24),
                      RecentPurchaseSection(),
                      const SizedBox(height: 24),
                      _buildRecentSalesSection(),
                      const SizedBox(height: 24),
                      _buildChartsColumn(),
                      const SizedBox(height: 24),
                      _buildTopKhamariAndAlerts(),
                      const SizedBox(height: 24),
                      _buildScheduleAndActivity(),
                     
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
/// Home Screen Image Slider ////
  Widget _buildImageSlider() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Image.network(
          _sliderImages[_currentSlide],
          key: ValueKey(_currentSlide),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
/// Recent Seles Section ////
  Widget _buildRecentSalesSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.attach_money_outlined,
                    size: 20,
                    color: Colors.green,
                  ),
                  const Text(
                    'Recently Sales',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 40,
              dataRowHeight: 40,
              columns: const [
                DataColumn(
                  label: Text(
                    'Sl',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Invoice',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Branch',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Khamari',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Batch',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Product',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Sales',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Due',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Profit',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(Text('01', style: TextStyle(fontSize: 11))),
                    const DataCell(
                      Text('10-Jan-26', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        '00001',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        'Gazipur Salna',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text('Abdur Rahman', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        'B-44 (Layer)',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ),
                    const DataCell(
                      Text('Broiler Chicken', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        '25,000',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        '2,000',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        '3,500',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
//// Charts //////////
  Widget _buildChartsColumn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          // ===== Line Chart Card =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '📊 Weekly Sales Overview',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true, drawVerticalLine: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                'Sat',
                                'Sun',
                                'Mon',
                                'Tue',
                                'Wed',
                                'Thu',
                                'Fri',
                              ];
                              return Text(
                                days[value.toInt()],
                                style: const TextStyle(fontSize: 10),
                              );
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: const [
                            FlSpot(0, 12000),
                            FlSpot(1, 19000),
                            FlSpot(2, 15000),
                            FlSpot(3, 25000),
                            FlSpot(4, 22000),
                            FlSpot(5, 30000),
                            FlSpot(6, 28000),
                          ],
                          isCurved: true,
                          color: Colors.indigo,
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Colors.indigo.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ===== Pie Chart Card =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🥧 Category Wise Stock',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 45,
                          color: Colors.indigo,
                          title: 'Feed\n45%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          value: 25,
                          color: Colors.pink,
                          title: 'Medicine\n25%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          value: 20,
                          color: Colors.orange,
                          title: 'Chicks\n20%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PieChartSectionData(
                          value: 10,
                          color: Colors.green,
                          title: 'Equipment\n10%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      sectionsSpace: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopKhamariAndAlerts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Top Khamari (This Month)',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.indigo[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                  title: const Text(
                    'Rahim Poultry Farm',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: const Text(
                    '৳ 50,000',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Low Stock Alerts',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: const Text(
                    'CP Starter Feed',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Only 5 Bag Left',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleAndActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigo[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Upcoming Schedule',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.indigo[200]!),
                        ),
                        child: const Text(
                          'Today',
                          style: TextStyle(fontSize: 9, color: Colors.indigo),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildScheduleItem(
                  'Jan',
                  '12',
                  'Payment Collection',
                  'Abdur Rahman (Batch B-44)',
                ),
                _buildScheduleItem(
                  'Jan',
                  '15',
                  'Vaccination Alert',
                  'Salna Branch - Layer Batch',
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      // _buildActivityItem(
                      //     Colors.green, 'New Khamari Added: Kamal Hossain',
                      //     '2 hours ago'),
                      // const SizedBox(height: 12),
                      // _buildActivityItem(
                      //     Colors.blue, 'Purchase Invoice #0092 generated',
                      //     '5 hours ago'),
                      // const SizedBox(height: 12),
                      // _buildActivityItem(
                      //     Colors.orange, 'System backup completed',
                      //     'Yesterday'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(
    String month,
    String day,
    String title,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Text(
                  month.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//// Manu
  void _showTopDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.only(top: 70, left: 16, right: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===== Header =====
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const Divider(),

                  SizedBox(
                    height: 220,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 12,
                      children: [
                        _menuGridItem(
                          () {
                            print('Dashbord');
                            Navigator.pop(context);
                          },
                          Icons.dashboard,
                          'Dashbore',
                        ),

                        _menuGridItem(
                          () {
                            print('Student');
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentsListScreen(),
                              ),
                            );
                          },
                          Icons.star_rounded,
                          'Student',
                        ),

                        _menuGridItem(
                          () {
                            Navigator.pop(context);
                          },
                          Icons.attach_money,
                          'Three',
                        ),

                        _menuGridItem(
                          () {
                            Navigator.pop(context);
                          },
                          Icons.person,
                          'Four',
                        ),

                        _menuGridItem(
                          () {
                            Navigator.pop(context);
                          },
                          Icons.layers,
                          'Five',
                        ),

                        _menuGridItem(
                          () {
                            Navigator.pop(context);
                          },
                          Icons.store,
                          'Six',
                        ),

                        _menuGridItem(
                          () {
                            Navigator.pop(context);
                          },
                          Icons.category,
                          'Seven',
                        ),

                        _menuGridItem(
                          () {
                            Navigator.pop(context);
                          },
                          Icons.settings,
                          'Eight',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _menuGridItem(
    VoidCallback? onTap,
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
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

}
