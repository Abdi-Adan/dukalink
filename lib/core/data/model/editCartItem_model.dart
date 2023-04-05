// To parse this JSON data, do
//
//     final editItemQuantity = editItemQuantityFromJson(jsonString);

import 'dart:convert';

EditItemQuantity editItemQuantityFromJson(String str) =>
    EditItemQuantity.fromJson(json.decode(str));

String editItemQuantityToJson(EditItemQuantity data) =>
    json.encode(data.toJson());

class EditItemQuantity {
  EditItemQuantity({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<CartData>? data;

  factory EditItemQuantity.fromJson(Map<String, dynamic> json) =>
      EditItemQuantity(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CartData>.from(
                json["data"]!.map((x) => CartData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CartData {
  CartData({
    this.quantity,
    this.amount,
  });

  int? quantity;
  double? amount;

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        quantity: json["quantity"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "amount": amount,
      };
}
