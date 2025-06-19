// lib/account_details_page.dart
import 'package:flutter/material.dart';
import 'package:vokasi/profile_page.dart'; // Make sure this import is present and correct!

// You might eventually navigate to a login or profile page from here
// import 'package:vokasi/login_page.dart'; // Or your profile page

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  String? _selectedProgramStudi;
  final List<String> _programStudiOptions = [
    'Manajemen Informatika',
    'Akuntansi',
    'Teknik Komputer',
    'Sistem Informasi', // Add more options as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to RegisterAccountPage
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 80,
                height: 80,
              ), // Smaller logo
            ),
            const SizedBox(height: 30),
            const Text(
              'Detail Akun',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text('Nama'),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan nama lengkap Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Nama Panggilan'),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Panggilan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('NPM'),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan NPM Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const Text('Pilih Program Studi'),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ), // Adjust vertical padding for better alignment
              ),
              hint: const Text('Pilih Program Studi'),
              value: _selectedProgramStudi,
              items:
                  _programStudiOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProgramStudi = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('Alamat rumah/kost'),
            const SizedBox(height: 10),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Masukkan alamat rumah/kost Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // --- THIS IS THE KEY CHANGE ---
                // TODO: In a real app, you would submit the user's registration data to your backend API here.
                // After successful registration (e.g., API call returns success):

                // Option 1: Navigate to ProfilePage and replace the AccountDetailsPage
                // This means pressing back on ProfilePage won't go to AccountDetailsPage.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );

                // Option 2: Navigate to ProfilePage and remove ALL previous routes (Landing, Register, AccountDetails)
                // This is often done after a full registration/login flow to clear the history.
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ProfilePage()),
                //   (Route<dynamic> route) => false, // This predicate removes all previous routes
                // );

                print(
                  'Navigating to ProfilePage after completing registration details...',
                ); // For debugging
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Daftar',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
