// ignore_for_file: unnecessary_getters_setters

part of 'index.dart';

class RestaurantModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  String address;
  List<CategoriesModel> categories;
  MenuModel menus;
  List<CustomerReviewsModel> customerReviews;

  late bool _isFav = LocalFavServices.instance.isFav(id);
  bool get isFav => _isFav;
  set isFav(bool newValue) => _isFav = newValue;

  RestaurantModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.pictureId = '',
    this.city = '',
    this.rating = 0.0,
    this.address = '',
    this.categories = const [],
    this.customerReviews = const [],
  }) : menus = MenuModel();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
      'address': address,
      'categories': categories.map((x) => x.toMap()).toList(),
      'menus': menus.toMap(),
      'isFav': isFav,
      'customerReviews': customerReviews.map((x) => x.toMap()).toList(),
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      pictureId: map['pictureId'] ?? '',
      city: map['city'] ?? '',
      address: map['address'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      categories: map['categories'] == null
          ? <CategoriesModel>[]
          : List<CategoriesModel>.from(
              map['categories']?.map((x) => CategoriesModel.fromMap(x)),
            ),
      customerReviews: map['customerReviews'] == null
          ? <CustomerReviewsModel>[]
          : List<CustomerReviewsModel>.from(
              map['customerReviews']?.map<CustomerReviewsModel>((x) => CustomerReviewsModel.fromMap(x)),
            ),
    )..menus = map['menus'] == null ? MenuModel() : MenuModel.fromMap(map['menus'] as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  factory RestaurantModel.fromJson(String source) => RestaurantModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
