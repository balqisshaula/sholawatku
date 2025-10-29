import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/sidebar.dart';
import '../main.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isFavorite = false;
  String songName = 'radio.mp3'; // pastikan file ini ada di assets/songs/

  // tombol play/pause
  void playPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(AssetSource('songs/$songName'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  // tombol like/unlike
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;

      if (isFavorite) {
        // tambahkan ke daftar favorit
        favoriteSongsNotifier.value = [...favoriteSongsNotifier.value, songName];
      } else {
        // hapus dari daftar favorit
        favoriteSongsNotifier.value =
            favoriteSongsNotifier.value.where((s) => s != songName).toList();
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
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
                    'Radio Sholawat',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/radio.jpg',
                          height: 180,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Radio Sholawat 24 Jam',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Dengarkan lantunan sholawat secara langsung.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: playPause,
                              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                              label: Text(isPlaying ? 'Pause' : 'Play'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                                size: 32,
                              ),
                              onPressed: toggleFavorite,
                            ),
                          ],
                        ),
                      ],
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
