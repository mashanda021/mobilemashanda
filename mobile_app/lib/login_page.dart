// lib/login_page.dart
import 'package:flutter/material.dart';
import 'package:vokasi/profile_page.dart'; // <--- UNCOMMENT AND ENSURE THIS IMPORT IS CORRECT

// You might eventually navigate to a profile or home page from here
// import 'package:vokasi/forgot_password_page.dart'; // For the 'Lupa kata sandi?' link

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to LandingPage
          },
        ),
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove shadow
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Color of the back arrow
      ),
      body: SingleChildScrollView(
        // To prevent overflow on keyboard show
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- UI CONTENT FOR LOGIN PAGE ---
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 80,
                height: 80,
              ), // Smaller logo
            ),
            const SizedBox(height: 30),
            const Text(
              'Masuk',
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
                hintText: 'Masukkan kata sandi Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // --- THIS IS THE KEY CHANGE ---
                // TODO: Perform actual login logic here (e.g., validate inputs, call API)

                // For now, assuming successful login, navigate to ProfilePage
                Navigator.pushReplacement(
                  // Use pushReplacement to replace Login page with Profile page
                  context, // so user cannot go back to login via back button.
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );

                // If you want to clear ALL previous routes (e.g., from LandingPage too), use this:
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ProfilePage()),
                //   (Route<dynamic> route) => false, // This removes all previous routes
                // );

                print(
                  'Navigating to ProfilePage from Login Page...',
                ); // This will now print right before navigation
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
                'Masuk',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Navigate to Forgot Password Screen
                  print('Lupa kata sandi? clicked');
                  // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
                },
                child: const Text(
                  'Lupa kata sandi?',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
            // --- END UI CONTENT ---
          ],
        ),
      ),
    );
  }
}
