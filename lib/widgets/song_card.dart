import 'package:flutter/material.dart';
import '../models/song.dart';
import '../globals.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final bool isPlaying;
  final VoidCallback onTapPlay;

  const SongCard({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTapPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            song.cover,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 56,
              height: 56,
              color: Colors.grey[300],
              child: const Icon(Icons.image_not_supported),
            ),
          ),
        ),
        title: Text(song.title),
        subtitle: Text(song.singer),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill),
              iconSize: 36,
              onPressed: onTapPlay,
            ),
            ValueListenableBuilder<List<String>>(
              valueListenable: favoriteSongsNotifier,
              builder: (context, favs, _) {
                final isFav = favs.contains(song.audioUrl);
                return IconButton(
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
                  onPressed: () {
                    final list = List<String>.from(favoriteSongsNotifier.value);
                    if (isFav) {
                      list.remove(song.audioUrl);
                    } else {
                      list.add(song.audioUrl);
                    }
                    favoriteSongsNotifier.value = list;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isFav ? 'Dihapus dari favorit' : 'Ditambahkan ke favorit')),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
