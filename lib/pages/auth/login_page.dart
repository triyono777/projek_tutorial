import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/storage_service.dart';
import '../../services/auth_service.dart';
import '../../widgets/custom_textfield.dart';
import '../home/home_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  final _storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
                if (await _authService.login(email, password)) {
                  _storageService.saveUser(email);
                  Get.offAll(() => HomePage());
                } else {
                  Get.snackbar('Error', 'Login failed');
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () => Get.to(() => RegisterPage()),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
