class User {
  final String id;
  final String name;
  final int age;
  final String imageUrl; // Snake case -> camelCase
  final String email;
  final String? lastLogin; // Snake case -> camelCase
  final String googleId; // Snake case -> camelCase
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    // Thêm const constructor để tối ưu performance
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.email,
    this.lastLogin, // Bỏ required vì đã là nullable
    required this.googleId,
    this.createdAt,
    this.updatedAt,
  });

  /// Phương thức để khởi tạo User từ JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      imageUrl: json['image_url'] as String,
      email: json['email'] as String,
      lastLogin: json['last_login'] as String?,
      googleId: json['google_id'] as String,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }
}
