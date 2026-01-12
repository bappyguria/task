import 'package:flutter/material.dart';
import 'package:task/model/student_mode.dart';

class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({Key? key}) : super(key: key);

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _selectedMonth = 'Monthly';
  String _selectedFilter = 'All';
  String _selectedSort = 'Name';

  final List<Student> _students = [
    Student('AD1001', '101', 'Janet', 'Monthly', 'Active'),
    Student('AD1002', '102', 'Janete', 'Weekly', 'Inactive'),
    Student('AD1003', '103', 'Joann', 'Monthly', 'Active'),
    Student('AD1004', '104', 'Kathleen', 'Daily', 'Active'),
    Student('AD1005', '105', 'Michael', 'Weekly', 'Inactive'),
    Student('AD1006', '106', 'Sophia', 'Monthly', 'Active'),
    Student('AD1007', '107', 'Daniel', 'Daily', 'Active'),
    Student('AD1008', '108', 'Emma', 'Monthly', 'Inactive'),
    Student('AD1009', '109', 'Oliver', 'Weekly', 'Active'),
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
      _selectedMonth = 'Monthly';
      _selectedFilter = 'All';
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
    if (_selectedFilter != 'All') {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // back off
        title: const Text(
          'Students List',
          style: TextStyle(color: Colors.black),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 2,
            thickness: 1,
            color: Colors.grey, // bottom border color
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Buttons
              Row(
                children: [
                  // Expanded(
                  //   child: OutlinedButton.icon(
                  //     onPressed: _resetPage,
                  //     icon: const Icon(Icons.refresh),
                  //     label: const Text('Refresh'),
                  //   ),
                  // ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // background null
                          shadowColor: Colors.transparent, // shadow remove
                          elevation: 0, // elevation off
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              color: Colors.grey, // border color
                              width: 1,
                            ),
                          ),
                        ),
                        onPressed: _resetPage,
                        child: const Text(
                          'Refresh',
                          style: TextStyle(color: Colors.black), // text black
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // background null
                          shadowColor: Colors.transparent, // shadow remove
                          elevation: 0, // elevation off
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              color: Colors.grey, // border color
                              width: 1,
                            ),
                          ),
                        ),
                        onPressed: _resetPage,
                        child: const Text(
                          'Export',
                          style: TextStyle(color: Colors.black), // text black
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // background null
                          shadowColor: Colors.transparent, // shadow remove
                          elevation: 0, // elevation off
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: _resetPage,
                        child: const Text(
                          'Add Naw',
                          style: TextStyle(color: Colors.white), // text black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: _dropdownButton(
                        _selectedMonth,
                        ['Monthly', 'Weekly', 'Daily'],
                        (v) {
                          _selectedMonth = v;
                          _applyFilters();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: _dropdownButton(
                        _selectedFilter,
                        ['All', 'Active', 'Inactive'],
                        (v) {
                          _selectedFilter = v;
                          _applyFilters();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: _dropdownButton(
                        _selectedSort,
                        ['Name', 'Roll No'],
                        (v) {
                          _selectedSort = v;
                          _applyFilters();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              /// Search
              SizedBox(
                height: 50,
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => _applyFilters(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search student',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Divider(),
              Expanded(
                child: _filteredStudents.isEmpty
                    ? const Center(child: Text('No students found'))
                    : Container(
                        margin: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            // 🔹 Header
                            Container(
                              color: Colors.grey.shade100,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                              child: Row(
                                children: const [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Admission No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Roll No',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Divider(height: 1),

                            // 🔹 Table Body
                            Expanded(
                              child: ListView.separated(
                                itemCount: _filteredStudents.length,
                                separatorBuilder: (_, __) => Divider(
                                  height: 1,
                                  color: Colors.grey.shade200,
                                ),
                                itemBuilder: (_, index) {
                                  final s = _filteredStudents[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        // Admission No
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            s.admissionNo,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        // Roll No (with vertical lines)
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            // decoration: BoxDecoration(
                                            //   border: Border(
                                            //     left: BorderSide(
                                            //         color: Colors.grey.shade300),
                                            //     right: BorderSide(
                                            //         color: Colors.grey.shade300),
                                            //   ),
                                            // ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                            child: Text(
                                              s.rollNo,
                                              style: const TextStyle(
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Name
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            s.name,
                                            style: const TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Dropdown widget
  Widget _dropdownButton(
    String value,
    List<String> items,
    Function(String) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      icon: const SizedBox.shrink(), // 🔴 icon remove
      decoration: const InputDecoration(border: OutlineInputBorder()),
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (v) => onChanged(v!),
    );
  }
}
