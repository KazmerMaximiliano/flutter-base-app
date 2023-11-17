import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();

  static final SharedPrefs _instance = SharedPrefs._();
  factory SharedPrefs() => _instance;

  SharedPreferences? _prefs;

  initPrefs() async => _prefs = await SharedPreferences.getInstance();

  bool containsKey(String key) => _prefs!.containsKey(key);

  Future<bool> remove(String key) async => await _prefs!.remove(key);

  /// Guarda el estado de la autenticación del usuario
  bool get logged => _prefs!.getBool('logged') ?? false;
  set logged(bool value) => _prefs!.setBool('logged', value);
}
