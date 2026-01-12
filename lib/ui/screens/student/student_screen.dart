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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Students List',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              /// Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _resetPage,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.file_download),
                      label: const Text('Export'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add,color: Colors.white,),
                      label: const Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              /// Filters
              Row(
                children: [
                  Expanded(
                    child: _dropdownButton(
                      _selectedMonth,
                      ['Monthly', 'Weekly', 'Daily'],
                      (v) {
                        _selectedMonth = v;
                        _applyFilters();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _dropdownButton(
                      _selectedFilter,
                      ['All', 'Active', 'Inactive'],
                      (v) {
                        _selectedFilter = v;
                        _applyFilters();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _dropdownButton(
                      _selectedSort,
                      ['Name', 'Roll No', ],
                      (v) {
                        _selectedSort = v;
                        _applyFilters();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              /// Search
              TextField(
                controller: _searchController,
                onChanged: (_) => _applyFilters(),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search student',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              /// Table
              Expanded(
                child: _filteredStudents.isEmpty
                    ? const Center(child: Text('No students found'))
                    : ListView.separated(
                        itemCount: _filteredStudents.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (_, index) {
                          final s = _filteredStudents[index];
                          return ListTile(
                            title: Text(s.name),
                            subtitle: Text(
                              'Roll: ${s.rollNo} | ${s.monthType} | ${s.status}',
                            ),
                            trailing: Text(
                              s.admissionNo,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          );
                        },
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
      decoration: const InputDecoration(border: OutlineInputBorder()),
      items: items
          .map(
            (e) => DropdownMenuItem(value: e, child: Text(e)),
          )
          .toList(),
      onChanged: (v) => onChanged(v!),
    );
  }
}

/// ===== MODEL =====

