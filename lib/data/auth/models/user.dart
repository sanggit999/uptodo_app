class UserModel {
  final String userId;
  final String username;
  final String image;

  UserModel({
    required this.userId,
    required this.username,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['_id'],
      username: json['username'],
      image: json['image'],
    );
  }
}
