// lib/register_account_page.dart
import 'package:flutter/material.dart';
import 'package:vokasi/account_details_page.dart'; // <--- Import the new page

class RegisterAccountPage extends StatelessWidget {
  const RegisterAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            ); // Go back to the previous screen (LandingPage)
          },
        ),
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove shadow
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Color of the back arrow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- UI CONTENT FOR REGISTER ACCOUNT PAGE (as before) ---
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 80,
                height: 80,
              ), // Smaller logo
            ),
            const SizedBox(height: 30),
            const Text(
              'Daftar Akun',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text('Alamat Email'),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan alamat email UNPAK',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            const Text('Kata Sandi'),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Masukkan setidaknya 8 karakter',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Nomor HP'),
            const SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Masukkan nomor HP Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // --- NAVIGATION CHANGE HERE ---
                // In a real app, you'd add input validation here
                // For now, it will navigate regardless of input validity
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccountDetailsPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(
                  double.infinity,
                  50,
                ), // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Lanjut',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            // --- END UI CONTENT ---
          ],
        ),
      ),
    );
  }
}
