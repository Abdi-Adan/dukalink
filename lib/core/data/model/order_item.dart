import 'dart:convert';

import 'package:dukalink_app/core/data/model/dishes_model.dart';

import 'new_orders_model.dart';

/// food : {"menu_category":{"restaurant_code":"TNNN80RRT88N32T0","menu_code":"CKCC10CECTESHPKCPK1TC0","menu_name":"Chicken pizza-tes","menu_image":"https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"},"food_code":"UA9AMMM992","food_name":"Mumea","food_image":"https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"TNNN80RRT88N32T0","maximum_count":5,"addon_name":"Cheese","price":20.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1,"ratings":null}
/// quantity : 1
/// ordered : false
/// date_created : "2022-10-07T03:46:37.245497Z"
/// get_total_discount_item_price : 10
/// get_final_price : 100.0

OrderItem orderItemFromJson(String str) => OrderItem.fromJson(json.decode(str));
String orderItemToJson(OrderItem data) => json.encode(data.toJson());

// class OrderItem {
//   OrderItem({
//     Food? food,
//     int? quantity,
//     bool? ordered,
//     String? dateCreated,
//     int? getTotalDiscountItemPrice,
//     double? getFinalPrice,
//   }) {
//     _food = food;
//     _quantity = quantity;
//     _ordered = ordered;
//     _dateCreated = dateCreated;
//     _getTotalDiscountItemPrice = getTotalDiscountItemPrice;
//     _getFinalPrice = getFinalPrice;
//   }

//   OrderItem.fromJson(dynamic json) {
//     _food = json['food'] != null ? Food.fromJson(json['food']) : null;
//     _quantity = json['quantity'];
//     _ordered = json['ordered'];
//     _dateCreated = json['date_created'];
//     _getTotalDiscountItemPrice = json['get_total_discount_item_price'];
//     _getFinalPrice = json['get_final_price'];
//   }
//   Food? _food;
//   int? _quantity;
//   bool? _ordered;
//   String? _dateCreated;
//   int? _getTotalDiscountItemPrice;
//   double? _getFinalPrice;
//   OrderItem copyWith({
//     Food? food,
//     int? quantity,
//     bool? ordered,
//     String? dateCreated,
//     int? getTotalDiscountItemPrice,
//     double? getFinalPrice,
//   }) =>
//       OrderItem(
//         food: food ?? _food,
//         quantity: quantity ?? _quantity,
//         ordered: ordered ?? _ordered,
//         dateCreated: dateCreated ?? _dateCreated,
//         getTotalDiscountItemPrice:
//             getTotalDiscountItemPrice ?? _getTotalDiscountItemPrice,
//         getFinalPrice: getFinalPrice ?? _getFinalPrice,
//       );
//   Food? get food => _food;
//   int? get quantity => _quantity;
//   bool? get ordered => _ordered;
//   String? get dateCreated => _dateCreated;
//   int? get getTotalDiscountItemPrice => _getTotalDiscountItemPrice;
//   double? get getFinalPrice => _getFinalPrice;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (_food != null) {
//       map['food'] = _food?.toJson();
//     }
//     map['quantity'] = _quantity;
//     map['ordered'] = _ordered;
//     map['date_created'] = _dateCreated;
//     map['get_total_discount_item_price'] = _getTotalDiscountItemPrice;
//     map['get_final_price'] = _getFinalPrice;
//     return map;
//   }
// }

//TODO To here
class OrderItem {
  OrderItem({
    this.quantity,
    this.deviceId,
    this.totalPrice,
    this.orderId,
    this.id,
    this.branch,
    this.ordered,
    this.updatedOn,
    this.food,
    this.additionalNotes,
  });

  int? quantity;
  String? deviceId;
  double? totalPrice;
  String? orderId;
  String? id;
  dynamic branch;
  bool? ordered;
  DateTime? updatedOn;
  Food? food;
  dynamic additionalNotes;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        quantity: json["quantity"],
        deviceId: json["device_id"],
        totalPrice: json["total_price"],
        orderId: json["order_id"],
        id: json["id"],
        branch: json["branch"],
        ordered: json["ordered"],
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        food: json["food"] == null ? null : Food.fromJson(json["food"]),
        additionalNotes: json["additional_notes"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "device_id": deviceId,
        "total_price": totalPrice,
        "order_id": orderId,
        "id": id,
        "branch": branch,
        "ordered": ordered,
        "updated_on": updatedOn?.toIso8601String(),
        "food": food?.toJson(),
        "additional_notes": additionalNotes,
      };
}
