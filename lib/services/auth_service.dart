import 'package:get_storage/get_storage.dart';

class AuthService {
  final _storage = GetStorage();

  Future<bool> login(String email, String password) async {
    // Simulasikan login sederhana
    if (email == 'user@example.com' && password == 'password') {
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    // Simulasikan registrasi sederhana
    _storage.write('user', email);
    return true;
  }
}
