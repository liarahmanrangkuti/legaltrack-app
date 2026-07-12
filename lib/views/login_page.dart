import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/app_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AppController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F8),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: SizedBox(
            width: 340,
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF294BA6),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: const Text(
                    'LT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                const Text(
                  'LegalTrack',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D2638),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Track your legal process',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 18),
                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                if (controller.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    controller.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            controller.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF294BA6),
                      foregroundColor: Colors.white,
                    ),
                    child: controller.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'LOGIN',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
