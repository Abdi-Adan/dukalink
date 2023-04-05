// // To parse this JSON data, do
// //
// //     final restaurantAvailableTables = restaurantAvailableTablesFromJson(jsonString);

// import 'dart:convert';

// List<RestaurantAvailableTables> restaurantAvailableTablesFromJson(String str) => List<RestaurantAvailableTables>.from(json.decode(str).map((x) => RestaurantAvailableTables.fromJson(x)));

// String restaurantAvailableTablesToJson(List<RestaurantAvailableTables> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class RestaurantAvailableTables {
//     RestaurantAvailableTables({
//         this.id,
//         this.roomId,
//         this.tableName,
//         this.tableNumber,
//         this.updatedOn,
//         this.created,
//     });

//     String? id;
//     RoomId? roomId;
//     String? tableName;
//     String? tableNumber;
//     DateTime? updatedOn;
//     DateTime? created;

//     factory RestaurantAvailableTables.fromJson(Map<String, dynamic> json) => RestaurantAvailableTables(
//         id: json["id"],
//         roomId: json["room_id"] == null ? null : RoomId.fromJson(json["room_id"]),
//         tableName: json["table_name"],
//         tableNumber: json["table_number"],
//         updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
//         created: json["created"] == null ? null : DateTime.parse(json["created"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "room_id": roomId?.toJson(),
//         "table_name": tableName,
//         "table_number": tableNumber,
//         "updated_on": updatedOn?.toIso8601String(),
//         "created": created?.toIso8601String(),
//     };
// }

// class RoomId {
//     RoomId({
//         this.id,
//         this.personPerTable,
//         this.roomNumber,
//         this.placeName,
//         this.placeType,
//         this.maximumTables,
//         this.isDeleted,
//         this.updatedOn,
//         this.dateCreated,
//         this.restaurantbranchCode,
//     });

//     String? id;
//     String? personPerTable;
//     String? roomNumber;
//     String? placeName;
//     String? placeType;
//     String? maximumTables;
//     bool? isDeleted;
//     DateTime? updatedOn;
//     DateTime? dateCreated;
//     String? restaurantbranchCode;

//     factory RoomId.fromJson(Map<String, dynamic> json) => RoomId(
//         id: json["id"],
//         personPerTable: json["person_per_table"],
//         roomNumber: json["room_number"],
//         placeName: json["place_name"],
//         placeType: json["place_type"],
//         maximumTables: json["maximum_tables"],
//         isDeleted: json["is_deleted"],
//         updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
//         dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
//         restaurantbranchCode: json["restaurantbranch_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "person_per_table": personPerTable,
//         "room_number": roomNumber,
//         "place_name": placeName,
//         "place_type": placeType,
//         "maximum_tables": maximumTables,
//         "is_deleted": isDeleted,
//         "updated_on": updatedOn?.toIso8601String(),
//         "date_created": dateCreated?.toIso8601String(),
//         "restaurantbranch_code": restaurantbranchCode,
//     };
// }
