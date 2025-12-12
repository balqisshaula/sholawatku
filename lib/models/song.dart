class Song {
  final int id;
  final String title;
  final String singer;
  final String audioUrl; // contoh: 'songs/sholawat_badar.mp3'
  final String cover;    // contoh: 'assets/images/sholawat1.jpg'
  final String? theme;
  final String? description;

  Song({
    required this.id,
    required this.title,
    required this.singer,
    required this.audioUrl,
    required this.cover,
    this.theme,
    this.description,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}') ?? 0,
      title: json['title'] ?? '',
      singer: json['singer'] ?? '',
      audioUrl: json['audio'] ?? json['audio_url'] ?? '',
      cover: json['cover'] ?? '',
      theme: json['theme'],
      description: json['description'],
    );
  }
}
