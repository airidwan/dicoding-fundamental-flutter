// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:submission_restaurantapp/hive_helper/fields/restaourant_fav_model_fields.dart';
import 'package:submission_restaurantapp/hive_helper/hive_adapters.dart';
import 'package:submission_restaurantapp/hive_helper/hive_types.dart';

part 'restaourant_fav_model.g.dart';

@HiveType(typeId: HiveTypes.restaourantFavModel, adapterName: HiveAdapters.restaourantFavModel)
class RestaourantFavModel extends HiveObject {
	@HiveField(RestaourantFavModelFields.id)
  String id;
	@HiveField(RestaourantFavModelFields.name)
  String name;
	@HiveField(RestaourantFavModelFields.description)
  String description;
	@HiveField(RestaourantFavModelFields.pictureId)
  String pictureId;
	@HiveField(RestaourantFavModelFields.city)
  String city;
	@HiveField(RestaourantFavModelFields.rating)
  double rating;
  RestaourantFavModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.pictureId = '',
    this.city = '',
    this.rating = 0.0,
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
    };
  }

  factory RestaourantFavModel.fromMap(Map<String, dynamic> map) {
    return RestaourantFavModel(
      id: (map['id'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      pictureId: (map['pictureId'] ?? '') as String,
      city: (map['city'] ?? '') as String,
      rating: (map['rating'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory RestaourantFavModel.fromJson(String source) => RestaourantFavModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
