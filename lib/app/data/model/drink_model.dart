part of 'index.dart';

class DrinkModel {
  final String name;
  DrinkModel({
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory DrinkModel.fromMap(Map<String, dynamic> map) {
    return DrinkModel(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DrinkModel.fromJson(String source) => DrinkModel.fromMap(json.decode(source));
}