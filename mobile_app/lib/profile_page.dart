// lib/profile_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // <-- Tambahkan ini
import 'package:vokasi/theme_service.dart'; // <-- Tambahkan ini

// (Kelas UserProfile Anda tetap sama)
class UserProfile {
  final String imageUrl;
  final String email;
  final String phone;
  final String npm;
  final String statusKeaktifan;
  final String programStudi;
  final String jenjangPendidikan;
  final String namaLengkap;
  final String panggilan;
  final String alamatRumah;

  UserProfile({
    required this.imageUrl,
    required this.email,
    required this.phone,
    required this.npm,
    required this.statusKeaktifan,
    required this.programStudi,
    required this.jenjangPendidikan,
    required this.namaLengkap,
    required this.panggilan,
    required this.alamatRumah,
  });

  static UserProfile dummy = UserProfile(
    imageUrl:
        'https://raw.githubusercontent.com/mashanda021/tugasmobile/refs/heads/main/images/orang%20aring.png',
    email: 'mashanda.putri.rashya@unpak.ac.id',
    phone: '087874835075',
    npm: '085023010',
    statusKeaktifan: 'Aktif',
    programStudi: 'Manajemen Infromatika',
    jenjangPendidikan: 'D3',
    namaLengkap: 'Mashanda Putri Rashya',
    panggilan: 'masha',
    alamatRumah: 'perumahan bumi menteng asri',
  );
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfile? _userProfile;

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _userProfile = UserProfile.dummy;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userProfile == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Ambil instance ThemeService
    final themeService = context.watch<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Profil',
          style: TextStyle(
            color:
                Theme.of(context)
                    .appBarTheme
                    .foregroundColor, // <-- Warna teks judul AppBar ikut tema
          ),
        ),
        centerTitle: false,
        actions: [
          // Tombol Edit Profile (sudah ada)
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Edit Profile functionality not yet implemented!',
                  ),
                ),
              );
            },
          ),
          // --- TOMBOL TOGGLE TEMA BARU DI APP BAR ---
          IconButton(
            icon: Icon(
              // Ubah ikon berdasarkan tema saat ini
              themeService.themeMode == ThemeMode.dark
                  ? Icons
                      .light_mode // Jika mode gelap, tampilkan ikon terang (untuk beralih ke terang)
                  : Icons
                      .dark_mode, // Jika mode terang, tampilkan ikon gelap (untuk beralih ke gelap)
            ),
            onPressed: () {
              themeService.toggleTheme(); // Panggil fungsi untuk mengganti tema
            },
            tooltip:
                themeService.themeMode == ThemeMode.dark
                    ? 'Switch to Light Mode'
                    : 'Switch to Dark Mode',
          ),
          // --- AKHIR TOMBOL TOGGLE TEMA ---
        ],
        // backgroundColor, elevation, iconTheme sekarang dikelola oleh AppThemes
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_userProfile!.imageUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _userProfile!.namaLengkap,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color, // <-- Warna teks ikut tema
                    ),
                  ),
                  Text(
                    _userProfile!.email,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                          ?.withOpacity(0.7), // <-- Warna teks ikut tema
                    ),
                  ),
                  Text(
                    _userProfile!.phone,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                          ?.withOpacity(0.7), // <-- Warna teks ikut tema
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:
                    Theme.of(
                      context,
                    ).primaryColor, // Warna Container ikut tema (primaryColor)
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildProfileRow('NPM', _userProfile!.npm, showCopy: true),
                  Divider(color: Colors.white.withOpacity(0.5)),
                  _buildProfileRow(
                    'Status Keaktifan',
                    _userProfile!.statusKeaktifan,
                  ),
                  Divider(color: Colors.white.withOpacity(0.5)),
                  _buildProfileRow('Program Studi', _userProfile!.programStudi),
                  Divider(color: Colors.white.withOpacity(0.5)),
                  _buildProfileRow(
                    'Jenjang Pendidikan',
                    _userProfile!.jenjangPendidikan,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _buildInfoRow('Nama Lengkap', _userProfile!.namaLengkap),
            const Divider(),
            _buildInfoRow('Panggilan', _userProfile!.panggilan),
            const Divider(),
            _buildInfoRow(
              'Alamat Rumah',
              _userProfile!.alamatRumah,
              isAddress: true,
            ),
            const Divider(),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Kartu Mahasiswa feature not yet implemented!',
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    'Kartu Mahasiswa',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color, // <-- Warna teks ikut tema
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.badge_outlined,
                    color:
                        Theme.of(
                          context,
                        ).iconTheme.color, // <-- Warna ikon ikut tema
                  ),
                ],
              ),
            ),
            // --- SwitchListTile sebelumnya dihapus dari sini ---
          ],
        ),
      ),
    );
  }

  // Metode _buildProfileRow dan _buildInfoRow tetap sama,
  // tapi pastikan warna teks di dalamnya juga menyesuaikan tema
  Widget _buildProfileRow(String label, String value, {bool showCopy = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ), // Tetap putih karena di dalam container oranye
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ), // Tetap putih
              if (showCopy)
                IconButton(
                  icon: const Icon(
                    Icons.copy,
                    size: 16,
                    color: Colors.white,
                  ), // Tetap putih
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Copied!')));
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isAddress = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment:
            isAddress ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color:
                    Theme.of(
                      context,
                    ).textTheme.bodyLarge?.color, // <-- Warna teks ikut tema
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:
                    Theme.of(
                      context,
                    ).textTheme.bodyLarge?.color, // <-- Warna teks ikut tema
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
