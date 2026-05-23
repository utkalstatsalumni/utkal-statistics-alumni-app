import 'package:flutter/material.dart';

import '../models/alumni_user.dart';
import '../services/alumni_repository.dart';
import 'admin_dashboard_screen.dart';
import 'home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final mobile = mobileController.text.trim();

    final password = passwordController.text.trim();

    // TEMP ADMIN LOGIN
    if (mobile == 'admin' && password == 'admin123') {
      Navigator.pushReplacement(
        context,

        MaterialPageRoute(builder: (context) => const AdminDashboardScreen()),
      );

      return;
    }

    final existingUser = AlumniRepository.findUser(mobile);

    if (existingUser == null) {
      _showMessage('No registration found for this mobile number.');

      return;
    }

    if (existingUser.status != ApprovalStatus.approved) {
      _showMessage(existingUser.statusLabel);

      return;
    }

    Navigator.pushReplacement(
      context,

      MaterialPageRoute(builder: (context) => HomeScreen(user: existingUser)),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF6A1B9A)],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),

              child: Card(
                elevation: 10,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Form(
                    key: _formKey,

                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Image.asset('assets/images/logo.png', height: 110),

                        const SizedBox(height: 20),

                        Text(
                          'Utkal Statistics Alumni Association',

                          textAlign: TextAlign.center,

                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Department of Statistics\nUtkal University',

                          textAlign: TextAlign.center,

                          style: Theme.of(context).textTheme.bodyMedium,
                        ),

                        const SizedBox(height: 30),

                        TextFormField(
                          controller: mobileController,

                          keyboardType: TextInputType.phone,

                          decoration: const InputDecoration(
                            labelText: 'Mobile Number',

                            prefixIcon: Icon(Icons.phone),
                          ),

                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter mobile number';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 18),

                        TextFormField(
                          controller: passwordController,

                          obscureText: true,

                          decoration: const InputDecoration(
                            labelText: 'Password',

                            prefixIcon: Icon(Icons.lock),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter password';
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 28),

                        SizedBox(
                          width: double.infinity,

                          child: ElevatedButton(
                            onPressed: _submitLogin,

                            child: const Text('Login'),
                          ),
                        ),

                        const SizedBox(height: 14),

                        OutlinedButton.icon(
                          onPressed: () {
                            mobileController.text = 'admin';

                            passwordController.text = 'admin123';

                            _submitLogin();
                          },

                          icon: const Icon(Icons.admin_panel_settings),

                          label: const Text('Open Admin Demo'),
                        ),

                        const SizedBox(height: 16),

                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },

                          child: const Text('New User? Register Here'),
                        ),
                      ],
                    ),
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
