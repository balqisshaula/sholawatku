import 'package:flutter/material.dart';
import '../models/song.dart';

class SongCard extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteToggle;

  const SongCard({
    super.key,
    required this.song,
    required this.onTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: Image.asset(song.cover, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(song.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("${song.singer} • ${song.theme}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onFavoriteToggle != null)
              IconButton(
                icon: Icon(
                  song.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: onFavoriteToggle,
              ),
            const Icon(Icons.play_circle_fill, color: Colors.green),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
