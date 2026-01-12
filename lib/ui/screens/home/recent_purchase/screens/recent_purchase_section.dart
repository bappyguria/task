import 'package:flutter/material.dart';
import 'package:task/model/recent_purchase_model.dart';

/// ✅ Dummy / API Data (widget-এর বাইরে রাখা হয়েছে)


class RecentPurchaseSection extends StatelessWidget {
  final List<RecentPurchase> recentPurchaseList = [
  const RecentPurchase(
    sl: '01',
    date: '10-Jan-26',
    invoice: '00001',
    brand: 'CP Feed',
    category: 'Poultry Feed',
    product: 'CP Starter (50kg)',
    purchase: '3,200',
    due: '500',
    isPaid: false,
  ),
  const RecentPurchase(
    sl: '02',
    date: '09-Jan-26',
    invoice: '00002',
    brand: 'CP Feed',
    category: 'Medicine',
    product: 'Renamycin Sol.',
    purchase: '1,200',
    due: 'Paid',
    isPaid: true,
  ),
  const RecentPurchase(
    sl: '03',
    date: '09-Jan-26',
    invoice: '0002',
    brand: 'CP Feehggd',
    category: 'Medifddcine',
    product: 'Renamyddcin Sol.',
    purchase: '1,200ddd',
    due: '4000',
    isPaid: true,
  ),
];


   RecentPurchaseSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ===== Header =====
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.shopping_cart, size: 20, color: Colors.blue),
                  SizedBox(width: 6),
                  Text(
                    'Recently Purchase',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: (){},
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
        ),

        /// ===== Table =====
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          //  border: Border.all(color: Colors.grey),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowHeight: 40,
              dataRowHeight: 40,
              columns:<DataColumn> [
                DataColumn(label: Text("SL")),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Invoice')),
                DataColumn(label: Text('Brand')),
                DataColumn(label: Text('Category')),
                DataColumn(label: Text('Product')),
                DataColumn(label: Text('Purchase')),
                DataColumn(label: Text('Due')),
              ],
              rows: recentPurchaseList.map(_buildRow).toList(),
            ),
          ),
        ),
      ],
    );
  }

  /// ===== Row Builder =====
  static DataRow _buildRow(RecentPurchase item) {
    return DataRow(
      cells: [
        _cell(item.sl),
        _cell(item.date),
        _cell(item.invoice, color: Colors.blue, bold: true),
        _cell(item.brand, color: Colors.teal, bold: true),
        _cell(item.category),
        _cell(item.product),
        _cell(item.purchase, bold: true),
        _cell(
          item.due,
          color: item.isPaid ? Colors.green : Colors.red,
          bold: true,
        ),
      ],
    );
  }

  /// ===== Cell Builder =====
  static DataCell _cell(
    String text, {
    Color? color,
    bool bold = false,
  }) {
    return DataCell(
      Text(
        text,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

/// ===== Column Header Widget (ONLY ONE – error fixed) =====
DataColumn header(String text) => DataColumn(
  label: Text(
    text,
    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
  ),
);
