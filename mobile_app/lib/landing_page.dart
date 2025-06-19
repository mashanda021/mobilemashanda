// lib/landing_page.dart
import 'package:flutter/material.dart';
import 'package:vokasi/register_account_page.dart';
import 'package:vokasi/login_page.dart'; // <--- Import the new Login Page

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // --- UI CONTENT FOR LANDING PAGE (as before) ---
            Image.asset('assets/logo.png', width: 150, height: 150),
            const SizedBox(height: 20),
            const Text(
              'Sekolah Vokasi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Unggul, Mandiri, & Berkarakter',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // --- NAVIGATION CHANGE HERE ---
                // Navigate to Login Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Masuk',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                // Navigate to Register Account Screen (already connected)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterAccountPage(),
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.orange),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Daftar',
                style: TextStyle(fontSize: 18, color: Colors.orange),
              ),
            ),
            // --- END UI CONTENT ---
          ],
        ),
      ),
    );
  }
}
