part of 'index.dart';

class CategoriesModel {
  final String name;
  CategoriesModel({
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) => CategoriesModel.fromMap(json.decode(source));
}
