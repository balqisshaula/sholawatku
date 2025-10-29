import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'MENU',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(color: Colors.white54, thickness: 0.5),

          // ✅ Home
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),

          // ✅ Radio
          ListTile(
            leading: const Icon(Icons.radio, color: Colors.white),
            title: const Text('Radio', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/radio');
            },
          ),

          // ✅ Favorite
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white),
            title: const Text('Favorite', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/favorite');
            },
          ),

          // ✅ Settings
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text('Settings', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),

          const Spacer(),

          // ✅ Tombol Logout
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text('Logout', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size(double.infinity, 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
