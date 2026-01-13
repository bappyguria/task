import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:excel/excel.dart' hide Border;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:task/model/student_mode.dart';
import 'package:media_store_plus/media_store_plus.dart';


class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({Key? key}) : super(key: key);

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _horizontalController = ScrollController();

  String _selectedMonth = 'Today';
  String _selectedFilter = 'Filter';
  String _selectedSort = 'Name';

  final List<Student> _students = [
    Student(
      'AD1001',
      '101',
      'Janet',
      'Monthly',
      'Active',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1002',
      '102',
      'Janete',
      'Weekly',
      'Inactive',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1003',
      '103',
      'Joann',
      'Monthly',
      'Active',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1004',
      '104',
      'Kathleen',
      'Today',
      'Active',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1005',
      '105',
      'Michael',
      'Weekly',
      'Inactive',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1006',
      '106',
      'Sophia',
      'Monthly',
      'Active',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1007',
      '107',
      'Daniel',
      'Today',
      'Active',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1008',
      '108',
      'Emma',
      'Monthly',
      'Inactive',
      'Coding',
      '01316646395',
    ),
    Student(
      'AD1009',
      '109',
      'Oliver',
      'Weekly',
      'Active',
      'Coding',
      '01316646395',
    ),
  ];

  List<Student> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    _applyFilters();
  }

  /// 🔄 RESET
  void _resetPage() {
    setState(() {
      _selectedMonth = 'Today';
      _selectedFilter = 'Filter';
      _selectedSort = 'Name';
      _searchController.clear();
    });
    _applyFilters();
  }

  /// 🔥 MAIN FILTER + SORT LOGIC
  void _applyFilters() {
    List<Student> temp = [..._students];

    // Month filter
    if (_selectedMonth.isNotEmpty) {
      temp = temp.where((s) => s.monthType == _selectedMonth).toList();
    }

    // Status filter
    if (_selectedFilter != 'Filter') {
      temp = temp.where((s) => s.status == _selectedFilter).toList();
    }

    // Search
    final query = _searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      temp = temp.where((s) {
        return s.name.toLowerCase().contains(query) ||
            s.admissionNo.toLowerCase().contains(query) ||
            s.rollNo.contains(query);
      }).toList();
    }

    // Sort
    if (_selectedSort == 'Name') {
      temp.sort((a, b) => a.name.compareTo(b.name));
    } else if (_selectedSort == 'Roll No') {
      temp.sort((a, b) => a.rollNo.compareTo(b.rollNo));
    } else if (_selectedSort == 'Admission No') {
      temp.sort((a, b) => a.admissionNo.compareTo(b.admissionNo));
    }

    setState(() {
      _filteredStudents = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // 🔴 radius change
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Students',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              
                      SizedBox(height: 10),
              
                      /// Buttons
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 35, // 🔴 button height control
                              child: ElevatedButton(
                                onPressed: _resetPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 2,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ), // 🔴 vertical padding remove
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize
                                      .min, // 🔴 extra width/height off
                                  children: const [
                                    Icon(Icons.refresh, size: 16),
                                    SizedBox(width: 6),
                                    Text(
                                      'Refresh',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: PopupMenuButton<String>(
                                color: Colors.white,
                                offset: const Offset(
                                  0,
                                  0,
                                ), // 🔥 button-এর নিচে show হবে
                                position:
                                    PopupMenuPosition.under, // ✅ Flutter 3.7+
              
                                onSelected: (value) {
                                  if (value == 'excel') {
                                    exportToExcelDownload(context);
                                  } else if (value == 'pdf') {
                                    _exportToPdf();
                                  }
                                },
              
                                itemBuilder: (context) => const [
                                  PopupMenuItem(
                                    value: 'excel',
                                    child: Text('Export as Excel'),
                                  ),
                                  PopupMenuItem(
                                    value: 'pdf',
                                    child: Text('Export as PDF'),
                                  ),
                                ],
              
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    height: 35,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          Icons.print,
                                          size: 16,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Export',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
              
                          const SizedBox(width: 8),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.blue, // background null
                                  shadowColor:
                                      Colors.transparent, // shadow remove
                                  elevation: 0, // elevation off
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: _resetPage,
                                child: const Text(
                                  'Add Naw',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ), // text black
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: _dropdownButton(
                                _selectedMonth,
                                ['Today', 'Weekly', 'Monthly', 'Yearly'],
                                (v) {
                                  _selectedMonth = v;
                                  _applyFilters();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _dropdownButton(
                              _selectedFilter,
                              const ['Filter', 'Active', 'Inactive'],
                              (v) {
                                setState(() {
                                  _selectedFilter = v;
                                });
                                _applyFilters();
                              },
                            ),
                          ),
              
                          const SizedBox(width: 8),
                          Expanded(
                            child: _dropdownButton(
                              _selectedSort,
                              ['Name', 'Roll No'],
                              (v) {
                                _selectedSort = v;
                                _applyFilters();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
              
                      /// Search
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 36, // 🔴 TextField height
                              child: TextField(
                                controller: _searchController,
                                onChanged: (_) => _applyFilters(),
                                style: const TextStyle(fontSize: 13),
                                decoration: const InputDecoration(
                                  isDense: true, // 🔴 important
                                  prefixIcon: Icon(Icons.search, size: 18),
                                  hintText: 'Search student',
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 0, // 🔴 no extra height
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text('Back')),
                                  ),
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  height: 35,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      //border: Border.all(width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                SizedBox(
                                  height: 35,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 2,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(child: Text('Next')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),

              Divider(),
              _filteredStudents.isEmpty
                  ? const Center(child: Text('No students found'))
                  : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SingleChildScrollView(
                          controller: _horizontalController,
                          scrollDirection: Axis.horizontal,
                        
                          child: SizedBox(
                            width: 820,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: _filteredStudents.length + 1,
                                    itemBuilder: (context, index) {
                                      // 🔹 HEADER
                                      if (index == 0) {
                                        return Table(
                                          border: TableBorder.all(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                          columnWidths: const {
                                            0: FixedColumnWidth(140),
                                            1: FixedColumnWidth(90),
                                            2: FixedColumnWidth(160),
                                            3: FixedColumnWidth(140),
                                            4: FixedColumnWidth(120),
                                            5: FixedColumnWidth(120),
                                          },
                                          children: const [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F2F2),
                                              ),
                                              children: [
                                                _HeaderCell('Admission No'),
                                                _HeaderCell('Roll No'),
                                                _HeaderCell('Name'),
                                                _HeaderCell('Phone'),
                                                _HeaderCell('Status'),
                                                _HeaderCell('Month'),
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                  
                                      // 🔹 BODY
                                      final s = _filteredStudents[index - 1];
                                      return Table(
                                        border: TableBorder.all(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                        columnWidths: const {
                                          0: FixedColumnWidth(140),
                                          1: FixedColumnWidth(90),
                                          2: FixedColumnWidth(160),
                                          3: FixedColumnWidth(140),
                                          4: FixedColumnWidth(120),
                                          5: FixedColumnWidth(120),
                                        },
                                        children: [
                                          TableRow(
                                            children: [
                                              _BodyCell(
                                                s.admissionNo,
                                                color: Colors.blue,
                                                bold: true,
                                              ),
                                              _BodyCell(s.rollNo),
                                              _BodyCell(s.name),
                                              _BodyCell(s.phone),
                                              _BodyCell(
                                                s.status,
                                                color: s.status == 'Active'
                                                    ? Colors.green
                                                    : Colors.red,
                                                bold: true,
                                              ),
                                              _BodyCell(s.monthType),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropdownButton(
    String value,
    List<String> items,
    ValueChanged<String> onChanged,
  ) {
    return DropdownButton2<String>(
      isExpanded: true,
      value: value.isNotEmpty ? value : null,
      underline: const SizedBox.shrink(),
      items: items.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(
            e,
            style: const TextStyle(fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),

      onChanged: (v) {
        if (v != null) onChanged(v);
      },

      /// 🔴 Button Style
      buttonStyleData: ButtonStyleData(
        height: 36,
        width: double.infinity, // 🔴 Expanded support
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
      ),

      /// 🔴 Dropdown Menu Style
      dropdownStyleData: DropdownStyleData(
        offset: const Offset(0, 0),
        padding: EdgeInsets.zero,
        maxHeight: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
      ),

      /// 🔴 Menu Item Style
      menuItemStyleData: const MenuItemStyleData(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),

      /// 🔴 Icon
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down, size: 18),
      ),
    );
  }

  Future<void> _exportToPdf() async {
    final pdf = pw.Document();

    // 🔴 Load logo image from assets
    // final logoBytes = await rootBundle.load('assets/logo.png');
    //  final logo = pw.MemoryImage(logoBytes.buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),

        // 🔴 HEADER (shown on every page)
        header: (context) {
          return pw.Container(
            padding: const pw.EdgeInsets.only(bottom: 10),
            decoration: const pw.BoxDecoration(
              border: pw.Border(bottom: pw.BorderSide(width: 1)),
            ),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                //    pw.Image(logo, width: 40, height: 40),
                pw.SizedBox(width: 10),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'My Company Name',
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'Students Report',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Text(
                  'Date: ${DateTime.now().toString().split(' ').first}',
                  style: const pw.TextStyle(fontSize: 9),
                ),
              ],
            ),
          );
        },

        build: (context) => [
          pw.SizedBox(height: 10),

          // 🔴 TABLE
          pw.Table.fromTextArray(
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
            cellAlignment: pw.Alignment.centerLeft,
            headers: const [
              'Admission No',
              'Roll No',
              'Name',
              'Status',
              'Month',
            ],
            data: _filteredStudents.map((s) {
              return [s.admissionNo, s.rollNo, s.name, s.status, s.monthType];
            }).toList(),
          ),
        ],
      ),
    );

    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  Future<void> exportToExcelDownload(BuildContext context) async {
    try {
      // 🔴 REQUIRED (safe to call again)
      MediaStore.appFolder = 'StudentsApp';
      await MediaStore.ensureInitialized();

      final excel = Excel.createExcel();
      final Sheet sheet = excel['Students'];
      excel.setDefaultSheet('Students');

      // Header
      sheet.appendRow([
        TextCellValue('Admission No'),
        TextCellValue('Roll No'),
        TextCellValue('Name'),
        TextCellValue('Status'),
        TextCellValue('Month'),
        TextCellValue('Phone'),
      ]);

      // Data
      for (final s in _filteredStudents) {
        sheet.appendRow([
          TextCellValue(s.admissionNo),
          TextCellValue(s.rollNo),
          TextCellValue(s.name),
          TextCellValue(s.status),
          TextCellValue(s.monthType),
          TextCellValue(s.phone),
        ]);
      }

      final bytes = excel.encode();
      if (bytes == null) return;

      // Temp file
      final tempDir = await getTemporaryDirectory();
      final tempFilePath =
          '${tempDir.path}/students_${DateTime.now().millisecondsSinceEpoch}.xlsx';

      await File(tempFilePath).writeAsBytes(bytes, flush: true);

      final mediaStore = MediaStore();

      // ✅ SAVE TO DOWNLOAD FOLDER
      await mediaStore.saveFile(
        tempFilePath: tempFilePath,
        dirName: DirName.download,
        dirType: DirType.download, // 🔴 ONLY THIS
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Excel downloaded successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Export failed: $e')));
    }
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft, // 🔥 left aligned
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _BodyCell extends StatelessWidget {
  final String text;
  final Color? color;
  final bool bold;

  const _BodyCell(this.text, {this.color, this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft, // 🔥 must be same
        child: Text(
          text,
          style: TextStyle(
            color: color ?? Colors.black87,
            fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
