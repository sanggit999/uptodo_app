class CategoryModel {
  final String? categoryId;
  final String? userId;
  final String? name;
  final String? icon;
  final String? color;

  CategoryModel({
    required this.categoryId,
    required this.userId,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['_id'],
      userId: json['userId'],
      name: json['name'],
      icon: json['icon'],
      color: json['color'],
    );
  }
}
