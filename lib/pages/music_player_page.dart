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
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // load but don't autoplay
    _player.setSource(AssetSource(widget.song.audioUrl));
    _player.onPlayerStateChanged.listen((s) {
      setState(() {
        _isPlaying = s == PlayerState.playing;
      });
    });
  }

  Future<void> _toggle() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.stop();
      await _player.play(AssetSource(widget.song.audioUrl));
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.song;
    return Scaffold(
      appBar: AppBar(title: Text(s.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(s.cover, width:200, height:200, fit:BoxFit.cover),
            const SizedBox(height: 12),
            Text(s.singer),
            IconButton(icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill, size:64), onPressed: _toggle),
          ],
        ),
      ),
    );
  }
}
