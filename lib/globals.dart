// lib/globals.dart
import 'package:flutter/material.dart';
import 'models/song.dart';

// global notifiers
final ValueNotifier<bool> darkModeNotifier = ValueNotifier(false);
final ValueNotifier<List<String>> favoriteSongsNotifier = ValueNotifier<List<String>>([]);
final ValueNotifier<double> volumeNotifier = ValueNotifier<double>(1.0);

// master songs list (dipakai di Home & Favorite)
// PENTING: pakai path konsisten. audioUrl diset WITHOUT leading "assets/"
// karena di kode kita memanggil AssetSource(song.audioUrl) -> AssetSource expects path relative to assets/
// so we use 'songs/<filename>.mp3'
final List<Song> masterSongs = [
  Song(
    id: 1,
    title: 'Sholawat Badar',
    singer: 'Habib Syech',
    audioUrl: 'songs/sholawat_badar.mp3',
    cover: 'assets/images/sholawat1.jpg',
  ),
  Song(
    id: 2,
    title: 'Ya Habibal Qolbi',
    singer: 'Nissa Sabyan',
    audioUrl: 'songs/ya_habibal_qolbi.mp3',
    cover: 'assets/images/sholawat2.jpg',
  ),
  Song(
    id: 3,
    title: 'Ya Asyiqol Musthofa',
    singer: 'Gambus Al-Wafi',
    audioUrl: 'songs/ya_asyiqol_mustofa.mp3', // HARUS SAMA DENGAN FILE NYATA
    cover: 'assets/images/sholawat3.jpg',
  ),
];

