import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task/model/stat_item_model.dart';
import 'package:task/ui/widget/status_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentSlide = 0;
  final List<String> _sliderImages = [
    'https://img.freepik.com/free-photo/website-hosting-concept-with-bright-light_23-2149406783.jpg?semt=ais_hybrid&w=740&q=80',
    'https://thumbs.dreamstime.com/b/consultant-presenting-tag-cloud-information-technology-213591032.jpg',
    'https://media.istockphoto.com/id/1830042746/photo/document-management-system-dms-with-arrange-folder-and-files-icons-man-setup-storage-backup.jpg?s=612x612&w=0&k=20&c=t8oAAO16j6fMhleAYJEXm5pSXFIDZrEG6sYJkv_Sdos=',
  ];

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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                  child: Column(
                    children: [
                      _buildImageSlider(),
                      const SizedBox(height: 16),
                      _buildDashbordStatusGrid(),
                      const SizedBox(height: 24),
                      _buildRecentlyPurchaseSection(),
                      const SizedBox(height: 24),
                      _buildRecentSalesSection(),
                      const SizedBox(height: 24),
                      _buildChartsColumn(),
                      const SizedBox(height: 24),
                      _buildTopKhamariAndAlerts(),
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
            borderRadius: BorderRadius.circular(4),
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
              borderRadius: BorderRadius.circular(4),
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
              borderRadius: BorderRadius.circular(4),
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
              borderRadius: BorderRadius.circular(4),
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
              borderRadius: BorderRadius.circular(4),
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
                      top: Radius.circular(4),
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

  Widget _buildRecentlyPurchaseSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.shopping_cart, size: 20, color: Colors.blue),
                  SizedBox(width: 5),
                  Text(
                    'Recently Purchase',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                        color: Colors.blue,
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
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Invoice',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Brand',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Product',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Purchase',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Due',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    const DataCell(
                      Text('01', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text('10-Jan-26', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        '00001',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        'CP Feed',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text('Poultry Feed', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        'CP Starter (50kg)',
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    const DataCell(
                      Text(
                        '3,200',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        '500',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    const DataCell(
                      Text('02', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text('09-Jan-26', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        '00002',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        'CP Feed',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text('Medicine', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text('Renamycin Sol.', style: TextStyle(fontSize: 11)),
                    ),
                    const DataCell(
                      Text(
                        '1,200',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        'Paid',
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

Widget _buildDashbordStatusGrid () {
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


