part of 'index.dart';

class CustomerReviewsModel {
  final String name;
  final String review;
  final String date;
  CustomerReviewsModel({
    this.name = '',
    this.review = '',
    this.date = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'review': review,
      'date': date,
    };
  }

  factory CustomerReviewsModel.fromMap(Map<String, dynamic> map) {
    return CustomerReviewsModel(
      name: map['name'] ?? '',
      review: map['review'] ?? '',
      date: map['date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerReviewsModel.fromJson(String source) => CustomerReviewsModel.fromMap(json.decode(source));
}
