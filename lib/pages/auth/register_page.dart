import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../widgets/custom_textfield.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              label: 'Email',
            ),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                if (await _authService.register(email, password)) {
                  Get.offAll(() => LoginPage());
                } else {
                  Get.snackbar('Error', 'Registration failed');
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
