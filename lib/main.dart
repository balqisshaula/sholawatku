import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/radio_page.dart';
import 'pages/favorite_page.dart';
import 'pages/login_page.dart';
import 'pages/settings_page.dart';
import 'pages/music_player_page.dart';
import 'models/song.dart';

// Shared state untuk daftar favorit
ValueNotifier<List<String>> favoriteSongsNotifier = ValueNotifier([]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SholawatKu',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/radio': (context) => const RadioPage(),
        '/favorite': (context) => FavoritePage(favoriteSongsNotifier: favoriteSongsNotifier),
        '/settings': (context) => const SettingsPage(),
        '/player': (context) {
          final song = ModalRoute.of(context)!.settings.arguments as Song;
          return MusicPlayerPage(song: song);
        },
      },
    );
  }
}
