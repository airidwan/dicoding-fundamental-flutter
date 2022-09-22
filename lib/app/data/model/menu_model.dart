part of 'index.dart';

class MenuModel {
  List<DrinkFoodModel> foods;
  List<DrinkFoodModel> drinks;
  MenuModel({
    this.foods = const [],
    this.drinks = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foods': foods.map((x) => x.toMap()).toList(),
      'drinks': drinks.map((x) => x.toMap()).toList(),
    };
  }

  factory MenuModel.fromMap(Map<String, dynamic> map) {
    return MenuModel(
      foods: List<DrinkFoodModel>.from(
        map['foods']?.map<DrinkFoodModel>(
          (x) => DrinkFoodModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      drinks: List<DrinkFoodModel>.from(
        map['drinks']?.map<DrinkFoodModel>(
          (x) => DrinkFoodModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuModel.fromJson(String source) => MenuModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
