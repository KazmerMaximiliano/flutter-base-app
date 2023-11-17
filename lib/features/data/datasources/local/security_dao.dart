import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityDao {
  static const accessToken = 'access_token';

  final storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    final String? token = await storage.read(key: accessToken);
    return token;
  }

  Future<void> persistAccessToken(String? token) async {
    await storage.write(key: accessToken, value: token);
    return;
  }

  Future<void> deleteAccessToken() async {
    await storage.delete(key: accessToken);
    return;
  }

  Future<bool> hasToken() async {
    final String? token = await storage.read(key: accessToken);
    return token != null;
  }

  Future<void> clean() async {
    await storage.deleteAll();
    return;
  }
}
