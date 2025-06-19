// lib/theme_service.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import package ini

class ThemeService extends ChangeNotifier {
  static const String _themeModeKey =
      'theme_mode'; // Kunci untuk menyimpan preferensi di SharedPreferences
  ThemeMode _themeMode =
      ThemeMode.system; // Tema default: mengikuti sistem (terang/gelap)

  // Getter untuk mendapatkan tema saat ini
  ThemeMode get themeMode => _themeMode;

  // Konstruktor: akan dijalankan saat ThemeService dibuat
  ThemeService() {
    _loadThemeMode(); // Panggil fungsi untuk memuat preferensi tema
  }

  // Fungsi untuk memuat preferensi tema dari SharedPreferences
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final int? themeIndex = prefs.getInt(
      _themeModeKey,
    ); // Ambil nilai tema yang tersimpan
    if (themeIndex != null) {
      // Jika ada nilai tersimpan, set tema sesuai nilai tersebut
      _themeMode = ThemeMode.values[themeIndex];
    } else {
      // Jika tidak ada, kembali ke tema sistem
      _themeMode = ThemeMode.system;
    }
    notifyListeners(); // Beri tahu widget yang mendengarkan bahwa tema sudah dimuat/berubah
  }

  // Fungsi untuk mengganti tema (terang ke gelap, gelap ke terang)
  Future<void> toggleTheme() async {
    _themeMode =
        (_themeMode == ThemeMode.light)
            ? ThemeMode.dark
            : ThemeMode.light; // Ganti tema
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      _themeModeKey,
      _themeMode.index,
    ); // Simpan preferensi tema
    notifyListeners(); // Beri tahu widget yang mendengarkan bahwa tema sudah berubah
  }

  // Opsional: Fungsi untuk mengatur tema spesifik (misal: selalu terang/selalu gelap)
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, _themeMode.index);
    notifyListeners();
  }
}
