import 'package:get_storage/get_storage.dart';

class StorageService {
  final _storage = GetStorage();

  // Simpan data user setelah login
  void saveUser(String email) {
    _storage.write('user', email);
  }

  // Ambil data user
  String? getUser() {
    return _storage.read('user');
  }

  // Hapus data user saat logout
  void clearUser() {
    _storage.remove('user');
  }
}
