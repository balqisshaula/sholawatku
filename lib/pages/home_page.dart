import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/song_card.dart';
import '../models/song.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api = ApiService(
    'https://raw.githubusercontent.com/balqisshaula/sholawatku/main',
  );

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
                    'Daftar Sholawat',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // ⬇⬇ FUTUREBUILDER YANG BENER ⬇⬇
                  Expanded(
                    child: FutureBuilder<List<Song>>(
                      future: api.fetchSongs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Gagal memuat data: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }

                        final songs = snapshot.data ?? [];

                        return ListView.builder(
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            final s = songs[index];
                            return SongCard(
                              song: s,
                              isPlaying: false,
                              onTapPlay: () {},
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
