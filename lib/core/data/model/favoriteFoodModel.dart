// import 'dart:convert';

// import 'package:dukalink_app/core/data/model/dishes_model.dart';

// import 'login/login_response.dart';

// /// status : true
// /// message : "Favorite food found"
// /// data : [{"food":{"menu_category":{"restaurant_code":"TNNN80RRT88N32T0","menu_code":"CKCC10CECTESHPKCPK1TC0","menu_name":"Chicken pizza-tes","menu_image":"https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"},"food_code":"SH500H42S44","food_name":"Cheese","food_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"TNNN80RRT88N32T0","maximum_count":5,"addon_name":"Cheese","price":20.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1,"ratings":null},"user":{"id":"LXr7KmIHyQRGRD08gJd0mXnMQZ22","first_name":"Tester","last_name":"test","mobile_number":"254799143472","email":"test@gmail.com","user_type":"Client","date_created":"2022-10-07T03:16:53.456942Z","updated_on":"2022-10-07T03:16:53.456904Z"},"date_created":"2022-10-09T20:34:22.641063Z"}]

// FavoriteFoodModel favoriteFoodModelFromJson(String str) =>
//     FavoriteFoodModel.fromJson(json.decode(str));
// String favoriteFoodModelToJson(FavoriteFoodModel data) =>
//     json.encode(data.toJson());

// class FavoriteFoodModel {
//   FavoriteFoodModel({
//     bool? status,
//     String? message,
//     List<FavoriteFood>? data,
//   }) {
//     _status = status;
//     _message = message;
//     _data = data;
//   }

//   FavoriteFoodModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _message = json['message'];
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(FavoriteFood.fromJson(v));
//       });
//     }
//   }
//   bool? _status;
//   String? _message;
//   List<FavoriteFood>? _data;
//   FavoriteFoodModel copyWith({
//     bool? status,
//     String? message,
//     List<FavoriteFood>? data,
//   }) =>
//       FavoriteFoodModel(
//         status: status ?? _status,
//         message: message ?? _message,
//         data: data ?? _data,
//       );
//   bool? get status => _status;
//   String? get message => _message;
//   List<FavoriteFood>? get data => _data;

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

// /// food : {"menu_category":{"restaurant_code":"TNNN80RRT88N32T0","menu_code":"CKCC10CECTESHPKCPK1TC0","menu_name":"Chicken pizza-tes","menu_image":"https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"},"food_code":"SH500H42S44","food_name":"Cheese","food_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"TNNN80RRT88N32T0","maximum_count":5,"addon_name":"Cheese","price":20.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1,"ratings":null}
// /// user : {"id":"LXr7KmIHyQRGRD08gJd0mXnMQZ22","first_name":"Tester","last_name":"test","mobile_number":"254799143472","email":"test@gmail.com","user_type":"Client","date_created":"2022-10-07T03:16:53.456942Z","updated_on":"2022-10-07T03:16:53.456904Z"}
// /// date_created : "2022-10-09T20:34:22.641063Z"

// FavoriteFood dataFromJson(String str) =>
//     FavoriteFood.fromJson(json.decode(str));
// String dataToJson(FavoriteFood data) => json.encode(data.toJson());

// class FavoriteFood {
//   FavoriteFood({
//     Food? food,
//     User? user,
//     String? dateCreated,
//   }) {
//     _food = food;
//     _user = user;
//     _dateCreated = dateCreated;
//   }

//   FavoriteFood.fromJson(dynamic json) {
//     _food = json['food'] != null ? Food.fromJson(json['food']) : null;
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _dateCreated = json['date_created'];
//   }
//   Food? _food;
//   User? _user;
//   String? _dateCreated;
//   FavoriteFood copyWith({
//     Food? food,
//     User? user,
//     String? dateCreated,
//   }) =>
//       FavoriteFood(
//         food: food ?? _food,
//         user: user ?? _user,
//         dateCreated: dateCreated ?? _dateCreated,
//       );
//   Food? get food => _food;
//   User? get user => _user;
//   String? get dateCreated => _dateCreated;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_food != null) {
//       map['food'] = _food?.toJson();
//     }
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     map['date_created'] = _dateCreated;
//     return map;
//   }
// }

// /// id : "LXr7KmIHyQRGRD08gJd0mXnMQZ22"
// /// first_name : "Tester"
// /// last_name : "test"
// /// mobile_number : "254799143472"
// /// email : "test@gmail.com"
// /// user_type : "Client"
// /// date_created : "2022-10-07T03:16:53.456942Z"
// /// updated_on : "2022-10-07T03:16:53.456904Z"


// /// menu_category : {"restaurant_code":"TNNN80RRT88N32T0","menu_code":"CKCC10CECTESHPKCPK1TC0","menu_name":"Chicken pizza-tes","menu_image":"https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"}
// /// food_code : "SH500H42S44"
// /// food_name : "Cheese"
// /// food_image : "https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
// /// food_content : "Fish,tomato,onions"
// /// description : "Food for the hungry"
// /// price : 100.0
// /// tax : "10"
// /// discount : 10
// /// discount_rate : "2"
// /// add_ons : [{"id":1,"restaurant_code":"TNNN80RRT88N32T0","maximum_count":5,"addon_name":"Cheese","price":20.0,"isRequired":false}]
// /// preparation_time : "30mins"
// /// is_in_stock : true
// /// discount_active : false
// /// show_preparation_time : true
// /// serving_hours : 1
// /// ratings : null



// /// id : 1
// /// restaurant_code : "TNNN80RRT88N32T0"
// /// maximum_count : 5
// /// addon_name : "Cheese"
// /// price : 20.0
// /// isRequired : false


// /// restaurant_code : "TNNN80RRT88N32T0"
// /// menu_code : "CKCC10CECTESHPKCPK1TC0"
// /// menu_name : "Chicken pizza-tes"
// /// menu_image : "https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
// // To parse this JSON data, do
// //
// //     final favoriteFoodModel = favoriteFoodModelFromJson(jsonString);

// // TODO NEW Endpoint for favourite Food

// // import 'dart:convert';

// // FavoriteFoodModel favoriteFoodModelFromJson(String str) => FavoriteFoodModel.fromJson(json.decode(str));

// // String favoriteFoodModelToJson(FavoriteFoodModel data) => json.encode(data.toJson());

// // class FavoriteFoodModel {
// //     FavoriteFoodModel({
// //         required this.status,
// //         required this.message,
// //         required this.restaurant,
// //         required this.food,
// //         required this.rooms,
// //         required this.menu,
// //     });

// //     bool status;
// //     String message;
// //     Restaurant restaurant;
// //     List<Food> food;
// //     List<dynamic> rooms;
// //     List<dynamic> menu;

// //     factory FavoriteFoodModel.fromJson(Map<String, dynamic> json) => FavoriteFoodModel(
// //         status: json["status"],
// //         message: json["message"],
// //         restaurant: Restaurant.fromJson(json["restaurant"]),
// //         food: List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
// //         rooms: List<dynamic>.from(json["rooms"].map((x) => x)),
// //         menu: List<dynamic>.from(json["menu"].map((x) => x)),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "status": status,
// //         "message": message,
// //         "restaurant": restaurant.toJson(),
// //         "food": List<dynamic>.from(food.map((x) => x.toJson())),
// //         "rooms": List<dynamic>.from(rooms.map((x) => x)),
// //         "menu": List<dynamic>.from(menu.map((x) => x)),
// //     };
// // }

// // class Food {
// //     Food({
// //         required this.id,
// //         required this.menuCategory,
// //         required this.variants,
// //         required this.foodAddons,
// //         this.taxObject,
// //         required this.branch,
// //         this.servingHoursId,
// //         required this.foodCode,
// //         required this.foodName,
// //         required this.foodImage,
// //         required this.foodContent,
// //         required this.description,
// //         required this.price,
// //         required this.discount,
// //         required this.discountRate,
// //         this.servingHours,
// //         required this.preparationTime,
// //         required this.isInStock,
// //         required this.discountActive,
// //         required this.showPreparationTime,
// //         required this.updatedOn,
// //         this.sidesJson,
// //         required this.dishCategory,
// //         this.addonsJson,
// //         required this.dateCreated,
// //         this.deletedAt,
// //         this.sides,
// //         this.addons,
// //         this.taxId,
// //     });

// //     String id;
// //     MenuCategory menuCategory;
// //     List<Variant> variants;
// //     dynamic foodAddons;
// //     List<TaxObject>? taxObject;
// //     Restaurant branch;
// //     ServingHoursId? servingHoursId;
// //     String foodCode;
// //     String foodName;
// //     String foodImage;
// //     String foodContent;
// //     String description;
// //     int price;
// //     int discount;
// //     String discountRate;
// //     dynamic servingHours;
// //     String preparationTime;
// //     bool isInStock;
// //     bool discountActive;
// //     bool showPreparationTime;
// //     DateTime updatedOn;
// //     dynamic sidesJson;
// //     String dishCategory;
// //     dynamic addonsJson;
// //     DateTime dateCreated;
// //     dynamic deletedAt;
// //     dynamic sides;
// //     dynamic addons;
// //     dynamic taxId;

// //     factory Food.fromJson(Map<String, dynamic> json) => Food(
// //         id: json["id"],
// //         menuCategory: MenuCategory.fromJson(json["menu_category"]),
// //         variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
// //         foodAddons: json["food_addons"],
// //         taxObject: json["tax_object"] == null ? [] : List<TaxObject>.from(json["tax_object"]!.map((x) => TaxObject.fromJson(x))),
// //         branch: Restaurant.fromJson(json["branch"]),
// //         servingHoursId: json["serving_hours_id"] == null ? null : ServingHoursId.fromJson(json["serving_hours_id"]),
// //         foodCode: json["food_code"],
// //         foodName: json["food_name"],
// //         foodImage: json["food_image"],
// //         foodContent: json["food_content"],
// //         description: json["description"],
// //         price: json["price"],
// //         discount: json["discount"],
// //         discountRate: json["discount_rate"],
// //         servingHours: json["serving_hours"],
// //         preparationTime: json["preparation_time"],
// //         isInStock: json["is_in_stock"],
// //         discountActive: json["discount_active"],
// //         showPreparationTime: json["show_preparation_time"],
// //         updatedOn: DateTime.parse(json["updated_on"]),
// //         sidesJson: json["sides_json"],
// //         dishCategory: json["dish_category"],
// //         addonsJson: json["addons_json"],
// //         dateCreated: DateTime.parse(json["date_created"]),
// //         deletedAt: json["deleted_at"],
// //         sides: json["sides"],
// //         addons: json["addons"],
// //         taxId: json["tax_id"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "menu_category": menuCategory.toJson(),
// //         "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
// //         "food_addons": foodAddons,
// //         "tax_object": taxObject == null ? [] : List<dynamic>.from(taxObject!.map((x) => x.toJson())),
// //         "branch": branch.toJson(),
// //         "serving_hours_id": servingHoursId?.toJson(),
// //         "food_code": foodCode,
// //         "food_name": foodName,
// //         "food_image": foodImage,
// //         "food_content": foodContent,
// //         "description": description,
// //         "price": price,
// //         "discount": discount,
// //         "discount_rate": discountRate,
// //         "serving_hours": servingHours,
// //         "preparation_time": preparationTime,
// //         "is_in_stock": isInStock,
// //         "discount_active": discountActive,
// //         "show_preparation_time": showPreparationTime,
// //         "updated_on": updatedOn.toIso8601String(),
// //         "sides_json": sidesJson,
// //         "dish_category": dishCategory,
// //         "addons_json": addonsJson,
// //         "date_created": dateCreated.toIso8601String(),
// //         "deleted_at": deletedAt,
// //         "sides": sides,
// //         "addons": addons,
// //         "tax_id": taxId,
// //     };
// // }

// // class Restaurant {
// //     Restaurant({
// //         required this.id,
// //         required this.restaurantCode,
// //         required this.branchName,
// //         this.restaurantImage,
// //         required this.address,
// //         required this.firstContacts,
// //         required this.secondContacts,
// //         required this.email,
// //         this.rating,
// //         this.ratingStatus,
// //         required this.type,
// //         required this.latitude,
// //         required this.longitude,
// //         required this.updatedOn,
// //         required this.createdOn,
// //         this.deletedOn,
// //         required this.restaurant,
// //     });

// //     String id;
// //     String restaurantCode;
// //     String branchName;
// //     dynamic restaurantImage;
// //     String address;
// //     String firstContacts;
// //     String secondContacts;
// //     String email;
// //     dynamic rating;
// //     dynamic ratingStatus;
// //     DateTime type;
// //     double latitude;
// //     double longitude;
// //     DateTime updatedOn;
// //     DateTime createdOn;
// //     dynamic deletedOn;
// //     String restaurant;

// //     factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
// //         id: json["id"],
// //         restaurantCode: json["restaurant_code"],
// //         branchName: json["branch_name"],
// //         restaurantImage: json["restaurant_image"],
// //         address: json["address"],
// //         firstContacts: json["first_contacts"],
// //         secondContacts: json["second_contacts"],
// //         email: json["email"],
// //         rating: json["rating"],
// //         ratingStatus: json["rating_status"],
// //         type: DateTime.parse(json["type"]),
// //         latitude: json["latitude"]?.toDouble(),
// //         longitude: json["longitude"]?.toDouble(),
// //         updatedOn: DateTime.parse(json["updated_on"]),
// //         createdOn: DateTime.parse(json["created_on"]),
// //         deletedOn: json["deleted_on"],
// //         restaurant: json["restaurant"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "restaurant_code": restaurantCode,
// //         "branch_name": branchName,
// //         "restaurant_image": restaurantImage,
// //         "address": address,
// //         "first_contacts": firstContacts,
// //         "second_contacts": secondContacts,
// //         "email": email,
// //         "rating": rating,
// //         "rating_status": ratingStatus,
// //         "type": type.toIso8601String(),
// //         "latitude": latitude,
// //         "longitude": longitude,
// //         "updated_on": updatedOn.toIso8601String(),
// //         "created_on": createdOn.toIso8601String(),
// //         "deleted_on": deletedOn,
// //         "restaurant": restaurant,
// //     };
// // }

// // class FoodAddon {
// //     FoodAddon({
// //         required this.addon,
// //     });

// //     Addon addon;

// //     factory FoodAddon.fromJson(Map<String, dynamic> json) => FoodAddon(
// //         addon: Addon.fromJson(json["addon"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "addon": addon.toJson(),
// //     };
// // }

// // class Addon {
// //     Addon({
// //         required this.type,
// //         required this.price,
// //         required this.addonCode,
// //         required this.addonName,
// //         required this.isRequired,
// //         required this.maximumCount,
// //         required this.availableStatus,
// //     });

// //     String type;
// //     int price;
// //     String addonCode;
// //     String addonName;
// //     bool isRequired;
// //     int maximumCount;
// //     bool availableStatus;

// //     factory Addon.fromJson(Map<String, dynamic> json) => Addon(
// //         type: json["type"],
// //         price: json["price"],
// //         addonCode: json["addon_code"],
// //         addonName: json["addon_name"],
// //         isRequired: json["isRequired"],
// //         maximumCount: json["maximum_count"],
// //         availableStatus: json["available_status"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "type": type,
// //         "price": price,
// //         "addon_code": addonCode,
// //         "addon_name": addonName,
// //         "isRequired": isRequired,
// //         "maximum_count": maximumCount,
// //         "available_status": availableStatus,
// //     };
// // }

// // class MenuCategory {
// //     MenuCategory({
// //         required this.id,
// //         required this.sectionCode,
// //         required this.sectionName,
// //         required this.sectionImage,
// //         required this.updatedOn,
// //         required this.dateCreated,
// //         this.deletedAt,
// //         required this.menuId,
// //     });

// //     String id;
// //     String sectionCode;
// //     String sectionName;
// //     String sectionImage;
// //     DateTime updatedOn;
// //     DateTime dateCreated;
// //     dynamic deletedAt;
// //     String menuId;

// //     factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
// //         id: json["id"],
// //         sectionCode: json["section_code"],
// //         sectionName: json["section_name"],
// //         sectionImage: json["section_image"],
// //         updatedOn: DateTime.parse(json["updated_on"]),
// //         dateCreated: DateTime.parse(json["date_created"]),
// //         deletedAt: json["deleted_at"],
// //         menuId: json["menu_id"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "section_code": sectionCode,
// //         "section_name": sectionName,
// //         "section_image": sectionImage,
// //         "updated_on": updatedOn.toIso8601String(),
// //         "date_created": dateCreated.toIso8601String(),
// //         "deleted_at": deletedAt,
// //         "menu_id": menuId,
// //     };
// // }

// // class ServingHoursId {
// //     ServingHoursId({
// //         required this.id,
// //         this.day,
// //         required this.servingType,
// //         required this.fromTime,
// //         required this.toTime,
// //         required this.created,
// //     });

// //     String id;
// //     dynamic day;
// //     String servingType;
// //     String fromTime;
// //     String toTime;
// //     DateTime created;

// //     factory ServingHoursId.fromJson(Map<String, dynamic> json) => ServingHoursId(
// //         id: json["id"],
// //         day: json["day"],
// //         servingType: json["serving_type"],
// //         fromTime: json["from_time"],
// //         toTime: json["to_time"],
// //         created: DateTime.parse(json["created"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "day": day,
// //         "serving_type": servingType,
// //         "from_time": fromTime,
// //         "to_time": toTime,
// //         "created": created.toIso8601String(),
// //     };
// // }

// // class TaxObject {
// //     TaxObject({
// //         required this.tax,
// //     });

// //     Tax tax;

// //     factory TaxObject.fromJson(Map<String, dynamic> json) => TaxObject(
// //         tax: Tax.fromJson(json["tax"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "tax": tax.toJson(),
// //     };
// // }

// // class Tax {
// //     Tax({
// //         required this.taxCode,
// //         required this.taxRate,
// //         required this.taxType,
// //         required this.isActive,
// //         required this.taxPrice,
// //         required this.isRequired,
// //     });

// //     String taxCode;
// //     String taxRate;
// //     String taxType;
// //     bool isActive;
// //     int taxPrice;
// //     bool isRequired;

// //     factory Tax.fromJson(Map<String, dynamic> json) => Tax(
// //         taxCode: json["tax_code"],
// //         taxRate: json["tax_rate"],
// //         taxType: json["tax_type"],
// //         isActive: json["is_active"],
// //         taxPrice: json["tax_price"],
// //         isRequired: json["is_required"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "tax_code": taxCode,
// //         "tax_rate": taxRate,
// //         "tax_type": taxType,
// //         "is_active": isActive,
// //         "tax_price": taxPrice,
// //         "is_required": isRequired,
// //     };
// // }

// // class Variant {
// //     Variant({
// //         required this.name,
// //         required this.values,
// //     });

// //     String name;
// //     List<Value> values;

// //     factory Variant.fromJson(Map<String, dynamic> json) => Variant(
// //         name: json["name"],
// //         values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "name": name,
// //         "values": List<dynamic>.from(values.map((x) => x.toJson())),
// //     };
// // }

// // class Value {
// //     Value({
// //         required this.price,
// //         required this.valueName,
// //     });

// //     int price;
// //     String valueName;

// //     factory Value.fromJson(Map<String, dynamic> json) => Value(
// //         price: json["price"],
// //         valueName: json["value_name"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "price": price,
// //         "value_name": valueName,
// //     };
// // }
