import 'package:flutter/material.dart';
import '../models/song.dart';

class DetailPage extends StatelessWidget {
  final Song song;
  DetailPage({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(song.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(song.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Penyanyi: ${song.singer}"),
            Text("Tema: ${song.theme}"),
            SizedBox(height: 16),
            Text(song.description),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fitur Play belum aktif (dummy)')),
                  );
                },
                icon: Icon(Icons.play_arrow),
                label: Text("Putar Lagu"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
