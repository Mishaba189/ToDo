class CategoryModel {
  final String id;
  final String name;
  final int iconCodePoint;
  final int colorValue;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconCodePoint,
    required this.colorValue,
  });

  factory CategoryModel.fromMap(
      Map<String, dynamic> map,
      String id,
      ) {
    return CategoryModel(
      id: id,
      name: map['name'],
      iconCodePoint: map['icon'],
      colorValue: map['color'],
    );
  }
}