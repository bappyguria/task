  import 'package:flutter/material.dart';

class RecentPurchseSection extends StatefulWidget {
  const RecentPurchseSection({super.key});

  @override
  State<RecentPurchseSection> createState() => _RecentPurchseSectionState();
}

class _RecentPurchseSectionState extends State<RecentPurchseSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                
                 children: [
                  Icon(Icons.shopping_cart,size: 20,color: Colors.blue,),
                  SizedBox(width: 5,),
                   Text(
                    'Recently Purchase',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                 ),
                 ],
               ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('View All', style: TextStyle(fontSize: 16,color: Colors.blue,fontWeight: FontWeight.bold)),
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
                    'Brand',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Category',
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
                    'Purchase',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Due',
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
                      Text('CP Starter (50kg)', style: TextStyle(fontSize: 11)),
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
                    const DataCell(Text('02', style: TextStyle(fontSize: 11))),
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
    ),
    );
  }
}