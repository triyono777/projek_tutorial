import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/login_page.dart';
import '../notes/note_list_page.dart';
import '../../services/storage_service.dart';

class HomePage extends StatelessWidget {
  final _storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _storageService.clearUser();
              Get.offAll(() => LoginPage());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${_storageService.getUser()}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(() => NoteListPage()),
              child: Text('View Notes'),
            ),
          ],
        ),
      ),
    );
  }
}
