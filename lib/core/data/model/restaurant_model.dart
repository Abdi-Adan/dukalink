import 'dart:convert';

import 'favoriteRestaurantModel.dart';

/// status : true
/// message : "Restaurants feched"
/// data : [{"restaurant_code":"RRRR8UUR","branch_name":"kuku TRM","restaurant_image":"https://cdn.fakercloud.com/avatars/_pedropinho_128.jpg","address":"P.O BOX 254 Nairobi","first_contacts":"254799143383","second_contacts":" 254799143361","email":"chinstrm@gmail.com","latitude":0.087,"longitude":12.0937,"ratings":null},{"restaurant_code":"2R1IH81T8T2IH","branch_name":"Chicke In TRM","restaurant_image":"https://cdn.fakercloud.com/avatars/tur8le_128.jpg","address":"P.O BOX 254 Nairobi","first_contacts":"254799143383","second_contacts":" 254799143361","email":"chieknstrm@gmail.com","latitude":0.087,"longitude":12.0937,"ratings":5}]
RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
    RestaurantModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    List<RestaurantData> data;

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
        status: json["status"],
        message: json["message"],
        data: List<RestaurantData>.from(json["data"].map((x) => RestaurantData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class RestaurantData {  
    RestaurantData({
        required this.id,
        required this.restaurantCode,
        required this.restaurant,
        required this.branchName,
        this.restaurantImage,
        required this.address,
        required this.firstContacts,
        this.secondContacts,
        this.email,
        this.rating,
        this.ratingStatus,
        required this.type,
        this.latitude,
        this.longitude,
        this.favoriteUserId,
        required this.isFavorite,
        required this.updatedOn,
        required this.createdOn,
        this.deletedOn,
    });

    String id;
    String restaurantCode;
    Restaurant restaurant;
    String branchName;
    String? restaurantImage;
    String address;
    String firstContacts;
    String? secondContacts;
    String? email;
    dynamic rating;
    dynamic ratingStatus;
    String type;
    double? latitude;
    double? longitude;
    String? favoriteUserId;
    bool isFavorite;
    DateTime updatedOn;
    DateTime createdOn;
    dynamic deletedOn;

    factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
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
        type: json["type"],
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
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "favorite_user_id": favoriteUserId,
        "is_favorite": isFavorite,
        "updated_on": updatedOn.toIso8601String(),
        "created_on": createdOn.toIso8601String(),
        "deleted_on": deletedOn,
    };
}

/// restaurant_code : "RRRR8UUR"
/// branch_name : "kuku TRM"
/// restaurant_image : "https://cdn.fakercloud.com/avatars/_pedropinho_128.jpg"
/// address : "P.O BOX 254 Nairobi"
/// first_contacts : "254799143383"
/// second_contacts : " 254799143361"
/// email : "chinstrm@gmail.com"
/// latitude : 0.087
/// longitude : 12.0937
/// ratings : null

// Restaurant dataFromJson(String str) => Restaurant.fromJson(json.decode(str));
// String dataToJson(Restaurant data) => json.encode(data.toJson());

// class Restaurant {
//   Restaurant({
//     String? restaurantCode,
//     String? branchName,
//     String? restaurantImage,
//     String? address,
//     String? firstContacts,
//     String? secondContacts,
//     String? email,
//     double? latitude,
//     double? longitude,
//     dynamic ratings,
//     // List<FavoriteRestaurant>? favorites,
//   }) {
//     _restaurantCode = restaurantCode;
//     _branchName = branchName;
//     _restaurantImage = restaurantImage;
//     _address = address;
//     _firstContacts = firstContacts;
//     _secondContacts = secondContacts;
//     _email = email;
//     _latitude = latitude;
//     _longitude = longitude;
//     _ratings = ratings;
//     // _favorites = favorites;
//   }

//   Restaurant.fromJson(dynamic json) {
//     _restaurantCode = json['restaurant_code'];
//     _branchName = json['branch_name'];
//     _restaurantImage = json['restaurant_image'];
//     _address = json['address'];
//     _firstContacts = json['first_contacts'];
//     _secondContacts = json['second_contacts'];
//     _email = json['email'];
//     _latitude = json['latitude'];
//     _longitude = json['longitude'];
//     _ratings = json['ratings'];
//     // if (json['favorites'] != null) {
//     //   _favorites = [];
//     //   json['favorites'].forEach((v) {
//     //     _favorites?.add(FavoriteRestaurant.fromJson(v));
//     //   });
//     // }
//   }
//   String? _restaurantCode;
//   String? _branchName;
//   String? _restaurantImage;
//   String? _address;
//   String? _firstContacts;
//   String? _secondContacts;
//   String? _email;
//   double? _latitude;
//   double? _longitude;
//   dynamic _ratings;
//   // List<FavoriteRestaurant>? _favorites;
//   Restaurant copyWith({
//     String? restaurantCode,
//     String? branchName,
//     String? restaurantImage,
//     String? address,
//     String? firstContacts,
//     String? secondContacts,
//     String? email,
//     double? latitude,
//     double? longitude,
//     dynamic ratings,
//     // List<FavoriteRestaurant>? favorites,
//   }) =>
//       Restaurant(
//         restaurantCode: restaurantCode ?? _restaurantCode,
//         branchName: branchName ?? _branchName,
//         restaurantImage: restaurantImage ?? _restaurantImage,
//         address: address ?? _address,
//         firstContacts: firstContacts ?? _firstContacts,
//         secondContacts: secondContacts ?? _secondContacts,
//         email: email ?? _email,
//         latitude: latitude ?? _latitude,
//         longitude: longitude ?? _longitude,
//         ratings: ratings ?? _ratings,
//         // favorites: favorites ?? _favorites,
//       );
//   String? get restaurantCode => _restaurantCode;
//   String? get branchName => _branchName;
//   String? get restaurantImage => _restaurantImage;
//   String? get address => _address;
//   String? get firstContacts => _firstContacts;
//   String? get secondContacts => _secondContacts;
//   String? get email => _email;
//   double? get latitude => _latitude;
//   double? get longitude => _longitude;
//   dynamic get ratings => _ratings;
//   // List<FavoriteRestaurant>? get favorites => _favorites;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['restaurant_code'] = _restaurantCode;
//     map['branch_name'] = _branchName;
//     map['restaurant_image'] = _restaurantImage;
//     map['address'] = _address;
//     map['first_contacts'] = _firstContacts;
//     map['second_contacts'] = _secondContacts;
//     map['email'] = _email;
//     map['latitude'] = _latitude;
//     map['longitude'] = _longitude;
//     map['ratings'] = _ratings;
//     // if (_favorites != null) {
//     //   map['favorites'] = _favorites?.map((v) => v.toJson()).toList();
//     // }
//     return map;
//   }
// }
