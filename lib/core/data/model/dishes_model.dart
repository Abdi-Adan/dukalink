import 'dart:convert';

import 'menu_model.dart';
import 'newFavoriteFoodModel.dart';

/// status : true
/// message : "Food fetched"
/// data : [{"menu_category":{"restaurant_code":"RRRR8UUR","menu_code":"IPL6P0032I52IP6L","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"},"food_code":"I8864844H","food_name":"Fish","food_image":"http://placeimg.com/640/480/animals","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":2,"restaurant_code":"2R1IH81T8T2IH","maximum_count":5,"addon_name":"tomato","price":200.0,"isRequired":false},{"id":35,"restaurant_code":"2R1IH81T8T2IH","maximum_count":3,"addon_name":"onions","price":200.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1},{"menu_category":{"restaurant_code":"RRRR8UUR","menu_code":"IPL6P0032I52IP6L","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"},"food_code":"3EZ6Z3IIZ4","food_name":"Maize","food_image":"http://placeimg.com/640/480/animals","food_content":"Roasted potato","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"RRRR8UUR","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":2,"restaurant_code":"2R1IH81T8T2IH","maximum_count":5,"addon_name":"tomato","price":200.0,"isRequired":false},{"id":35,"restaurant_code":"2R1IH81T8T2IH","maximum_count":3,"addon_name":"onions","price":200.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1},{"menu_category":{"restaurant_code":"RRRR8UUR","menu_code":"IPL6P0032I52IP6L","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"},"food_code":"2B1DD2B25D0","food_name":"Budger","food_image":"http://placeimg.com/640/480/animals","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"RRRR8UUR","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1}]

DishesModel dishesModelFromJson(String str) =>
    DishesModel.fromJson(json.decode(str));
String dishesModelToJson(DishesModel data) => json.encode(data.toJson());

class DishesModel {
    DishesModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String? message;
    List<FavoriteFood>? data;

    factory DishesModel.fromJson(Map<String, dynamic> json) => DishesModel(
        status: json["status"],
        message: json["message"],
        data: List<FavoriteFood>.from(json["data"].map((x) => FavoriteFood.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}



/// menu_category : {"restaurant_code":"RRRR8UUR","menu_code":"IPL6P0032I52IP6L","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"}
/// food_code : "I8864844H"
/// food_name : "Fish"
/// food_image : "http://placeimg.com/640/480/animals"
/// food_content : "Fish,tomato,onions"
/// description : "Food for the hungry"
/// price : 100.0
/// tax : "10"
/// discount : 10
/// discount_rate : "2"
/// add_ons : [{"id":2,"restaurant_code":"2R1IH81T8T2IH","maximum_count":5,"addon_name":"tomato","price":200.0,"isRequired":false},{"id":35,"restaurant_code":"2R1IH81T8T2IH","maximum_count":3,"addon_name":"onions","price":200.0,"isRequired":false}]
/// preparation_time : "30mins"
/// is_in_stock : true
/// discount_active : false
/// show_preparation_time : true
/// serving_hours : 1

// Food dataFromJson(String str) => Food.fromJson(json.decode(str));
// String dataToJson(Food data) => json.encode(data.toJson());

// class Food {
//     Food({
//         required this.id,
//         required this.menuCategory,
//         this.variants,
//         this.foodAddons,
//         this.taxObject,
//         this.branch,
//         this.servingHoursId,
//         required this.foodCode,
//         required this.foodName,
//         required this.foodImage,
//         required this.foodContent,
//         required this.description,
//         required this.price,
//         this.discount,
//         required this.discountRate,
//         required this.servingHours,
//         required this.preparationTime,
//         required this.isInStock,
//         required this.favoriteUserId,
//         required this.discountActive,
//         required this.showPreparationTime,
//         required this.isFavorite,
//         required this.updatedOn,
//         required this.sidesJson,
//         this.dishCategory,
//         required this.addonsJson,
//         required this.dateCreated,
//         this.deletedAt,
//         this.sides,
//         this.addons,
//         this.taxId,
//     });

//     String? id;
//     MenuCategory? menuCategory;
//     dynamic variants;
//     dynamic foodAddons;
//     dynamic taxObject;
//     dynamic branch;
//     dynamic servingHoursId;
//     String? foodCode;
//     String? foodName;
//     String? foodImage;
//     String? foodContent;
//     String? description;
//     double? price;
//     dynamic discount;
//     String? discountRate;
//     String? servingHours;
//     String? preparationTime;
//     bool? isInStock;
//     String? favoriteUserId;
//     bool? discountActive;
//     bool? showPreparationTime;
//     bool? isFavorite;
//     DateTime? updatedOn;
//     String? sidesJson;
//     dynamic dishCategory;
//     String? addonsJson;
//     DateTime? dateCreated;
//     dynamic deletedAt;
//     dynamic sides;
//     dynamic addons;
//     dynamic taxId;

//     factory Food.fromJson(Map<String, dynamic> json) => Food(
//         id: json["id"],
//         menuCategory: MenuCategory.fromJson(json["menu_category"]),
//         variants: json["variants"],
//         foodAddons: json["food_addons"],
//         taxObject: json["tax_object"],
//         branch: json["branch"],
//         servingHoursId: json["serving_hours_id"],
//         foodCode: json["food_code"],
//         foodName: json["food_name"],
//         foodImage: json["food_image"],
//         foodContent: json["food_content"],
//         description: json["description"],
//         price: json["price"],
//         discount: json["discount"],
//         discountRate: json["discount_rate"],
//         servingHours: json["serving_hours"],
//         preparationTime: json["preparation_time"],
//         isInStock: json["is_in_stock"],
//         favoriteUserId: json["favorite_user_id"],
//         discountActive: json["discount_active"],
//         showPreparationTime: json["show_preparation_time"],
//         isFavorite: json["is_favorite"],
//         updatedOn: DateTime.parse(json["updated_on"]),
//         sidesJson: json["sides_json"],
//         dishCategory: json["dish_category"],
//         addonsJson: json["addons_json"],
//         dateCreated: DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         sides: json["sides"],
//         addons: json["addons"],
//         taxId: json["tax_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "menu_category": menuCategory!.toJson(),
//         "variants": variants,
//         "food_addons": foodAddons,
//         "tax_object": taxObject,
//         "branch": branch,
//         "serving_hours_id": servingHoursId,
//         "food_code": foodCode,
//         "food_name": foodName,
//         "food_image": foodImage,
//         "food_content": foodContent,
//         "description": description,
//         "price": price,
//         "discount": discount,
//         "discount_rate": discountRate,
//         "serving_hours": servingHours,
//         "preparation_time": preparationTime,
//         "is_in_stock": isInStock,
//         "favorite_user_id": favoriteUserId,
//         "discount_active": discountActive,
//         "show_preparation_time": showPreparationTime,
//         "is_favorite": isFavorite,
//         "updated_on": updatedOn!.toIso8601String(),
//         "sides_json": sidesJson,
//         "dish_category": dishCategory,
//         "addons_json": addonsJson,
//         "date_created": dateCreated!.toIso8601String(),
//         "deleted_at": deletedAt,
//         "sides": sides,
//         "addons": addons,
//         "tax_id": taxId,
//     };
// }


/// id : 2
/// restaurant_code : "2R1IH81T8T2IH"
/// maximum_count : 5
/// addon_name : "tomato"
/// price : 200.0
/// isRequired : false

AddOns addOnsFromJson(String str) => AddOns.fromJson(json.decode(str));
String addOnsToJson(AddOns data) => json.encode(data.toJson());

class AddOns {
  AddOns({
    dynamic? id,
    String? restaurantCode,
    dynamic? maximumCount,
    String? addonName,
    double? price,
    bool? isRequired,
  }) {
    _id = id;
    _restaurantCode = restaurantCode;
    _maximumCount = maximumCount;
    _addonName = addonName;
    _price = price;
    _isRequired = isRequired;
  }

  AddOns.fromJson(dynamic json) {
    _id = json['id'];
    _restaurantCode = json['restaurant_code'];
    _maximumCount = json['maximum_count'];
    _addonName = json['addon_name'];
    _price = json['price'];
    _isRequired = json['isRequired'];
  }
  dynamic? _id;
  String? _restaurantCode;
  dynamic? _maximumCount;
  String? _addonName;
  double? _price;
  bool? _isRequired;
  AddOns copyWith({
    dynamic? id,
    String? restaurantCode,
    dynamic? maximumCount,
    String? addonName,
    double? price,
    bool? isRequired,
  }) =>
      AddOns(
        id: id ?? _id,
        restaurantCode: restaurantCode ?? _restaurantCode,
        maximumCount: maximumCount ?? _maximumCount,
        addonName: addonName ?? _addonName,
        price: price ?? _price,
        isRequired: isRequired ?? _isRequired,
      );
  dynamic? get id => _id;
  String? get restaurantCode => _restaurantCode;
  dynamic? get maximumCount => _maximumCount;
  String? get addonName => _addonName;
  double? get price => _price;
  bool? get isRequired => _isRequired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['restaurant_code'] = _restaurantCode;
    map['maximum_count'] = _maximumCount;
    map['addon_name'] = _addonName;
    map['price'] = _price;
    map['isRequired'] = _isRequired;
    return map;
  }
}

class Sides {
  Sides({
    dynamic? id,
    String? restaurantCode,
    dynamic? maximumCount,
    String? sideName,
    double? price,
    bool? isRequired,
  }) {
    _id = id;
    _restaurantCode = restaurantCode;
    _maximumCount = maximumCount;
    _sideName = sideName;
    _price = price;
    _isRequired = isRequired;
  }

  Sides.fromJson(dynamic json) {
    _id = json['id'];
    _restaurantCode = json['restaurant_code'];
    _maximumCount = json['maximum_count'];
    _sideName = json['side_name'];
    _price = json['price'];
    _isRequired = json['isRequired'];
  }
  dynamic? _id;
  String? _restaurantCode;
  dynamic? _maximumCount;
  String? _sideName;
  double? _price;
  bool? _isRequired;
  Sides copyWith({
    dynamic? id,
    String? restaurantCode,
    dynamic? maximumCount,
    String? sideName,
    double? price,
    bool? isRequired,
  }) =>
      Sides(
        id: id ?? _id,
        restaurantCode: restaurantCode ?? _restaurantCode,
        maximumCount: maximumCount ?? _maximumCount,
        sideName: sideName ?? _sideName,
        price: price ?? _price,
        isRequired: isRequired ?? _isRequired,
      );
  dynamic? get id => _id;
  String? get restaurantCode => _restaurantCode;
  dynamic? get maximumCount => _maximumCount;
  String? get sideName => _sideName;
  double? get price => _price;
  bool? get isRequired => _isRequired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['restaurant_code'] = _restaurantCode;
    map['maximum_count'] = _maximumCount;
    map['side_name'] = _sideName;
    map['price'] = _price;
    map['isRequired'] = _isRequired;
    return map;
  }
}


// class Food {
//   Food({
//     MenuCategory? menuCategory,
//     String? foodCode,
//     String? foodName,
//     String? foodImage,
//     String? foodContent,
//     String? description,
//     double? price,
//     String? tax,
//     dynamic? discount,
//     String? discountRate,
//     List<AddOns>? addOns,
//     List<Sides>? sides,
//     String? preparationTime,
//     bool? isInStock,
//     bool? discountActive,
//     bool? showPreparationTime,
//     dynamic? servingHours,
//     dynamic? ratings,
//   }) {
//     _menuCategory = menuCategory;
//     _foodCode = foodCode;
//     _foodName = foodName;
//     _foodImage = foodImage;
//     _foodContent = foodContent;
//     _description = description;
//     _price = price;
//     _tax = tax;
//     _discount = discount;
//     _discountRate = discountRate;
//     _addOns = addOns;
//     _sides = sides;
//     _preparationTime = preparationTime;
//     _isInStock = isInStock;
//     _discountActive = discountActive;
//     _showPreparationTime = showPreparationTime;
//     _servingHours = servingHours;
//     _ratings = ratings;
//   }

//   Food.fromJson(dynamic json) {
//     _menuCategory = json['menu_category'] != null
//         ? MenuCategory.fromJson(json['menu_category'])
//         : null;
//     _foodCode = json['food_code'];
//     _foodName = json['food_name'];
//     _foodImage = json['food_image'];
//     _foodContent = json['food_content'];
//     _description = json['description'];
//     _price = json['price'];
//     _ratings = json['ratings'];
//     _tax = json['tax'];
//     _discount = json['discount'];
//     _discountRate = json['discount_rate'];
//     if (json['add_ons'] != null) {
//       _addOns = [];
//       json['add_ons'].forEach((v) {
//         _addOns?.add(AddOns.fromJson(v));
//       });
//     }
//     if (json['sides'] != null) {
//       _sides = [];
//       json['sides'].forEach((v) {
//         _sides?.add(Sides.fromJson(v));
//       });
//     }
//     _preparationTime = json['preparation_time'];
//     _isInStock = json['is_in_stock'];
//     _discountActive = json['discount_active'];
//     _showPreparationTime = json['show_preparation_time'];
//     _servingHours = json['serving_hours'];
//   }
//   MenuCategory? _menuCategory;
//   String? _foodCode;
//   String? _foodName;
//   String? _foodImage;
//   String? _foodContent;
//   String? _description;
//   double? _price;
//   String? _tax;
//   dynamic? _discount;
//   String? _discountRate;
//   List<AddOns>? _addOns;
//   List<Sides>? _sides;
//   String? _preparationTime;
//   bool? _isInStock;
//   bool? _discountActive;
//   bool? _showPreparationTime;
//   dynamic? _servingHours;
//   dynamic? _ratings;
//   Food copyWith({
//     MenuCategory? menuCategory,
//     String? foodCode,
//     String? foodName,
//     String? foodImage,
//     String? foodContent,
//     String? description,
//     double? price,
//     String? tax,
//     dynamic? discount,
//     String? discountRate,
//     List<AddOns>? addOns,
//     List<Sides>? sides,
//     String? preparationTime,
//     bool? isInStock,
//     bool? discountActive,
//     bool? showPreparationTime,
//     dynamic? servingHours,
//     dynamic? ratings,
//   }) =>
//       Food(
//         menuCategory: menuCategory ?? _menuCategory,
//         foodCode: foodCode ?? _foodCode,
//         foodName: foodName ?? _foodName,
//         foodImage: foodImage ?? _foodImage,
//         foodContent: foodContent ?? _foodContent,
//         description: description ?? _description,
//         price: price ?? _price,
//         tax: tax ?? _tax,
//         discount: discount ?? _discount,
//         discountRate: discountRate ?? _discountRate,
//         addOns: addOns ?? _addOns,
//         sides: sides ?? _sides,
//         preparationTime: preparationTime ?? _preparationTime,
//         isInStock: isInStock ?? _isInStock,
//         discountActive: discountActive ?? _discountActive,
//         showPreparationTime: showPreparationTime ?? _showPreparationTime,
//         servingHours: servingHours ?? _servingHours,
//         ratings: ratings ?? _ratings,
//       );
//   MenuCategory? get menuCategory => _menuCategory;
//   String? get foodCode => _foodCode;
//   String? get foodName => _foodName;
//   String? get foodImage => _foodImage;
//   String? get foodContent => _foodContent;
//   String? get description => _description;
//   double? get price => _price;
//   String? get tax => _tax;
//   dynamic? get discount => _discount;
//   String? get discountRate => _discountRate;
//   List<AddOns>? get addOns => _addOns;
//   List<Sides>? get sides => _sides;
//   String? get preparationTime => _preparationTime;
//   bool? get isInStock => _isInStock;
//   bool? get discountActive => _discountActive;
//   bool? get showPreparationTime => _showPreparationTime;
//   dynamic? get servingHours => _servingHours;
//   dynamic? get ratings => _ratings;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_menuCategory != null) {
//       map['menu_category'] = _menuCategory?.toJson();
//     }
//     map['food_code'] = _foodCode;
//     map['food_name'] = _foodName;
//     map['food_image'] = _foodImage;
//     map['food_content'] = _foodContent;
//     map['description'] = _description;
//     map['price'] = _price;
//     map['tax'] = _tax;
//     map['discount'] = _discount;
//     map['discount_rate'] = _discountRate;
//     if (_addOns != null) {
//       map['add_ons'] = _addOns?.map((v) => v.toJson()).toList();
//     }
//     if (_sides != null) {
//       map['sides'] = _sides?.map((v) => v.toJson()).toList();
//     }
//     map['preparation_time'] = _preparationTime;
//     map['is_in_stock'] = _isInStock;
//     map['discount_active'] = _discountActive;
//     map['show_preparation_time'] = _showPreparationTime;
//     map['serving_hours'] = _servingHours;
//     map['ratings'] = _ratings;
//     return map;
//   }
// }
