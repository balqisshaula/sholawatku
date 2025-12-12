// lib/services/local_data_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'; // <-- untuk debugPrint
import '../models/song.dart';

class LocalDataService {
  Future<List<Song>> loadSongs() async {
    try {
      final data = await rootBundle.loadString('assets/data/songs.json');
      final List<dynamic> jsonList = json.decode(data);
      return jsonList.map((e) => Song.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      debugPrint('LocalDataService.loadSongs error: $e');
      return [];
    }
  }
}
