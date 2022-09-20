part of 'index.dart';

class FoodModel {
  final String name;
  FoodModel({
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodModel.fromJson(String source) => FoodModel.fromMap(json.decode(source));
}