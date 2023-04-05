// To parse this JSON data, do
//
//     final NewRestaurantDetail = NewRestaurantDetailFromJson(jsonString);

import 'dart:convert';

import 'favoriteRestaurantModel.dart';
import 'menu_model.dart';
import 'restaurant_model.dart';

NewRestaurantDetail NewRestaurantDetailFromJson(String str) =>
    NewRestaurantDetail.fromJson(json.decode(str));

String NewRestaurantDetailToJson(NewRestaurantDetail data) =>
    json.encode(data.toJson());

class NewRestaurantDetail {
  NewRestaurantDetail({
    required this.status,
    required this.message,
    required this.restaurant,
    required this.food,
    required this.rooms,
    required this.menu,
  });

  bool status;
  String message;
  Restaurant restaurant;
  List<Food> food;
  List<Room> rooms;
  List<Menu> menu;

  factory NewRestaurantDetail.fromJson(Map<String, dynamic> json) =>
      NewRestaurantDetail(
        status: json["status"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        food: List<Food>.from(json["food"].map((x) => Food.fromJson(x))),
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "restaurant": restaurant.toJson(),
        "food": List<dynamic>.from(food.map((x) => x.toJson())),
        "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Food {
  Food({
    required this.id,
    required this.menuCategory,
    this.variants,
    this.foodAddons,
    this.taxObject,
    required this.branch,
    this.servingHoursId,
    required this.foodCode,
    required this.foodName,
    required this.foodImage,
    required this.foodContent,
    required this.description,
    required this.price,
    required this.discount,
    required this.discountRate,
    this.servingHours,
    required this.preparationTime,
    required this.isInStock,
    this.favoriteUserId,
    required this.discountActive,
    required this.showPreparationTime,
    required this.isFavorite,
    required this.updatedOn,
    this.sidesJson,
    this.dishCategory,
    this.addonsJson,
    required this.dateCreated,
    this.deletedAt,
    this.sides,
    this.addons,
    this.taxId,
  });

  String id;
  MenuCategory menuCategory;
  List<Variant>? variants;
  dynamic foodAddons;
  List<TaxObject>? taxObject;
  Restaurant branch;
  ServingHoursId? servingHoursId;
  String foodCode;
  String foodName;
  String foodImage;
  String foodContent;
  String description;
  double price;
  int discount;
  String discountRate;
  String? servingHours;
  String preparationTime;
  bool isInStock;
  dynamic favoriteUserId;
  bool discountActive;
  bool showPreparationTime;
  bool isFavorite;
  DateTime updatedOn;
  String? sidesJson;
  String? dishCategory;
  String? addonsJson;
  DateTime dateCreated;
  dynamic deletedAt;
  dynamic sides;
  dynamic addons;
  dynamic taxId;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        menuCategory: MenuCategory.fromJson(json["menu_category"]),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        foodAddons: json["food_addons"],
        taxObject: json["tax_object"] == null
            ? []
            : List<TaxObject>.from(
                json["tax_object"]!.map((x) => TaxObject.fromJson(x))),
        branch: Restaurant.fromJson(json["branch"]),
        servingHoursId: json["serving_hours_id"] == null
            ? null
            : ServingHoursId.fromJson(json["serving_hours_id"]),
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
        isFavorite: json["is_favorite"],
        updatedOn: DateTime.parse(json["updated_on"]),
        sidesJson: json["sides_json"],
        dishCategory: json["dish_category"],
        addonsJson: json["addons_json"],
        dateCreated: DateTime.parse(json["date_created"]),
        deletedAt: json["deleted_at"],
        sides: json["sides"],
        addons: json["addons"],
        taxId: json["tax_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menu_category": menuCategory.toJson(),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "food_addons": foodAddons,
        "tax_object": taxObject == null
            ? []
            : List<dynamic>.from(taxObject!.map((x) => x.toJson())),
        "branch": branch.toJson(),
        "serving_hours_id": servingHoursId?.toJson(),
        "food_code": foodCode,
        "food_name": foodName,
        "food_image": foodImage,
        "food_content": foodContent,
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
        "is_favorite": isFavorite,
        "updated_on": updatedOn.toIso8601String(),
        "sides_json": sidesJson,
        "dish_category": dishCategory,
        "addons_json": addonsJson,
        "date_created": dateCreated.toIso8601String(),
        "deleted_at": deletedAt,
        "sides": sides,
        "addons": addons,
        "tax_id": taxId,
      };
}

// class Restaurant {
//   Restaurant({
//     required this.id,
//     required this.restaurantCode,
//     required this.branchName,
//     required this.restaurantImage,
//     required this.address,
//     required this.firstContacts,
//     required this.secondContacts,
//     required this.email,
//     this.rating,
//     this.ratingStatus,
//     required this.type,
//     required this.latitude,
//     required this.longitude,
//     required this.updatedOn,
//     required this.createdOn,
//     this.deletedOn,
//     required this.restaurant,
//   });

//   String id;
//   String restaurantCode;
//   Address branchName;
//   String restaurantImage;
//   Address address;
//   String firstContacts;
//   String secondContacts;
//   Email email;
//   dynamic rating;
//   dynamic ratingStatus;
//   DateTime type;
//   double latitude;
//   double longitude;
//   DateTime updatedOn;
//   DateTime createdOn;
//   dynamic deletedOn;
//   String restaurant;

//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         restaurantCode: json["restaurant_code"],
//         branchName: addressValues.map[json["branch_name"]]!,
//         restaurantImage: json["restaurant_image"],
//         address: addressValues.map[json["address"]]!,
//         firstContacts: json["first_contacts"],
//         secondContacts: json["second_contacts"],
//         email: emailValues.map[json["email"]]!,
//         rating: json["rating"],
//         ratingStatus: json["rating_status"],
//         type: DateTime.parse(json["type"]),
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         updatedOn: DateTime.parse(json["updated_on"]),
//         createdOn: DateTime.parse(json["created_on"]),
//         deletedOn: json["deleted_on"],
//         restaurant: json["restaurant"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "restaurant_code": restaurantCode,
//         "branch_name": addressValues.reverse[branchName],
//         "restaurant_image": restaurantImage,
//         "address": addressValues.reverse[address],
//         "first_contacts": firstContacts,
//         "second_contacts": secondContacts,
//         "email": emailValues.reverse[email],
//         "rating": rating,
//         "rating_status": ratingStatus,
//         "type": type.toIso8601String(),
//         "latitude": latitude,
//         "longitude": longitude,
//         "updated_on": updatedOn.toIso8601String(),
//         "created_on": createdOn.toIso8601String(),
//         "deleted_on": deletedOn,
//         "restaurant": restaurant,
//       };
// }

enum Address { NAIROBI }

final addressValues = EnumValues({"Nairobi": Address.NAIROBI});

enum Email { NAIROBI_GMAIL_COM }

final emailValues = EnumValues({"nairobi@gmail.com": Email.NAIROBI_GMAIL_COM});

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

//   String id;
//   dynamic sectionCode;
//   String sectionName;
//   dynamic sectionImage;
//   DateTime updatedOn;
//   DateTime dateCreated;
//   dynamic deletedAt;
//   String menuId;

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
//         "updated_on": updatedOn.toIso8601String(),
//         "date_created": dateCreated.toIso8601String(),
//         "deleted_at": deletedAt,
//         "menu_id": menuId,
//       };
// }

class ServingHoursId {
  ServingHoursId({
    required this.id,
    this.day,
    required this.servingType,
    required this.fromTime,
    required this.toTime,
    required this.created,
  });

  String id;
  dynamic day;
  String servingType;
  String fromTime;
  String toTime;
  DateTime created;

  factory ServingHoursId.fromJson(Map<String, dynamic> json) => ServingHoursId(
        id: json["id"],
        day: json["day"],
        servingType: json["serving_type"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "serving_type": servingType,
        "from_time": fromTime,
        "to_time": toTime,
        "created": created.toIso8601String(),
      };
}

class TaxObject {
  TaxObject({
    required this.tax,
  });

  Tax tax;

  factory TaxObject.fromJson(Map<String, dynamic> json) => TaxObject(
        tax: Tax.fromJson(json["tax"]),
      );

  Map<String, dynamic> toJson() => {
        "tax": tax.toJson(),
      };
}

class Tax {
  Tax({
    required this.taxCode,
    required this.taxRate,
    required this.taxType,
    required this.isActive,
    required this.taxPrice,
    required this.isRequired,
  });

  String taxCode;
  String taxRate;
  String taxType;
  bool isActive;
  double taxPrice;
  bool isRequired;

  factory Tax.fromJson(Map<String, dynamic> json) => Tax(
        taxCode: json["tax_code"],
        taxRate: json["tax_rate"],
        taxType: json["tax_type"],
        isActive: json["is_active"],
        taxPrice: json["tax_price"],
        isRequired: json["is_required"],
      );

  Map<String, dynamic> toJson() => {
        "tax_code": taxCode,
        "tax_rate": taxRate,
        "tax_type": taxType,
        "is_active": isActive,
        "tax_price": taxPrice,
        "is_required": isRequired,
      };
}

class Variant {
  Variant({
    required this.name,
    required this.values,
  });

  String name;
  List<Value> values;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        name: json["name"],
        values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "values": List<dynamic>.from(values.map((x) => x.toJson())),
      };
}

class Value {
  Value({
    required this.price,
    required this.valueName,
  });

  String price;
  String valueName;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        price: json["price"],
        valueName: json["value_name"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "value_name": valueName,
      };
}

class Menu {
  Menu({
    required this.id,
    required this.menuCode,
    required this.menuName,
    required this.menuImage,
    required this.isActive,
    required this.updatedOn,
    required this.dateCreated,
    required this.branch,
  });

  String id;
  String menuCode;
  String menuName;
  String menuImage;
  bool isActive;
  DateTime updatedOn;
  DateTime dateCreated;
  String branch;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        menuCode: json["menu_code"],
        menuName: json["menu_name"],
        menuImage: json["menu_image"],
        isActive: json["is_active"],
        updatedOn: DateTime.parse(json["updated_on"]),
        dateCreated: DateTime.parse(json["date_created"]),
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menu_code": menuCode,
        "menu_name": menuName,
        "menu_image": menuImage,
        "is_active": isActive,
        "updated_on": updatedOn.toIso8601String(),
        "date_created": dateCreated.toIso8601String(),
        "branch": branch,
      };
}

class Room {
  Room({
    required this.id,
    required this.personPerTable,
    required this.roomNumber,
    required this.placeName,
    required this.placeType,
    required this.maximumTables,
    required this.isDeleted,
    required this.updatedOn,
    required this.dateCreated,
    this.deletedAt,
    required this.restaurantbranchCode,
  });

  String id;
  String personPerTable;
  String roomNumber;
  String placeName;
  PlaceType placeType;
  String maximumTables;
  bool isDeleted;
  DateTime updatedOn;
  DateTime dateCreated;
  dynamic deletedAt;
  String restaurantbranchCode;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        personPerTable: json["person_per_table"],
        roomNumber: json["room_number"],
        placeName: json["place_name"],
        placeType: placeTypeValues.map[json["place_type"]]!,
        maximumTables: json["maximum_tables"],
        isDeleted: json["is_deleted"],
        updatedOn: DateTime.parse(json["updated_on"]),
        dateCreated: DateTime.parse(json["date_created"]),
        deletedAt: json["deleted_at"],
        restaurantbranchCode: json["restaurantbranch_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "person_per_table": personPerTable,
        "room_number": roomNumber,
        "place_name": placeName,
        "place_type": placeTypeValues.reverse[placeType],
        "maximum_tables": maximumTables,
        "is_deleted": isDeleted,
        "updated_on": updatedOn.toIso8601String(),
        "date_created": dateCreated.toIso8601String(),
        "deleted_at": deletedAt,
        "restaurantbranch_code": restaurantbranchCode,
      };
}

enum PlaceType { AREA, ROOM }

final placeTypeValues =
    EnumValues({"Area": PlaceType.AREA, "Room": PlaceType.ROOM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
