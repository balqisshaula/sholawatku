import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/song.dart';

class LocalDataService {
  Future<List<Song>> loadSongs() async {
    final data = await rootBundle.loadString('assets/data/songs.json');
    final List<dynamic> jsonList = json.decode(data);
    return jsonList.map((e) => Song.fromJson(e)).toList();
  }
}
