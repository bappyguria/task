import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/ui/screens/auth/cotroller/login_cntroller.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: controller.formKey,
                  child: GetBuilder<LoginController>(
                    builder: (c) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// Phone
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Enter number' : null,
                            decoration: const InputDecoration(
                              hintText: 'Number',
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// Password
                          TextFormField(
                            obscureText: true,
                            validator: (v) =>
                                v == null || v.isEmpty ? 'Enter password' : null,
                            decoration:
                                const InputDecoration(hintText: 'Password'),
                          ),

                          const SizedBox(height: 6),

                          /// Remember + Forget
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: c.rememberMe,
                                      onChanged: (v) =>
                                          c.toggleRemember(v ?? false),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('Remember Me'),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forget?'),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          /// Buttons
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: c.goToSignup,
                                  child: const Text('SignUp'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: c.isLodding ? Center(child: CircularProgressIndicator()) : ElevatedButton(
                                  onPressed: c.login,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
