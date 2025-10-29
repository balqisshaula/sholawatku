class Song {
  final int id;
  final String title;
  final String singer;
  final String theme;
  final String description;
  final String audioUrl;
  final String cover;
  bool isFavorite;

  Song({
    required this.id,
    required this.title,
    required this.singer,
    required this.theme,
    required this.description,
    required this.audioUrl,
    required this.cover,
    this.isFavorite = false,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      title: json['title'],
      singer: json['singer'],
      theme: json['theme'],
      description: json['description'],
      audioUrl: json['audioUrl'],
      cover: json['cover'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'singer': singer,
        'theme': theme,
        'description': description,
        'audioUrl': audioUrl,
        'cover': cover,
        'isFavorite': isFavorite,
      };
}
