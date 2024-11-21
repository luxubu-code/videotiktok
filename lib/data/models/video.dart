class Video {
  final String id;
  final String? title;
  final String? descriptions;
  final String videoUrl;
  final String publicId;
  final String? thumbnailUrl;
  final int views;
  final int likes;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Video({
    required this.id,
    this.title,
    this.descriptions,
    required this.videoUrl,
    required this.publicId,
    this.thumbnailUrl,
    required this.views,
    required this.likes,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] ?? '',
      title: json['title'],
      descriptions: json['descriptions'],
      videoUrl: json['videoUrl'] ?? '',
      publicId: json['public_id'] ?? '',
      thumbnailUrl: json['thumbnailUrl'],
      views: json['views'] ?? 0,
      likes: json['likes'] ?? 0,
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'descriptions': descriptions,
      'videoUrl': videoUrl,
      'public_id': publicId,
      'thumbnailUrl': thumbnailUrl,
      'views': views,
      'likes': likes,
      'userId': userId,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
