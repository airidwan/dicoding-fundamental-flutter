import 'dart:convert';

class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final MenuModel menus;
  RestaurantModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.pictureId = '',
    this.city = '',
    this.rating = 0.0,
    required this.menus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
      'menus': menus.toMap(),
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      pictureId: map['pictureId'] ?? '',
      city: map['city'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      menus: MenuModel.fromMap(map['menus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) => RestaurantModel.fromMap(json.decode(source));
}

class MenuModel {
  final List<FoodModel> foods;
  final List<DrinkModel> drinks;
  MenuModel({
    this.foods = const [],
    this.drinks = const [],
  });
  

  Map<String, dynamic> toMap() {
    return {
      'foods': foods.map((x) => x.toMap()).toList(),
      'drinks': drinks.map((x) => x.toMap()).toList(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      foods: List<FoodModel>.from(map['foods']?.map((x) => FoodModel.fromMap(x))),
      drinks: List<DrinkModel>.from(map['drinks']?.map((x) => DrinkModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source));
}

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
