// To parse this JSON data, do
//
//     final newFavoriteFoodModel = newFavoriteFoodModelFromJson(jsonString);

import 'dart:convert';

NewFavoriteFoodModel newFavoriteFoodModelFromJson(String str) => NewFavoriteFoodModel.fromJson(json.decode(str));

String newFavoriteFoodModelToJson(NewFavoriteFoodModel data) => json.encode(data.toJson());

class NewFavoriteFoodModel {
    NewFavoriteFoodModel({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    List<FavoriteFood>? data;

    factory NewFavoriteFoodModel.fromJson(Map<String, dynamic> json) => NewFavoriteFoodModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<FavoriteFood>.from(json["data"]!.map((x) => FavoriteFood.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class FavoriteFood {
    FavoriteFood({
        this.id,
        this.menuCategory,
        this.variants,
        this.foodAddons,
        this.taxObject,
        this.branch,
        this.servingHoursId,
        this.foodImageJson,
        this.foodCode,
        this.foodName,
        this.foodImage,
        this.foodContent,
        this.description,
        this.price,
        this.discount,
        this.discountRate,
        this.servingHours,
        this.preparationTime,
        this.isInStock,
        this.favoriteUserId,
        this.discountActive,
        this.showPreparationTime,
        this.maximumCount,
        this.isFavorite,
        this.updatedOn,
        this.isRequired,
        this.isVisible,
        this.sidesJson,
        this.dishCategory,
        this.addonsJson,
        this.dateCreated,
        this.taxId,
    });

  String? id;
  MenuCategory? menuCategory;
  List<Variant>? variants;
  List<FoodAddon>? foodAddons;
  List<TaxObject>? taxObject;
  Branch? branch;
  ServingHoursId? servingHoursId;
  List<FoodImageJson>? foodImageJson;
  String? foodCode;
  String? foodName;
  String? foodImage;
  String? foodContent;
  String? description;
  double? price;
  int? discount;
  String? discountRate;
  String? servingHours;
  String? preparationTime;
  bool? isInStock;
  String? favoriteUserId;
  bool? discountActive;
  bool? showPreparationTime;
  String? maximumCount;
  bool? isFavorite;
  DateTime? updatedOn;
  bool? isRequired;
  bool? isVisible;
  List<dynamic>? sidesJson;
  String? dishCategory;
  List<dynamic>? addonsJson;
  DateTime? dateCreated;
  dynamic? taxId;

    factory FavoriteFood.fromJson(Map<String, dynamic> json) => FavoriteFood(
        id: json["id"],
        menuCategory: json["menu_category"] == null
            ? null
            : MenuCategory.fromJson(json["menu_category"]),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        foodAddons: json["food_addons"] == null
            ? []
            : List<FoodAddon>.from(
                json["food_addons"]!.map((x) => FoodAddon.fromJson(x))),
        taxObject: json["tax_object"] == null
            ? []
            : List<TaxObject>.from(
                json["tax_object"]!.map((x) => TaxObject.fromJson(x))),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        servingHoursId: json["serving_hours_id"] == null ? null : ServingHoursId.fromJson(json["serving_hours_id"]),
        foodImageJson: json["food_image_json"] == null ? [] : List<FoodImageJson>.from(json["food_image_json"]!.map((x) => FoodImageJson.fromJson(x))),
        foodCode: json["food_code"],
        foodName: json["food_name"],
        foodImage: json["food_image"],
        foodContent: json["food_content"],
        description: json["description"],
        price: json["price"],
        discount: json["discount"],
        discountRate: json["discount_rate"],
        servingHours: json["serving_hours"],
        preparationTime: json["preparation_time"],
        isInStock: json["is_in_stock"],
        favoriteUserId: json["favorite_user_id"],
        discountActive: json["discount_active"],
        showPreparationTime: json["show_preparation_time"],
        maximumCount: json["maximum_count"],
        isFavorite: json["is_favorite"],
        updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
        isRequired: json["isRequired"],
        isVisible: json["isVisible"],
        sidesJson: json["sides_json"] == null
            ? []
            : List<dynamic>.from(json["sides_json"]!.map((x) => x)),
        dishCategory: json["dish_category"],
        addonsJson: json["addons_json"] == null
            ? []
            : List<dynamic>.from(json["addons_json"]!.map((x) => x)),
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        taxId: json["tax_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menu_category": menuCategory?.toJson(),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "food_addons": foodAddons == null
            ? []
            : List<dynamic>.from(foodAddons!.map((x) => x.toJson())),
        "tax_object": taxObject == null
            ? []
            : List<dynamic>.from(taxObject!.map((x) => x.toJson())),
        "branch": branch?.toJson(),
        "serving_hours_id": servingHoursId?.toJson(),
        "food_image_json": foodImageJson == null ? [] : List<dynamic>.from(foodImageJson!.map((x) => x.toJson())),
        "food_code": foodCode,
        "food_name": foodName,
        "food_image": foodImage,
        "food_content": foodContentValues.reverse[foodContent],
        "description": description,
        "price": price,
        "discount": discount,
        "discount_rate": discountRate,
        "serving_hours": servingHours,
        "preparation_time": preparationTime,
        "is_in_stock": isInStock,
        "favorite_user_id": favoriteUserId,
        "discount_active": discountActive,
        "show_preparation_time": showPreparationTime,
        "maximum_count": maximumCount,
        "is_favorite": isFavorite,
        "updated_on": updatedOn?.toIso8601String(),
        "isRequired": isRequired,
        "isVisible": isVisible,
        "sides_json": sidesJson == null
            ? []
            : List<dynamic>.from(sidesJson!.map((x) => x)),
        "dish_category": dishCategory,
        "addons_json": addonsJson == null
            ? []
            : List<dynamic>.from(addonsJson!.map((x) => x)),
        "date_created": dateCreated?.toIso8601String(),
        "tax_id": taxId,
    };
}

class Branch {
    Branch({
        this.id,
        this.restaurantCode,
        this.restaurant,
        this.branchName,
        this.restaurantImage,
        this.address,
        this.firstContacts,
        this.secondContacts,
        this.email,
        this.rating,
        this.ratingStatus,
        this.type,
        this.latitude,
        this.longitude,
        this.favoriteUserId,
        this.isFavorite,
        this.updatedOn,
        this.createdOn,
    });

    String? id;
    String? restaurantCode;
    Restaurant? restaurant;
    String? branchName;
    String? restaurantImage;
    String? address;
    String? firstContacts;
    String? secondContacts;
    String? email;
    String? rating;
    String? ratingStatus;
    String? type;
    double? latitude;
    double? longitude;
    String? favoriteUserId;
    bool? isFavorite;
    DateTime? updatedOn;
    DateTime? createdOn;

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        restaurantCode: json["restaurant_code"],
        restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
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
        updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
        createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_code": restaurantCode,
        "restaurant": restaurant?.toJson(),
        "branch_name": branchName,
        "restaurant_image": restaurantImage,
        "address": address,
        "first_contacts": firstContacts,
        "second_contacts": secondContacts,
        "email": branchEmailValues.reverse[email],
        "rating": rating,
        "rating_status": ratingStatus,
        "type": type,
        "latitude": latitude,
        "longitude": longitude,
        "favorite_user_id": favoriteUserId,
        "is_favorite": isFavorite,
        "updated_on": updatedOn?.toIso8601String(),
        "created_on": createdOn?.toIso8601String(),
    };
}

enum BranchAddress { KILIMANI }

final branchAddressValues = EnumValues({"KILIMANI": BranchAddress.KILIMANI});

enum BranchName { THE_ARABIAN_CUISINE_KILIMANI }

final branchNameValues = EnumValues(
    {"THE ARABIAN CUISINE KILIMANI": BranchName.THE_ARABIAN_CUISINE_KILIMANI});

enum BranchEmail { KASUTI26_GMAIL_COM }

final branchEmailValues =
    EnumValues({"kasuti26@gmail.com": BranchEmail.KASUTI26_GMAIL_COM});

class Restaurant {
    Restaurant({
        this.restaurantCode,
        this.resaurantBranch,
        this.restaurantName,
        this.restaurantImage,
        this.address,
        this.firstContacts,
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
  String? secondContacts;
  RestaurantEmail? email;
  double? latitude;
  double? longitude;

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        restaurantCode: json["restaurant_code"],
        resaurantBranch: json["resaurant_branch"],
        restaurantName: json["restaurant_name"],
        restaurantImage: json["restaurant_image"],
        address: json["address"],
        firstContacts: json["first_contacts"],
        secondContacts: json["second_contacts"],
        email: restaurantEmailValues.map[json["email"]],
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

enum RestaurantAddress { UPPERHILL }

final restaurantAddressValues =
    EnumValues({"Upperhill": RestaurantAddress.UPPERHILL});

enum RestaurantEmail { ARABIAN_GMAIL_COM }

final restaurantEmailValues =
    EnumValues({"arabian@gmail.com": RestaurantEmail.ARABIAN_GMAIL_COM});

enum ResaurantBranch { MAIN_BRANCH }

final resaurantBranchValues =
    EnumValues({"Main Branch": ResaurantBranch.MAIN_BRANCH});

enum RestaurantName { THE_ARABIAN_CUISINE }

final restaurantNameValues =
    EnumValues({"THE ARABIAN CUISINE": RestaurantName.THE_ARABIAN_CUISINE});

enum DishCategory { EXTRA, SIDE, MAIN_DISH }

final dishCategoryValues = EnumValues({
  "extra": DishCategory.EXTRA,
  "main-dish": DishCategory.MAIN_DISH,
  "side": DishCategory.SIDE
});

class FoodAddon {
    FoodAddon({
        this.addon,
    });

    Addon? addon;

    factory FoodAddon.fromJson(Map<String, dynamic> json) => FoodAddon(
        addon: json["addon"] == null ? null : Addon.fromJson(json["addon"]),
    );

    Map<String, dynamic> toJson() => {
        "addon": addon?.toJson(),
    };
}

class Addon {
    Addon({
        this.price,
        this.foodCode,
        this.foodName,
        this.foodImage,
        this.description,
        this.isInStock,
        this.foodContent,
        this.dishCategory,
    });

    double? price;
    String? foodCode;
    String? foodName;
    String? foodImage;
    String? description;
    bool? isInStock;
    String? foodContent;
    String? dishCategory;

    factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        price: json["price"],
        foodCode: json["food_code"],
        foodName: json["food_name"],
        foodImage: json["food_image"],
        description: json["description"],
        isInStock: json["is_in_stock"],
        foodContent: json["food_content"],
        dishCategory: json["dish_category"],
      );

    Map<String, dynamic> toJson() => {
        "price": price,
        "food_code": foodCode,
        "food_name": foodName,
        "food_image": foodImage,
        "description": description,
        "is_in_stock": isInStock,
        "food_content": foodContent,
        "dish_category": dishCategory,
    };
}

enum FoodContent { EMPTY, BEEF, RICE, CHICKEN }

final foodContentValues = EnumValues({
  "beef": FoodContent.BEEF,
  "chicken": FoodContent.CHICKEN,
  "": FoodContent.EMPTY,
  "rice": FoodContent.RICE
});

class FoodImageJson {
    FoodImageJson({
        this.url,
    });

    String? url;

    factory FoodImageJson.fromJson(Map<String, dynamic> json) => FoodImageJson(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

class MenuCategory {
    MenuCategory({
        this.id,
        this.sectionCode,
        this.sectionName,
        this.sectionImage,
        this.updatedOn,
        this.dateCreated,
        this.menuId,
    });

    String? id;
    String? sectionCode;
    String? sectionName;
    String? sectionImage;
    DateTime? updatedOn;
    DateTime? dateCreated;
    String? menuId;

    factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
        id: json["id"],
        sectionCode: json["section_code"],
        sectionName: json["section_name"],
        sectionImage: json["section_image"],
        updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        menuId: json["menu_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "section_code": sectionCode,
        "section_name": sectionName,
        "section_image": sectionImage,
        "updated_on": updatedOn?.toIso8601String(),
        "date_created": dateCreated?.toIso8601String(),
        "menu_id": menuId,
    };
}

class ServingHoursId {
    ServingHoursId({
        this.id,
        this.day,
        this.servingType,
        this.fromTime,
        this.toTime,
        this.created,
    });

    String? id;
    String? day;
    String? servingType;
    String? fromTime;
    String? toTime;
    DateTime? created;

    factory ServingHoursId.fromJson(Map<String, dynamic> json) => ServingHoursId(
        id: json["id"],
        day: json["day"],
        servingType: json["serving_type"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "serving_type": servingType,
        "from_time": fromTime,
        "to_time": toTime,
        "created": created?.toIso8601String(),
    };
}

enum ServingType { LUNCH_AND_DINNER, ALL }

final servingTypeValues = EnumValues(
    {"ALL": ServingType.ALL, "LUNCH AND DINNER": ServingType.LUNCH_AND_DINNER});

class TaxObject {
  TaxObject({
    this.tax,
  });

    Tax? tax;

  factory TaxObject.fromJson(Map<String, dynamic> json) => TaxObject(
        tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
    );

    Map<String, dynamic> toJson() => {
        "tax": tax?.toJson(),
    };
}

class Tax {
    Tax({
        this.taxCode,
        this.taxRate,
        this.taxType,
        this.isActive,
        this.taxPrice,
        this.isRequired,
    });

  TaxCode? taxCode;
  String? taxRate;
  TaxType? taxType;
  bool? isActive;
  double? taxPrice;
  bool? isRequired;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        taxCode: taxCodeValues.map[json["tax_code"]],
        taxRate: json["tax_rate"],
        taxType: taxTypeValues.map[json["tax_type"]],
        isActive: json["is_active"],
        taxPrice: json["tax_price"],
        isRequired: json["is_required"],
    );

  Map<String, dynamic> toJson() => {
        "tax_code": taxCodeValues.reverse[taxCode],
        "tax_rate": taxRate,
        "tax_type": taxTypeValues.reverse[taxType],
        "is_active": isActive,
        "tax_price": taxPrice,
        "is_required": isRequired,
    };
}

enum TaxCode { DAGT66715863, DAGT82245001 }

final taxCodeValues = EnumValues({
  "DAGT66715863": TaxCode.DAGT66715863,
  "DAGT82245001": TaxCode.DAGT82245001
});

enum TaxType { VAT, CTL }

final taxTypeValues = EnumValues({"CTL": TaxType.CTL, "VAT": TaxType.VAT});

class Variant {
  Variant({
    this.name,
    this.values,
  });

  String? name;
  List<Value>? values;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        name: json["name"],
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    this.price,
    this.valueName,
  });

  String? price;
  String? valueName;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        price: json["price"],
        valueName: json["value_name"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "value_name": valueName,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// class FoodAddon {
//     FoodAddon({
//         this.addon,
//     });

//     Addon? addon;

//     factory FoodAddon.fromJson(Map<String, dynamic> json) => FoodAddon(
//         addon: json["addon"] == null ? null : Addon.fromJson(json["addon"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "addon": addon?.toJson(),
//     };
// }






// // To parse this JSON data, do
// //
// //     final newFavoriteFoodModel = newFavoriteFoodModelFromJson(jsonString);

// import 'dart:convert';

// import 'favoriteRestaurantModel.dart';

// NewFavoriteFoodModel newFavoriteFoodModelFromJson(String str) =>
//     NewFavoriteFoodModel.fromJson(json.decode(str));

// String newFavoriteFoodModelToJson(NewFavoriteFoodModel data) =>
//     json.encode(data.toJson());

// class NewFavoriteFoodModel {
//   NewFavoriteFoodModel({
//     required this.status,
//     required this.data,
//   });

//   bool status;
//   List<FavoriteFood> data;

//   factory NewFavoriteFoodModel.fromJson(Map<String, dynamic> json) =>
//       NewFavoriteFoodModel(
//         status: json["status"],
//         data: List<FavoriteFood>.from(
//             json["data"].map((x) => FavoriteFood.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class FavoriteFood {
//   FavoriteFood({
//     required this.id,
//     this.menuCategory,
//     this.variants,
//     this.foodAddons,
//     this.taxObject,
//     this.branch,
//     this.servingHoursId,
//     required this.foodCode,
//     required this.foodName,
//     this.foodImage,
//     this.foodContent,
//     this.description,
//     required this.price,
//     this.discount,
//     this.discountRate,
//     this.servingHours,
//     this.preparationTime,
//     required this.isInStock,
//     this.favoriteUserId,
//     required this.discountActive,
//     required this.showPreparationTime,
//     required this.isFavorite,
//     required this.updatedOn,
//     this.sidesJson,
//     this.dishCategory,
//     this.addonsJson,
//     required this.dateCreated,
//     this.deletedAt,
//     this.sides,
//     this.addons,
//     this.taxId,
//   });

//   String? id;
//   MenuCategory? menuCategory;
//   List<Variant>? variants;
//   dynamic? foodAddons;
//   List<TaxObject>? taxObject;
//   Branch? branch;
//   ServingHoursId? servingHoursId;
//   String? foodCode;
//   String? foodName;
//   String? foodImage;
//   String? foodContent;
//   Description? description;
//   double? price;
//   int? discount;
//   String? discountRate;
//   String? servingHours;
//   String? preparationTime;
//   bool? isInStock;
//   String? favoriteUserId;
//   bool? discountActive;
//   bool? showPreparationTime;
//   bool? isFavorite;
//   DateTime? updatedOn;
//   SidesJson? sidesJson;
//   String? dishCategory;
//   String? addonsJson;
//   DateTime? dateCreated;
//   dynamic? deletedAt;
//   dynamic? sides;
//   dynamic? addons;
//   String? taxId;

//   factory FavoriteFood.fromJson(Map<String, dynamic> json) => FavoriteFood(
//         id: json["id"],
//         menuCategory: json["menu_category"] == null
//             ? null
//             : MenuCategory.fromJson(json["menu_category"]),
//         variants: (json["variants"] as List<dynamic>?)
//                 ?.map((x) => Variant.fromJson(x))
//                 .toList() ??
//             [],
//         foodAddons: json["food_addons"],
//         taxObject: (json["tax_object"] as List<dynamic>?)
//                 ?.map((x) => TaxObject.fromJson(x))
//                 .toList() ??
//             [],
//         branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
//         servingHoursId: json["serving_hours_id"] == null
//             ? null
//             : ServingHoursId.fromJson(json["serving_hours_id"]),
//         foodCode: json["food_code"],
//         foodName: json["food_name"],
//         foodImage: json["food_image"],
//         foodContent: json["food_content"],
//         description: descriptionValues.map[json["description"]],
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
//         sidesJson: sidesJsonValues.map[json["sides_json"]],
//         dishCategory: json["dish_category"],
//         addonsJson: json["addons_json"],
//         dateCreated: DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         sides: json["sides"],
//         addons: json["addons"],
//         taxId: json["tax_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "menu_category": menuCategory?.toJson(),
//         "variants": variants == null
//             ? []
//             : List<dynamic>.from(variants!.map((x) => x.toJson())),
//         "food_addons": foodAddons,
//         "tax_object": taxObject == null
//             ? []
//             : List<dynamic>.from(taxObject!.map((x) => x.toJson())),
//         "branch": branch?.toJson(),
//         "serving_hours_id": servingHoursId?.toJson(),
//         "food_code": foodCode,
//         "food_name": foodName,
//         "food_image": foodImage,
//         "food_content": foodContent,
//         "description": descriptionValues.reverse[description],
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
//         "updated_on": updatedOn?.toIso8601String(),
//         "sides_json": sidesJsonValues.reverse[sidesJson],
//         "dish_category": dishCategory,
//         "addons_json": addonsJson,
//         "date_created": dateCreated?.toIso8601String(),
//         "deleted_at": deletedAt,
//         "sides": sides,
//         "addons": addons,
//         "tax_id": taxId,
//       };
// }

// class Branch {
//   Branch({
//     required this.id,
//     required this.restaurantCode,
//     required this.restaurant,
//     required this.branchName,
//     this.restaurantImage,
//     required this.address,
//     required this.firstContacts,
//     required this.secondContacts,
//     required this.email,
//     this.rating,
//     this.ratingStatus,
//     required this.type,
//     required this.latitude,
//     required this.longitude,
//     this.favoriteUserId,
//     required this.isFavorite,
//     required this.updatedOn,
//     required this.createdOn,
//     this.deletedOn,
//   });

//   String? id;
//   String? restaurantCode;
//   Restaurant? restaurant;
//   BranchName? branchName;
//   String? restaurantImage;
//   Address? address;
//   String? firstContacts;
//   String? secondContacts;
//   Email? email;
//   dynamic? rating;
//   dynamic? ratingStatus;
//   String? type;
//   double? latitude;
//   double? longitude;
//   String? favoriteUserId;
//   bool? isFavorite;
//   DateTime? updatedOn;
//   DateTime? createdOn;
//   dynamic? deletedOn;

//   factory Branch.fromJson(Map<String, dynamic> json) => Branch(
//         id: json["id"],
//         restaurantCode: json["restaurant_code"],
//         restaurant: Restaurant.fromJson(json["restaurant"]),
//         branchName: branchNameValues.map[json["branch_name"]],
//         restaurantImage: json["restaurant_image"],
//         address: addressValues.map[json["address"]],
//         firstContacts: json["first_contacts"],
//         secondContacts: json["second_contacts"],
//         email: emailValues.map[json["email"]],
//         rating: json["rating"],
//         ratingStatus: json["rating_status"],
//         type: json["type"],
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         favoriteUserId: json["favorite_user_id"],
//         isFavorite: json["is_favorite"],
//         updatedOn: DateTime.parse(json["updated_on"]),
//         createdOn: DateTime.parse(json["created_on"]),
//         deletedOn: json["deleted_on"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "restaurant_code": restaurantCode,
//         "restaurant": restaurant?.toJson(),
//         "branch_name": branchNameValues.reverse[branchName],
//         "restaurant_image": restaurantImage,
//         "address": addressValues.reverse[address],
//         "first_contacts": firstContacts,
//         "second_contacts": secondContacts,
//         "email": emailValues.reverse[email],
//         "rating": rating,
//         "rating_status": ratingStatus,
//         "type": type,
//         "latitude": latitude,
//         "longitude": longitude,
//         "favorite_user_id": favoriteUserId,
//         "is_favorite": isFavorite,
//         "updated_on": updatedOn?.toIso8601String(),
//         "created_on": createdOn?.toIso8601String(),
//         "deleted_on": deletedOn,
//       };
// }

// enum Address { NAIROBI, THE_3_RD_FLOOR_PLAZA_2000 }

// final addressValues = EnumValues({
//   "Nairobi": Address.NAIROBI,
//   "3rd Floor Plaza 2000": Address.THE_3_RD_FLOOR_PLAZA_2000
// });

// enum BranchName { MAIN_BRANCH, NAIROBI }

// final branchNameValues = EnumValues(
//     {"Main Branch": BranchName.MAIN_BRANCH, "Nairobi": BranchName.NAIROBI});

// enum Email { NAIROBI_GMAIL_COM, GRANVILLE_WS_GMAIL_COM }

// final emailValues = EnumValues({
//   "granville.ws@gmail.com": Email.GRANVILLE_WS_GMAIL_COM,
//   "nairobi@gmail.com": Email.NAIROBI_GMAIL_COM
// });

// class Restaurant {
//   Restaurant({
//     required this.restaurantCode,
//     required this.resaurantBranch,
//     required this.restaurantName,
//     required this.restaurantImage,
//     this.address,
//     this.firstContacts,
//     this.secondContacts,
//     this.email,
//     this.latitude,
//     this.longitude,
//   });

//   String restaurantCode;
//   BranchName? resaurantBranch;
//   RestaurantName? restaurantName;
//   String restaurantImage;
//   String? address;
//   String? firstContacts;
//   dynamic secondContacts;
//   dynamic email;
//   dynamic latitude;
//   dynamic longitude;

//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         restaurantCode: json["restaurant_code"],
//         resaurantBranch: branchNameValues.map[json["resaurant_branch"]],
//         restaurantName: restaurantNameValues.map[json["restaurant_name"]],
//         restaurantImage: json["restaurant_image"],
//         address: json["address"],
//         firstContacts: json["first_contacts"],
//         secondContacts: json["second_contacts"],
//         email: json["email"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//       );

//   Map<String, dynamic> toJson() => {
//         "restaurant_code": restaurantCode,
//         "resaurant_branch": branchNameValues.reverse[resaurantBranch],
//         "restaurant_name": restaurantNameValues.reverse[restaurantName],
//         "restaurant_image": restaurantImage,
//         "address": address,
//         "first_contacts": firstContacts,
//         "second_contacts": secondContacts,
//         "email": email,
//         "latitude": latitude,
//         "longitude": longitude,
//       };
// }

// enum RestaurantName { BISTRO, JAVA_1 }

// final restaurantNameValues = EnumValues(
//     {"Bistro": RestaurantName.BISTRO, "JAVA 1": RestaurantName.JAVA_1});

// enum Description {
//   EMPTY,
//   TASTES_GOOD,
//   STEAMED_VEGETABLES,
//   NEW_MENU,
//   DESC,
//   SPECIAL_TEA,
//   DESCRIPTION_HERE,
//   FAST_FOOD,
//   CONTENT
// }

// final descriptionValues = EnumValues({
//   "content": Description.CONTENT,
//   "Desc": Description.DESC,
//   "Description here": Description.DESCRIPTION_HERE,
//   "": Description.EMPTY,
//   "Fast food": Description.FAST_FOOD,
//   "New Menu": Description.NEW_MENU,
//   "Special tea": Description.SPECIAL_TEA,
//   "steamed vegetables": Description.STEAMED_VEGETABLES,
//   "Tastes good": Description.TASTES_GOOD
// });

// class MenuCategory {
//   MenuCategory({
//     required this.id,
//     this.sectionCode,
//     required this.sectionName,
//     this.sectionImage,
//     required this.updatedOn,
//     required this.dateCreated,
//     this.deletedAt,
//     required this.menuId,
//   });

//   String? id;
//   dynamic? sectionCode;
//   String? sectionName;
//   dynamic? sectionImage;
//   DateTime? updatedOn;
//   DateTime? dateCreated;
//   dynamic? deletedAt;
//   String? menuId;

//   factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
//         id: json["id"],
//         sectionCode: json["section_code"],
//         sectionName: json["section_name"],
//         sectionImage: json["section_image"],
//         updatedOn: DateTime.parse(json["updated_on"]),
//         dateCreated: DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         menuId: json["menu_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "section_code": sectionCode,
//         "section_name": sectionName,
//         "section_image": sectionImage,
//         "updated_on": updatedOn?.toIso8601String(),
//         "date_created": dateCreated?.toIso8601String(),
//         "deleted_at": deletedAt,
//         "menu_id": menuId,
//       };
// }

// class ServingHoursId {
//   ServingHoursId({
//     required this.id,
//     this.day,
//     required this.servingType,
//     required this.fromTime,
//     required this.toTime,
//     required this.created,
//   });

//   String id;
//   dynamic day;
//   String servingType;
//   String fromTime;
//   String toTime;
//   DateTime created;

//   factory ServingHoursId.fromJson(Map<String, dynamic> json) => ServingHoursId(
//         id: json["id"],
//         day: json["day"],
//         servingType: json["serving_type"],
//         fromTime: json["from_time"],
//         toTime: json["to_time"],
//         created: DateTime.parse(json["created"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "day": day,
//         "serving_type": servingType,
//         "from_time": fromTime,
//         "to_time": toTime,
//         "created": created.toIso8601String(),
//       };
// }

// enum SidesJson { EMPTY, SIDES_JSON }

// final sidesJsonValues =
//     EnumValues({"{}": SidesJson.EMPTY, "\"{}\"": SidesJson.SIDES_JSON});

// class TaxObject {
//   TaxObject({
//     required this.tax,
//   });

//   Tax tax;

//   factory TaxObject.fromJson(Map<String, dynamic> json) => TaxObject(
//         tax: Tax.fromJson(json["tax"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "tax": tax.toJson(),
//       };
// }

// class Tax {
//   Tax({
//     required this.taxCode,
//     required this.taxRate,
//     required this.taxType,
//     required this.isActive,
//     required this.taxPrice,
//     required this.isRequired,
//   });

//   String? taxCode;
//   String? taxRate;
//   String? taxType;
//   bool? isActive;
//   double? taxPrice;
//   bool? isRequired;

//   factory Tax.fromJson(Map<String, dynamic> json) => Tax(
//         taxCode: json["tax_code"],
//         taxRate: json["tax_rate"],
//         taxType: json["tax_type"],
//         isActive: json["is_active"],
//         taxPrice: json["tax_price"],
//         isRequired: json["is_required"],
//       );

//   Map<String, dynamic> toJson() => {
//         "tax_code": taxCode,
//         "tax_rate": taxRate,
//         "tax_type": taxType,
//         "is_active": isActive,
//         "tax_price": taxPrice,
//         "is_required": isRequired,
//       };
// }

// class Variant {
//   Variant({
//     required this.name,
//     required this.values,
//   });

//   String? name;
//   List<Value>? values;

//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//         name: json["name"],
//         values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "values": List<dynamic>.from(values!.map((x) => x.toJson())),
//       };
// }

// class Value {
//   Value({
//     required this.price,
//     required this.valueName,
//   });

//   String? price;
//   String? valueName;

//   factory Value.fromJson(Map<String, dynamic> json) => Value(
//         price: json["price"],
//         valueName: json["value_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "price": price,
//         "value_name": valueName,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// TODO TO HERE


// To parse this JSON data, do
//
//     final newFavoriteFoodModel = newFavoriteFoodModelFromJson(jsonString);

// import 'dart:convert';

// NewFavoriteFoodModel newFavoriteFoodModelFromJson(String str) => NewFavoriteFoodModel.fromJson(json.decode(str));

// String newFavoriteFoodModelToJson(NewFavoriteFoodModel data) => json.encode(data.toJson());

// class NewFavoriteFoodModel {
//     NewFavoriteFoodModel({
//         required this.status,
//         required this.message,
//         required this.data,
//     });

//     bool status;
//     String message;
//     List<FavoriteFood> data;

//     factory NewFavoriteFoodModel.fromJson(Map<String, dynamic> json) => NewFavoriteFoodModel(
//         status: json["status"],
//         message: json["message"],
//         data: List<FavoriteFood>.from(json["data"].map((x) => FavoriteFood.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class FavoriteFood {
//     FavoriteFood({
//         required this.id,
//         required this.menuCategory,
//         required this.variants,
//         this.foodAddons,
//         required this.taxObject,
//         required this.branch,
//         required this.servingHoursId,
//         required this.foodCode,
//         required this.foodName,
//         required this.foodImage,
//         required this.foodContent,
//         required this.description,
//         required this.price,
//         required this.discount,
//         required this.discountRate,
//         this.servingHours,
//         required this.preparationTime,
//         required this.isInStock,
//         this.favoriteUserId,
//         required this.discountActive,
//         required this.showPreparationTime,
//         required this.isFavorite,
//         required this.updatedOn,
//         this.sidesJson,
//         required this.dishCategory,
//         this.addonsJson,
//         required this.dateCreated,
//         this.deletedAt,
//         this.sides,
//         this.addons,
//         this.taxId,
//     });

//     String id;
//     MenuCategory menuCategory;
//     List<Variant> variants;
//     dynamic foodAddons;
//     List<TaxObject> taxObject;
//     Branch branch;
//     ServingHoursId servingHoursId;
//     String foodCode;
//     String foodName;
//     String foodImage;
//     String foodContent;
//     String description;
//     double price;
//     int discount;
//     String discountRate;
//     dynamic servingHours;
//     String preparationTime;
//     bool isInStock;
//     dynamic favoriteUserId;
//     bool discountActive;
//     bool showPreparationTime;
//     bool isFavorite;
//     DateTime updatedOn;
//     dynamic sidesJson;
//     String dishCategory;
//     dynamic addonsJson;
//     DateTime dateCreated;
//     dynamic deletedAt;
//     dynamic sides;
//     dynamic addons;
//     dynamic taxId;

//     factory FavoriteFood.fromJson(Map<String, dynamic> json) => FavoriteFood(
//         id: json["id"],
//         menuCategory: MenuCategory.fromJson(json["menu_category"]),
//         variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
//         foodAddons: json["food_addons"],
//         taxObject: List<TaxObject>.from(json["tax_object"].map((x) => TaxObject.fromJson(x))),
//         branch: Branch.fromJson(json["branch"]),
//         servingHoursId: ServingHoursId.fromJson(json["serving_hours_id"]),
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
//         "menu_category": menuCategory.toJson(),
//         "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
//         "food_addons": foodAddons,
//         "tax_object": List<dynamic>.from(taxObject.map((x) => x.toJson())),
//         "branch": branch.toJson(),
//         "serving_hours_id": servingHoursId.toJson(),
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
//         "updated_on": updatedOn.toIso8601String(),
//         "sides_json": sidesJson,
//         "dish_category": dishCategory,
//         "addons_json": addonsJson,
//         "date_created": dateCreated.toIso8601String(),
//         "deleted_at": deletedAt,
//         "sides": sides,
//         "addons": addons,
//         "tax_id": taxId,
//     };
// }

// class Branch {
//     Branch({
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
//         this.favoriteUserId,
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
//     String type;
//     double latitude;
//     double longitude;
//     dynamic favoriteUserId;
//     bool isFavorite;
//     DateTime updatedOn;
//     DateTime createdOn;
//     dynamic deletedOn;

//     factory Branch.fromJson(Map<String, dynamic> json) => Branch(
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
//         type: json["type"],
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
//         "type": type,
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
//     Restaurant({
//         required this.restaurantCode,
//         required this.resaurantBranch,
//         required this.restaurantName,
//         this.restaurantImage,
//         this.address,
//         this.firstContacts,
//         this.secondContacts,
//         this.email,
//         this.latitude,
//         this.longitude,
//     });

//     String restaurantCode;
//     String resaurantBranch;
//     String restaurantName;
//     dynamic restaurantImage;
//     dynamic address;
//     dynamic firstContacts;
//     dynamic secondContacts;
//     dynamic email;
//     dynamic latitude;
//     dynamic longitude;

//     factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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

//     Map<String, dynamic> toJson() => {
//         "restaurant_code": restaurantCode,
//         "resaurant_branch": resaurantBranch,
//         "restaurant_name": restaurantName,
//         "restaurant_image": restaurantImage,
//         "address": address,
//         "first_contacts": firstContacts,
//         "second_contacts": secondContacts,
//         "email": email,
//         "latitude": latitude,
//         "longitude": longitude,
//     };
// }

// class MenuCategory {
//     MenuCategory({
//         required this.id,
//         this.sectionCode,
//         required this.sectionName,
//         required this.sectionImage,
//         required this.updatedOn,
//         required this.dateCreated,
//         this.deletedAt,
//         required this.menuId,
//     });

//     String id;
//     dynamic sectionCode;
//     String sectionName;
//     String sectionImage;
//     DateTime updatedOn;
//     DateTime dateCreated;
//     dynamic deletedAt;
//     String menuId;

//     factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
//         id: json["id"],
//         sectionCode: json["section_code"],
//         sectionName: json["section_name"],
//         sectionImage: json["section_image"],
//         updatedOn: DateTime.parse(json["updated_on"]),
//         dateCreated: DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         menuId: json["menu_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "section_code": sectionCode,
//         "section_name": sectionName,
//         "section_image": sectionImage,
//         "updated_on": updatedOn.toIso8601String(),
//         "date_created": dateCreated.toIso8601String(),
//         "deleted_at": deletedAt,
//         "menu_id": menuId,
//     };
// }

// class ServingHoursId {
//     ServingHoursId({
//         required this.id,
//         this.day,
//         required this.servingType,
//         required this.fromTime,
//         required this.toTime,
//         required this.created,
//     });

//     String id;
//     dynamic day;
//     String servingType;
//     String fromTime;
//     String toTime;
//     DateTime created;

//     factory ServingHoursId.fromJson(Map<String, dynamic> json) => ServingHoursId(
//         id: json["id"],
//         day: json["day"],
//         servingType: json["serving_type"],
//         fromTime: json["from_time"],
//         toTime: json["to_time"],
//         created: DateTime.parse(json["created"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "day": day,
//         "serving_type": servingType,
//         "from_time": fromTime,
//         "to_time": toTime,
//         "created": created.toIso8601String(),
//     };
// }

// class TaxObject {
//     TaxObject({
//         required this.tax,
//     });

//     Tax tax;

//     factory TaxObject.fromJson(Map<String, dynamic> json) => TaxObject(
//         tax: Tax.fromJson(json["tax"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "tax": tax.toJson(),
//     };
// }

// class Tax {
//     Tax({
//         required this.taxCode,
//         required this.taxRate,
//         required this.taxType,
//         required this.isActive,
//         required this.taxPrice,
//         required this.isRequired,
//     });

//     String taxCode;
//     String taxRate;
//     String taxType;
//     bool isActive;
//     double taxPrice;
//     bool isRequired;

//     factory Tax.fromJson(Map<String, dynamic> json) => Tax(
//         taxCode: json["tax_code"],
//         taxRate: json["tax_rate"],
//         taxType: json["tax_type"],
//         isActive: json["is_active"],
//         taxPrice: json["tax_price"],
//         isRequired: json["is_required"],
//     );

//     Map<String, dynamic> toJson() => {
//         "tax_code": taxCode,
//         "tax_rate": taxRate,
//         "tax_type": taxType,
//         "is_active": isActive,
//         "tax_price": taxPrice,
//         "is_required": isRequired,
//     };
// }

// class Variant {
//     Variant({
//         required this.name,
//         required this.values,
//     });

//     String name;
//     List<Value> values;

//     factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//         name: json["name"],
//         values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "values": List<dynamic>.from(values.map((x) => x.toJson())),
//     };
// }

// class Value {
//     Value({
//         required this.price,
//         required this.valueName,
//     });

//     String price;
//     String valueName;

//     factory Value.fromJson(Map<String, dynamic> json) => Value(
//         price: json["price"],
//         valueName: json["value_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "price": price,
//         "value_name": valueName,
//     };
// }
