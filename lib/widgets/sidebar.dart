import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Hapus data login

    // Kembali ke login & hapus semua halaman sebelumnya
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.black87,
      child: Column(
        children: [
          const SizedBox(height: 20),

          // HOME
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),

          // RADIO
          ListTile(
            leading: const Icon(Icons.radio, color: Colors.white),
            title: const Text('Radio', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacementNamed(context, '/radio'),
          ),

          // FAVORITE
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white),
            title: const Text('Favorite', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacementNamed(context, '/favorite'),
          ),

          // SETTINGS
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
          ),

          const Spacer(), // supaya Logout turun ke bawah

          // LOGOUT
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.redAccent),
            ),
            onTap: () => logout(context),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
