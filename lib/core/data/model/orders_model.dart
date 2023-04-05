import 'dart:convert';

import 'favoriteRestaurantModel.dart';
import 'login/login_response.dart';
import 'order_item.dart';
// import 'restaurant_model.dart';

/// status : true
/// message : "Fullfilled Orders fetched"
/// data : [{"order_id":"8c37920a-50c6-4fa6-9bea-e5d256d6910f","user":{"id":"CMVzhjR9H3aUm1ombBVfXxA887x1","first_name":"Maven","last_name":"wechuli","mobile_number":"254799143482","email":"mavin.thebhub@gmail.com","user_type":"Client","date_created":"2022-10-19T04:09:55.556646Z","updated_on":"2022-10-19T04:09:55.556627Z"},"restaurant":{"restaurant_code":"SVRES8RE81VOT8L8SI2V","branch_name":"Carlitos Two rivers","restaurant_image":"https://images.unsplash.com/photo-1648227132835-24a6405b2fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG9","address":"P.O BOX 254 Two rivers","first_contacts":"254743143383","second_contacts":" 254743143361","email":"carlitosq@gmail.com","latitude":0.087,"longitude":12.0937},"table":null,"order_item":[{"food":{"menu_category":{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"ZS0MAAA0ALSL0LAP","menu_name":"Chicken Stew","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},"food_code":"OOEOOCCCB5EE6COE","food_name":"Boiled rice","food_image":"https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":7,"restaurant_code":"SVRES8RE81VOT8L8SI2V","maximum_count":3,"addon_name":"Stew","price":200.0,"isRequired":true}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":5,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-10-31T12:11:45.654849Z","get_total_discount_item_price":10,"get_final_price":100.0},{"food":{"menu_category":{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"SZAAS5SMAZSA8","menu_name":"Small pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},"food_code":"EDE7IRF5FEI5EI7","food_name":"Fried beef","food_image":"https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":7,"restaurant_code":"SVRES8RE81VOT8L8SI2V","maximum_count":3,"addon_name":"Stew","price":200.0,"isRequired":true}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":5,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-10-31T12:11:56.173314Z","get_total_discount_item_price":10,"get_final_price":100.0}],"isOrdered":true,"isPaid":false,"payment_option":"('Paynow',)","payment_mode":"('Cash',)","coupon":null,"order_type":"('Takeaway',)","order_status":"('Ordered',)","ordered_date":"2022-10-31T12:12:19.368166Z","get_total":200.0,"update_at":"2022-10-31T12:12:19.361904Z"}]

OrdersModel ordersModelFromJson(String str) =>
    OrdersModel.fromJson(json.decode(str));
String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    bool? status,
    String? message,
    List<Orders>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  OrdersModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Orders.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Orders>? _data;
  OrdersModel copyWith({
    bool? status,
    String? message,
    List<Orders>? data,
  }) =>
      OrdersModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  List<Orders>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// order_id : "8c37920a-50c6-4fa6-9bea-e5d256d6910f"
/// user : {"id":"CMVzhjR9H3aUm1ombBVfXxA887x1","first_name":"Maven","last_name":"wechuli","mobile_number":"254799143482","email":"mavin.thebhub@gmail.com","user_type":"Client","date_created":"2022-10-19T04:09:55.556646Z","updated_on":"2022-10-19T04:09:55.556627Z"}
/// restaurant : {"restaurant_code":"SVRES8RE81VOT8L8SI2V","branch_name":"Carlitos Two rivers","restaurant_image":"https://images.unsplash.com/photo-1648227132835-24a6405b2fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG9","address":"P.O BOX 254 Two rivers","first_contacts":"254743143383","second_contacts":" 254743143361","email":"carlitosq@gmail.com","latitude":0.087,"longitude":12.0937}
/// table : null
/// order_item : [{"food":{"menu_category":{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"ZS0MAAA0ALSL0LAP","menu_name":"Chicken Stew","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},"food_code":"OOEOOCCCB5EE6COE","food_name":"Boiled rice","food_image":"https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":7,"restaurant_code":"SVRES8RE81VOT8L8SI2V","maximum_count":3,"addon_name":"Stew","price":200.0,"isRequired":true}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":5,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-10-31T12:11:45.654849Z","get_total_discount_item_price":10,"get_final_price":100.0},{"food":{"menu_category":{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"SZAAS5SMAZSA8","menu_name":"Small pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},"food_code":"EDE7IRF5FEI5EI7","food_name":"Fried beef","food_image":"https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":7,"restaurant_code":"SVRES8RE81VOT8L8SI2V","maximum_count":3,"addon_name":"Stew","price":200.0,"isRequired":true}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":5,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-10-31T12:11:56.173314Z","get_total_discount_item_price":10,"get_final_price":100.0}]
/// isOrdered : true
/// isPaid : false
/// payment_option : "('Paynow',)"
/// payment_mode : "('Cash',)"
/// coupon : null
/// order_type : "('Takeaway',)"
/// order_status : "('Ordered',)"
/// ordered_date : "2022-10-31T12:12:19.368166Z"
/// get_total : 200.0
/// update_at : "2022-10-31T12:12:19.361904Z"

Orders dataFromJson(String str) => Orders.fromJson(json.decode(str));
String dataToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    String? orderId,
    User? user,
    Restaurant? restaurant,
    dynamic table,
    List<OrderItem>? orderItem,
    bool? isOrdered,
    bool? isPaid,
    String? paymentOption,
    String? paymentMode,
    dynamic coupon,
    String? orderType,
    String? orderStatus,
    String? orderedDate,
    double? getTotal,
    String? updateAt,
  }) {
    _orderId = orderId;
    _user = user;
    _restaurant = restaurant;
    _table = table;
    _orderItem = orderItem;
    _isOrdered = isOrdered;
    _isPaid = isPaid;
    _paymentOption = paymentOption;
    _paymentMode = paymentMode;
    _coupon = coupon;
    _orderType = orderType;
    _orderStatus = orderStatus;
    _orderedDate = orderedDate;
    _getTotal = getTotal;
    _updateAt = updateAt;
  }

  Orders.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _restaurant = json['restaurant'] != null
        ? Restaurant.fromJson(json['restaurant'])
        : null;
    _table = json['table'];
    if (json['order_item'] != null) {
      _orderItem = [];
      json['order_item'].forEach((v) {
        _orderItem?.add(OrderItem.fromJson(v));
      });
    }
    _isOrdered = json['isOrdered'];
    _isPaid = json['isPaid'];
    _paymentOption = json['payment_option'];
    _paymentMode = json['payment_mode'];
    _coupon = json['coupon'];
    _orderType = json['order_type'];
    _orderStatus = json['order_status'];
    _orderedDate = json['ordered_date'];
    _getTotal = json['get_total'];
    _updateAt = json['update_at'];
  }
  String? _orderId;
  User? _user;
  Restaurant? _restaurant;
  dynamic _table;
  List<OrderItem>? _orderItem;
  bool? _isOrdered;
  bool? _isPaid;
  String? _paymentOption;
  String? _paymentMode;
  dynamic _coupon;
  String? _orderType;
  String? _orderStatus;
  String? _orderedDate;
  double? _getTotal;
  String? _updateAt;
  Orders copyWith({
    String? orderId,
    User? user,
    Restaurant? restaurant,
    dynamic table,
    List<OrderItem>? orderItem,
    bool? isOrdered,
    bool? isPaid,
    String? paymentOption,
    String? paymentMode,
    dynamic coupon,
    String? orderType,
    String? orderStatus,
    String? orderedDate,
    double? getTotal,
    String? updateAt,
  }) =>
      Orders(
        orderId: orderId ?? _orderId,
        user: user ?? _user,
        restaurant: restaurant ?? _restaurant,
        table: table ?? _table,
        orderItem: orderItem ?? _orderItem,
        isOrdered: isOrdered ?? _isOrdered,
        isPaid: isPaid ?? _isPaid,
        paymentOption: paymentOption ?? _paymentOption,
        paymentMode: paymentMode ?? _paymentMode,
        coupon: coupon ?? _coupon,
        orderType: orderType ?? _orderType,
        orderStatus: orderStatus ?? _orderStatus,
        orderedDate: orderedDate ?? _orderedDate,
        getTotal: getTotal ?? _getTotal,
        updateAt: updateAt ?? _updateAt,
      );
  String? get orderId => _orderId;
  User? get user => _user;
  Restaurant? get restaurant => _restaurant;
  dynamic get table => _table;
  List<OrderItem>? get orderItem => _orderItem;
  bool? get isOrdered => _isOrdered;
  bool? get isPaid => _isPaid;
  String? get paymentOption => _paymentOption;
  String? get paymentMode => _paymentMode;
  dynamic get coupon => _coupon;
  String? get orderType => _orderType;
  String? get orderStatus => _orderStatus;
  String? get orderedDate => _orderedDate;
  double? get getTotal => _getTotal;
  String? get updateAt => _updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_restaurant != null) {
      map['restaurant'] = _restaurant?.toJson();
    }
    map['table'] = _table;
    if (_orderItem != null) {
      map['order_item'] = _orderItem?.map((v) => v.toJson()).toList();
    }
    map['isOrdered'] = _isOrdered;
    map['isPaid'] = _isPaid;
    map['payment_option'] = _paymentOption;
    map['payment_mode'] = _paymentMode;
    map['coupon'] = _coupon;
    map['order_type'] = _orderType;
    map['order_status'] = _orderStatus;
    map['ordered_date'] = _orderedDate;
    map['get_total'] = _getTotal;
    map['update_at'] = _updateAt;
    return map;
  }
}
