part of 'index.dart';

class DrinkFoodModel {
  final String name;
  DrinkFoodModel({
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory DrinkFoodModel.fromMap(Map<String, dynamic> map) {
    return DrinkFoodModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DrinkFoodModel.fromJson(String source) => DrinkFoodModel.fromMap(json.decode(source));
}
