import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/radio_page.dart';
import 'pages/favorite_page.dart';
import 'pages/login_page.dart';
import 'pages/settings_page.dart';
import 'pages/music_player_page.dart';
import 'models/song.dart';
import 'globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: darkModeNotifier,
      builder: (context, isDark, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SholawatKu',
          theme: isDark ? ThemeData.dark() : ThemeData.light(),
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/radio': (context) => const RadioPage(),
            // NOTE: FavoritePage defined without constructor param in current project
            '/favorite': (context) => const FavoritePage(),
            '/settings': (context) => const SettingsPage(),
            '/player': (context) {
              final song = ModalRoute.of(context)!.settings.arguments as Song;
              return MusicPlayerPage(song: song);
            },
          },
        );
      },
    );
  }
}
