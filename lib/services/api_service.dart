import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/song.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Song>> fetchSongs() async {
    final url = Uri.parse('$baseUrl/songs.json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body);
      return list.map((e) => Song.fromJson(e)).toList();
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}
