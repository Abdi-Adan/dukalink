// import 'dart:convert';

// import 'package:dukalink_app/core/data/model/restaurant_model.dart';

// import 'login/login_response.dart';

// /// status : true
// /// message : "Favorite restaurant found"
// /// data : [{"restaurant":{"restaurant_code":"4HEKLKLVKEVE4KR0ILKTTT42I","branch_name":"Kenchick Village mrkt","restaurant_image":"https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60","address":"P.O BOX 254 Nairobi","first_contacts":"254799143383","second_contacts":" 254799143361","email":"village@gmail.com","latitude":0.087,"longitude":12.0937,"ratings":null},"user":{"id":"LXr7KmIHyQRGRD08gJd0mXnMQZ22","first_name":"Tester","last_name":"test","mobile_number":"254799143472","email":"test@gmail.com","user_type":"Client","date_created":"2022-10-07T03:16:53.456942Z","updated_on":"2022-10-07T03:16:53.456904Z"},"date_created":"2022-10-09T20:29:32.542664Z"}]

// FavoriteRestaurantModel favoriteRestaurantModelFromJson(String str) =>
//     FavoriteRestaurantModel.fromJson(json.decode(str));
// String favoriteRestaurantModelToJson(FavoriteRestaurantModel data) =>
//     json.encode(data.toJson());

// class FavoriteRestaurantModel {
//   FavoriteRestaurantModel({
//     bool? status,
//     String? message,
//     List<FavoriteRestaurant>? data,
//   }) {
//     _status = status;
//     _message = message;
//     _data = data;
//   }

//   FavoriteRestaurantModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _message = json['message'];
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(FavoriteRestaurant.fromJson(v));
//       });
//     }
//   }
//   bool? _status;
//   String? _message;
//   List<FavoriteRestaurant>? _data;
//   FavoriteRestaurantModel copyWith({
//     bool? status,
//     String? message,
//     List<FavoriteRestaurant>? data,
//   }) =>
//       FavoriteRestaurantModel(
//         status: status ?? _status,
//         message: message ?? _message,
//         data: data ?? _data,
//       );
//   bool? get status => _status;
//   String? get message => _message;
//   List<FavoriteRestaurant>? get data => _data;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['message'] = _message;
//     if (_data != null) {
//       map['data'] = _data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

// /// restaurant : {"restaurant_code":"4HEKLKLVKEVE4KR0ILKTTT42I","branch_name":"Kenchick Village mrkt","restaurant_image":"https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60","address":"P.O BOX 254 Nairobi","first_contacts":"254799143383","second_contacts":" 254799143361","email":"village@gmail.com","latitude":0.087,"longitude":12.0937,"ratings":null}
// /// user : {"id":"LXr7KmIHyQRGRD08gJd0mXnMQZ22","first_name":"Tester","last_name":"test","mobile_number":"254799143472","email":"test@gmail.com","user_type":"Client","date_created":"2022-10-07T03:16:53.456942Z","updated_on":"2022-10-07T03:16:53.456904Z"}
// /// date_created : "2022-10-09T20:29:32.542664Z"

// FavoriteRestaurant dataFromJson(String str) =>
//     FavoriteRestaurant.fromJson(json.decode(str));
// String dataToJson(FavoriteRestaurant data) => json.encode(data.toJson());

// class FavoriteRestaurant {
//   FavoriteRestaurant({
//     Restaurant? restaurant,
//     User? user,
//     String? dateCreated,
//   }) {
//     _restaurant = restaurant;
//     _user = user;
//     _dateCreated = dateCreated;
//   }

//   FavoriteRestaurant.fromJson(dynamic json) {
//     _restaurant = json['restaurant'] != null
//         ? Restaurant.fromJson(json['restaurant'])
//         : null;
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _dateCreated = json['date_created'];
//   }
//   Restaurant? _restaurant;
//   User? _user;
//   String? _dateCreated;
//   FavoriteRestaurant copyWith({
//     Restaurant? restaurant,
//     User? user,
//     String? dateCreated,
//   }) =>
//       FavoriteRestaurant(
//         restaurant: restaurant ?? _restaurant,
//         user: user ?? _user,
//         dateCreated: dateCreated ?? _dateCreated,
//       );
//   Restaurant? get restaurant => _restaurant;
//   User? get user => _user;
//   String? get dateCreated => _dateCreated;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_restaurant != null) {
//       map['restaurant'] = _restaurant?.toJson();
//     }
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     map['date_created'] = _dateCreated;
//     return map;
//   }
// }
// ?TO here
/// id : "LXr7KmIHyQRGRD08gJd0mXnMQZ22"
/// first_name : "Tester"
/// last_name : "test"
/// mobile_number : "254799143472"
/// email : "test@gmail.com"
/// user_type : "Client"
/// date_created : "2022-10-07T03:16:53.456942Z"
/// updated_on : "2022-10-07T03:16:53.456904Z"

/// restaurant_code : "4HEKLKLVKEVE4KR0ILKTTT42I"
/// branch_name : "Kenchick Village mrkt"
/// restaurant_image : "https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"
/// address : "P.O BOX 254 Nairobi"
/// first_contacts : "254799143383"
/// second_contacts : " 254799143361"
/// email : "village@gmail.com"
/// latitude : 0.087
/// longitude : 12.0937
/// ratings : null

// To parse this JSON data, do
//
//     final favoriteRestaurantModel = favoriteRestaurantModelFromJson(jsonString);

import 'dart:convert';

import 'restaurant_model.dart';

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
  List<RestaurantData> data;

  factory FavoriteRestaurantModel.fromJson(Map<String, dynamic> json) =>
      FavoriteRestaurantModel(
        status: json["status"],
        data: List<RestaurantData>.from(
            json["data"].map((x) => RestaurantData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

// class FavoriteRestaurant {
//     FavoriteRestaurant({
//         required this.id,
//         required this.restaurantCode,
//         required this.restaurant,
//         required this.branchName,
//         required this.restaurantImage,
//         required this.address,
//         required this.firstContacts,
//         required this.secondContacts,
//         required this.email,
//         this.rating,
//         this.ratingStatus,
//         required this.type,
//         required this.latitude,
//         required this.longitude,
//         required this.favoriteUserId,
//         required this.isFavorite,
//         required this.updatedOn,
//         required this.createdOn,
//         this.deletedOn,
//     });

//     String id;
//     String restaurantCode;
//     Restaurant restaurant;
//     String branchName;
//     String restaurantImage;
//     String address;
//     String firstContacts;
//     String secondContacts;
//     String email;
//     dynamic rating;
//     dynamic ratingStatus;
//     DateTime type;
//     double latitude;
//     double longitude;
//     String favoriteUserId;
//     bool isFavorite;
//     DateTime updatedOn;
//     DateTime createdOn;
//     dynamic deletedOn;

//     factory FavoriteRestaurant.fromJson(Map<String, dynamic> json) => FavoriteRestaurant(
//         id: json["id"],
//         restaurantCode: json["restaurant_code"],
//         restaurant: Restaurant.fromJson(json["restaurant"]),
//         branchName: json["branch_name"],
//         restaurantImage: json["restaurant_image"],
//         address: json["address"],
//         firstContacts: json["first_contacts"],
//         secondContacts: json["second_contacts"],
//         email: json["email"],
//         rating: json["rating"],
//         ratingStatus: json["rating_status"],
//         type: DateTime.parse(json["type"]),
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         favoriteUserId: json["favorite_user_id"],
//         isFavorite: json["is_favorite"],
//         updatedOn: DateTime.parse(json["updated_on"]),
//         createdOn: DateTime.parse(json["created_on"]),
//         deletedOn: json["deleted_on"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "restaurant_code": restaurantCode,
//         "restaurant": restaurant.toJson(),
//         "branch_name": branchName,
//         "restaurant_image": restaurantImage,
//         "address": address,
//         "first_contacts": firstContacts,
//         "second_contacts": secondContacts,
//         "email": email,
//         "rating": rating,
//         "rating_status": ratingStatus,
//         "type": type.toIso8601String(),
//         "latitude": latitude,
//         "longitude": longitude,
//         "favorite_user_id": favoriteUserId,
//         "is_favorite": isFavorite,
//         "updated_on": updatedOn.toIso8601String(),
//         "created_on": createdOn.toIso8601String(),
//         "deleted_on": deletedOn,
//     };
// }

// class Restaurant {
//   String? restaurantCode;
//   String? resaurantBranch;
//   String? restaurantName;
//   String? restaurantImage;
//   String? address;
//   String? firstContacts;
//   dynamic secondContacts;
//   dynamic email;
//   dynamic latitude;
//   dynamic longitude;

//   Restaurant(
//       {this.restaurantCode,
//       this.resaurantBranch,
//       this.restaurantName,
//       this.restaurantImage,
//       this.address,
//       this.firstContacts,
//       this.secondContacts,
//       this.email,
//       this.latitude,
//       this.longitude});

//      factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         restaurantCode: json["restaurant_code"],
//         resaurantBranch: json["resaurant_branch"],
//         restaurantName: json["restaurant_name"],
//         restaurantImage: json["restaurant_image"],
//         address: json["address"],
//         firstContacts: json["first_contacts"],
//         secondContacts: json["second_contacts"],
//         email: json["email"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//     );

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['restaurant_code'] = this.restaurantCode;
//     data['resaurant_branch'] = this.resaurantBranch;
//     data['restaurant_name'] = this.restaurantName;
//     data['restaurant_image'] = this.restaurantImage;
//     data['address'] = this.address;
//     data['first_contacts'] = this.firstContacts;
//     data['second_contacts'] = this.secondContacts;
//     data['email'] = this.email;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     return data;
//   }
// }

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

  String? restaurantCode;
  String? resaurantBranch;
  String? restaurantName;
  String? restaurantImage;
  String? address;
  String? firstContacts;
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
