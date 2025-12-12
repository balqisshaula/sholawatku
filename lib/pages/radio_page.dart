import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/sidebar.dart';
import '../globals.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;
  bool isFavorite = false;
  final String radioAsset = 'songs/radio.mp3'; // path relative digunakan dengan AssetSource

  @override
  void initState() {
    super.initState();
    // We're not auto-playing radio; just prepare player if desired
    _player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // Check if radioAsset is in favorites already
    isFavorite = favoriteSongsNotifier.value.contains(radioAsset);
  }

  Future<void> playPause() async {
    try {
      if (isPlaying) {
        await _player.pause();
      } else {
        // Play local asset (AssetSource takes path relative to assets/ declared in pubspec)
        await _player.play(AssetSource(radioAsset));
      }
    } catch (e) {
      debugPrint('Radio play error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal memutar radio: $e')));
      }
    }
  }

  void toggleFavorite() {
    final list = List<String>.from(favoriteSongsNotifier.value);
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        if (!list.contains(radioAsset)) list.add(radioAsset);
      } else {
        list.removeWhere((s) => s == radioAsset);
      }
      favoriteSongsNotifier.value = list;
    });
  }

  @override
  void dispose() {
    _player.dispose();
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
                  const Text('Radio Sholawat', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                          errorBuilder: (_, __, ___) => Container(
                            width: double.infinity,
                            height: 180,
                            color: Colors.grey[200],
                            alignment: Alignment.center,
                            child: const Icon(Icons.radio, size: 64),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Radio Sholawat 24 Jam', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text('Dengarkan lantunan sholawat secara langsung.', textAlign: TextAlign.center),
                        const SizedBox(height: 16),
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
                              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 32),
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
