// To parse this JSON data, do
//
//     final favoriteRestaurantModel = favoriteRestaurantModelFromJson(jsonString);

import 'dart:convert';

FavoriteRestaurantModel favoriteRestaurantModelFromJson(String str) =>
    FavoriteRestaurantModel.fromJson(json.decode(str));

String favoriteRestaurantModelToJson(FavoriteRestaurantModel data) =>
    json.encode(data.toJson());

class FavoriteRestaurantModel {
  FavoriteRestaurantModel({
    required this.status,
    required this.data,
  });

  bool status;
  List<Data> data;

  factory FavoriteRestaurantModel.fromJson(Map<String, dynamic> json) =>
      FavoriteRestaurantModel(
        status: json["status"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.id,
    required this.restaurantCode,
    required this.restaurant,
    required this.branchName,
    this.restaurantImage,
    required this.address,
    required this.firstContacts,
    required this.secondContacts,
    required this.email,
    this.rating,
    this.ratingStatus,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.favoriteUserId,
    required this.isFavorite,
    required this.updatedOn,
    required this.createdOn,
    this.deletedOn,
  });

  String id;
  String restaurantCode;
  Restaurant restaurant;
  String branchName;
  dynamic restaurantImage;
  String address;
  String firstContacts;
  String secondContacts;
  String email;
  dynamic rating;
  dynamic ratingStatus;
  DateTime type;
  double latitude;
  double longitude;
  String favoriteUserId;
  bool isFavorite;
  DateTime updatedOn;
  DateTime createdOn;
  dynamic deletedOn;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        restaurantCode: json["restaurant_code"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        branchName: json["branch_name"],
        restaurantImage: json["restaurant_image"],
        address: json["address"],
        firstContacts: json["first_contacts"],
        secondContacts: json["second_contacts"],
        email: json["email"],
        rating: json["rating"],
        ratingStatus: json["rating_status"],
        type: DateTime.parse(json["type"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        favoriteUserId: json["favorite_user_id"],
        isFavorite: json["is_favorite"],
        updatedOn: DateTime.parse(json["updated_on"]),
        createdOn: DateTime.parse(json["created_on"]),
        deletedOn: json["deleted_on"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_code": restaurantCode,
        "restaurant": restaurant.toJson(),
        "branch_name": branchName,
        "restaurant_image": restaurantImage,
        "address": address,
        "first_contacts": firstContacts,
        "second_contacts": secondContacts,
        "email": email,
        "rating": rating,
        "rating_status": ratingStatus,
        "type": type.toIso8601String(),
        "latitude": latitude,
        "longitude": longitude,
        "favorite_user_id": favoriteUserId,
        "is_favorite": isFavorite,
        "updated_on": updatedOn.toIso8601String(),
        "created_on": createdOn.toIso8601String(),
        "deleted_on": deletedOn,
      };
}

class Restaurant {
  Restaurant({
    required this.restaurantCode,
    required this.resaurantBranch,
    required this.restaurantName,
    required this.restaurantImage,
    required this.address,
    required this.firstContacts,
    this.secondContacts,
    this.email,
    this.latitude,
    this.longitude,
  });

  String restaurantCode;
  String resaurantBranch;
  String restaurantName;
  String restaurantImage;
  String address;
  String firstContacts;
  dynamic secondContacts;
  dynamic email;
  dynamic latitude;
  dynamic longitude;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurantCode: json["restaurant_code"],
        resaurantBranch: json["resaurant_branch"],
        restaurantName: json["restaurant_name"],
        restaurantImage: json["restaurant_image"],
        address: json["address"],
        firstContacts: json["first_contacts"],
        secondContacts: json["second_contacts"],
        email: json["email"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant_code": restaurantCode,
        "resaurant_branch": resaurantBranch,
        "restaurant_name": restaurantName,
        "restaurant_image": restaurantImage,
        "address": address,
        "first_contacts": firstContacts,
        "second_contacts": secondContacts,
        "email": email,
        "latitude": latitude,
        "longitude": longitude,
      };
}
