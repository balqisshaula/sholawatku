import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../globals.dart';
import '../models/song.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

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
                  const Text('Sholawat Favorit Saya', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ValueListenableBuilder<List<String>>(
                      valueListenable: favoriteSongsNotifier,
                      builder: (context, favs, _) {
                        if (favs.isEmpty) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(24),
                              child: Text('Belum ada sholawat favorit.\nTambahkan dari halaman utama!', textAlign: TextAlign.center),
                            ),
                          );
                        }

                        // cari objek Song dari masterSongs berdasarkan audioUrl
                        final List<Song> favSongs = favs.map((path) {
                          return masterSongs.firstWhere(
                            (s) => s.audioUrl == path,
                            orElse: () => Song(id: 0, title: path.split('/').last, singer: '', audioUrl: path, cover: 'assets/images/radio.jpg'),
                          );
                        }).toList();

                        return ListView.builder(
                          itemCount: favSongs.length,
                          itemBuilder: (context, i) {
                            final s = favSongs[i];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: Image.asset(s.cover, width: 50, height: 50, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(width:50, height:50, color:Colors.grey[300], child: const Icon(Icons.image_not_supported))),
                                title: Text(s.title),
                                subtitle: Text(s.singer),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    final list = List<String>.from(favoriteSongsNotifier.value);
                                    list.remove(s.audioUrl);
                                    favoriteSongsNotifier.value = list;
                                  },
                                ),
                              ),
                            );
                          },
                        );
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
