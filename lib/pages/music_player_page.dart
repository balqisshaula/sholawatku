import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/song.dart';

class MusicPlayerPage extends StatefulWidget {
  final Song song;
  const MusicPlayerPage({required this.song, super.key});

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  late final AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  Future<void> _togglePlay() async {
  if (_isPlaying) {
    await _player.pause();
  } else {
    await _player.play(AssetSource(widget.song.audioUrl));
  }
  if (mounted) {
    setState(() => _isPlaying = !_isPlaying);
  }
}


  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.song.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.song.cover, width: 200, height: 200),
            const SizedBox(height: 20),
            Text(widget.song.singer),
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill, size: 60),
              onPressed: _togglePlay,
            ),
          ],
        ),
      ),
    );
  }
}
