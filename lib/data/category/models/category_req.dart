class CategoryReq {
  final String userId;
  final String name;
  final String icon;
  final String color;

  CategoryReq({
    required this.userId,
    required this.name,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'icon': icon,
      'color': color,
    };
  }
}
