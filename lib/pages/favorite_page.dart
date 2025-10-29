import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../main.dart';

class FavoritePage extends StatelessWidget {
  final ValueNotifier<List<String>> favoriteSongsNotifier;
  const FavoritePage({super.key, required this.favoriteSongsNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Container(
              color: const Color(0xFFF9F4FF),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sholawat Favorit Saya',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ValueListenableBuilder<List<String>>(
                      valueListenable: favoriteSongsNotifier,
                      builder: (context, favoriteSongs, _) {
                        if (favoriteSongs.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Belum ada sholawat favorit.\nTambahkan dari halaman utama!',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: favoriteSongs.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(favoriteSongs[index]),
                                trailing: const Icon(Icons.favorite, color: Colors.red),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
