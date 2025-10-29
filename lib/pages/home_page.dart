import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../models/song.dart';
import '../widgets/song_card.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Song> songs;

  @override
  void initState() {
    super.initState();
    songs = [
      Song(
        id: 1,
        title: 'Sholawat Badar',
        singer: 'Habib Syech',
        theme: 'Pujian Nabi',
        description: 'Sholawat yang penuh makna dan semangat.',
        audioUrl: 'assets/songs/sholawat_badar.mp3',
        cover: 'assets/images/sholawat1.jpg',
      ),
      Song(
        id: 2,
        title: 'Ya Habibal Qolbi',
        singer: 'Nissa Sabyan',
        theme: 'Dzikir',
        description: 'Sholawat yang lembut dan menyentuh hati.',
        audioUrl: 'assets/songs/ya_habibal_qolbi.mp3',
        cover: 'assets/images/sholawat2.jpg',
      ),
      Song(
        id: 3,
        title: 'Ya Asyiqol Musthofa',
        singer: 'The Custom',
        theme: 'Pujian Nabi',
        description: 'Sholawat menenangkan hati.',
        audioUrl: 'assets/songs/ya_asyiqol_mustofa.mp3',
        cover: 'assets/images/sholawat3.jpg',
      ),
    ];
  }

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
                  Expanded(
                    child: ListView.builder(
                      itemCount: songs.length,
                      itemBuilder: (context, index) {
                        final song = songs[index];
                        return SongCard(
                          song: song,
                          onTap: () {
                            Navigator.pushNamed(context, '/player', arguments: song);
                          },
                          onFavoriteToggle: () {
                            setState(() {
                              song.isFavorite = !song.isFavorite;
                              if (song.isFavorite) {
                                favoriteSongsNotifier.value = [...favoriteSongsNotifier.value, song.title];
                              } else {
                                favoriteSongsNotifier.value =
                                    favoriteSongsNotifier.value.where((s) => s != song.title).toList();
                              }
                            });
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
