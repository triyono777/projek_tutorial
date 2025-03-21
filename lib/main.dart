import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'pages/auth/login_page.dart';
import 'pages/home/home_page.dart';

void main() async {
  await GetStorage.init(); // Inisialisasi GetStorage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _storage = GetStorage(); // Instance GetStorage

  @override
  Widget build(BuildContext context) {
    // Cek apakah user masih login
    final isLoggedIn = _storage.read('user') != null;

    return MaterialApp(
      title: 'Flutter GetStorage App',
      // Jika user masih login, arahkan ke HomePage, jika tidak, arahkan ke LoginPage
      home: isLoggedIn ? HomePage() : LoginPage(),
    );
  }
}
