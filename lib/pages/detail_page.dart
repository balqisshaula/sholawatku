import 'package:flutter/material.dart';
import '../models/song.dart';

class DetailPage extends StatelessWidget {
  final Song song;
  const DetailPage({required this.song, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(song.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(song.cover, width: double.infinity, height: 200, fit: BoxFit.cover),
            const SizedBox(height:12),
            Text(song.title, style: const TextStyle(fontSize:22,fontWeight: FontWeight.bold)),
            Text(song.singer),
            const SizedBox(height:12),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/player', arguments: song), child: const Text('Play')),
          ],
        ),
      ),
    );
  }
}
