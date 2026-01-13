import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/screens/auth/cotroller/regstsion_controller.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GetBuilder<RegistrationController>(
                  builder: (c) {
                    return Form(
                      key: c.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Registration',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// Business Name
                          TextFormField(
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                            decoration: const InputDecoration(
                              hintText: 'Business Name',
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Owner Name
                          TextFormField(
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Required' : null,
                            decoration: const InputDecoration(
                              hintText: 'Owner Name',
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Division
                          DropdownButtonFormField<String>(
                            value: c.selectedDivision,
                            hint: const Text('Select Division'),
                            decoration: _dropdownDecoration(),
                            items: const [
                              'Dhaka',
                              'Chittagong',
                              'Rajshahi',
                              'Khulna',
                              'Barisal',
                              'Sylhet',
                              'Rangpur',
                              'Mymensingh',
                            ]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: c.setDivision,
                          ),
                          const SizedBox(height: 16),

                          /// District
                          DropdownButtonFormField<String>(
                            value: c.selectedDistrict,
                            hint: const Text('Select District'),
                            decoration: _dropdownDecoration(),
                            items: const [
                              'District 1',
                              'District 2',
                              'District 3'
                            ]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: c.setDistrict,
                          ),
                          const SizedBox(height: 16),

                          /// Upazila
                          DropdownButtonFormField<String>(
                            value: c.selectedUpazila,
                            hint: const Text('Select Upazila'),
                            decoration: _dropdownDecoration(),
                            items: const [
                              'Upazila 1',
                              'Upazila 2',
                              'Upazila 3'
                            ]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: c.setUpazila,
                          ),
                          const SizedBox(height: 16),

                          /// Address
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Type Address',
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Mobile
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: 'Type Mobile Number',
                            ),
                          ),
                          const SizedBox(height: 16),

                          /// Password
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Type Password',
                            ),
                          ),
                          const SizedBox(height: 24),

                          /// Buttons
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: c.goToLogin,
                                  child: const Text('Login'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: c.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : ElevatedButton(
                                        onPressed: c.register,
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        child: const Text(
                                          'SignUp',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }
}
