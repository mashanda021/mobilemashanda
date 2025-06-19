// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <-- Tambahkan ini
import 'package:vokasi/landing_page.dart';
import 'package:vokasi/app_themes.dart'; // <-- Tambahkan ini
import 'package:vokasi/theme_service.dart'; // <-- Tambahkan ini

void main() {
  // Pastikan Flutter sudah diinisialisasi, diperlukan oleh SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      // <-- Gunakan ChangeNotifierProvider untuk ThemeService
      create: (context) => ThemeService(), // Buat instance ThemeService
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 'Watch' ThemeService untuk mendengarkan perubahan tema
    final themeService = context.watch<ThemeService>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sekolah Vokasi App',
      theme: AppThemes.lightTheme, // Tema terang yang sudah didefinisikan
      darkTheme: AppThemes.darkTheme, // Tema gelap yang sudah didefinisikan
      themeMode:
          themeService
              .themeMode, // Tema yang aktif, dikontrol oleh ThemeService
      home: const LandingPage(),
    );
  }
}
