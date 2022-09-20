import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserProfileModel {
  String name;
  String userName;
  String email;
  String contact;
  String bird;
  String birdPlace;
  String alamat;
  String imageUrl;
  UserProfileModel({
    this.name = '',
    this.userName = '',
    this.email = '',
    this.contact = '',
    this.bird = '',
    this.birdPlace = '',
    this.alamat = '',
    this.imageUrl = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userName': userName,
      'email': email,
      'contact': contact,
      'bird': bird,
      'birdPlace': birdPlace,
      'alamat': alamat,
      'imageUrl': imageUrl,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      name: (map['name'] ?? '') as String,
      userName: (map['userName'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      contact: (map['contact'] ?? '') as String,
      bird: (map['bird'] ?? '') as String,
      birdPlace: (map['birdPlace'] ?? '') as String,
      alamat: (map['alamat'] ?? '') as String,
      imageUrl: (map['imageUrl'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) => UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
