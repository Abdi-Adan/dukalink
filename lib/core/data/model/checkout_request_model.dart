// To parse this JSON data, do
//
//     final checkoutRequestModel = checkoutRequestModelFromJson(jsonString);

import 'dart:convert';

CheckoutRequestModel checkoutRequestModelFromJson(String str) => CheckoutRequestModel.fromJson(json.decode(str));

String checkoutRequestModelToJson(CheckoutRequestModel data) => json.encode(data.toJson());

class CheckoutRequestModel {
    CheckoutRequestModel({
        this.cartItems,
        this.restaurantCode,
        this.tableId,
        this.paymentOption,
        this.paymentMode,
        this.orderType,
        this.amount,
        this.payingPhone,
        this.customerEmail,
        this.userId,
        this.customerPhone,
        this.deviceId,
    });

    List<CartItem>? cartItems;
    String? restaurantCode;
    String? tableId;
    String? paymentOption;
    String? paymentMode;
    String? orderType;
    int? amount;
    String? payingPhone;
    String? customerEmail;
    String? userId;
    String? customerPhone;
    String? deviceId;

    factory CheckoutRequestModel.fromJson(Map<String, dynamic> json) => CheckoutRequestModel(
        cartItems: json["cart_items"] == null ? [] : List<CartItem>.from(json["cart_items"]!.map((x) => CartItem.fromJson(x))),
        restaurantCode: json[" restaurant_code"],
        tableId: json["table_id"],
        paymentOption: json["payment_option"],
        paymentMode: json["payment_mode"],
        orderType: json["order_type"],
        amount: json["amount"],
        payingPhone: json["paying_phone"],
        customerEmail: json["customer_email"],
        userId: json["user_id"],
        customerPhone: json["customer_phone"],
        deviceId: json["device_id"],
    );

    Map<String, dynamic> toJson() => {
        "cart_items": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
        " restaurant_code": restaurantCode,
        "table_id": tableId,
        "payment_option": paymentOption,
        "payment_mode": paymentMode,
        "order_type": orderType,
        "amount": amount,
        "paying_phone": payingPhone,
        "customer_email": customerEmail,
        "user_id": userId,
        "customer_phone": customerPhone,
        "device_id": deviceId,
    };
}

class CartItem {
    CartItem({
        this.id,
    });

    String? id;

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
