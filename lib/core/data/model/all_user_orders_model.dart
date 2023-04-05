// import 'dart:convert';

// import 'package:dukalink_app/core/data/model/login/login_response.dart';
// import 'package:dukalink_app/core/data/model/order_item.dart';
// /// status : true
// /// message : "User Orders fetched"
// /// data : {"order_id":"140220ab-ab3d-4dc7-a444-9702034e7c73","user":{"id":"el2whafOEsgZk92E6EXzMSYWhhz2","first_name":"Wechuli","last_name":"Mavin","mobile_number":"254799143482","email":"maven@gmail.com","user_type":"Client","date_created":"2022-09-06T16:05:05.414149Z","updated_on":"2022-09-06T16:05:05.414125Z"},"table":null,"order_item":[{"food":{"menu_category":{"restaurant_code":"M6UM9M693M3M","menu_code":"ZISI0ZZPLZ0S9P44","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"},"food_code":"BGG46BBG54","food_name":"Budger","food_image":"https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1010&q=80","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":4,"restaurant_code":"JAVA1234DEG","maximum_count":23,"addon_name":"Kachumbari","price":300.0,"isRequired":false},{"id":5,"restaurant_code":"KFC1324FRA","maximum_count":32,"addon_name":"Baroquely","price":200.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-09-07T16:55:48.635064Z","get_total_discount_item_price":10,"get_final_price":100.0},{"food":{"menu_category":{"restaurant_code":"JAVA1234DEG","menu_code":"Lunch12","menu_name":"Lunch","menu_image":"https://images.unsplash.com/photo-1592861956120-e524fc739696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"},"food_code":"Lunfdh726823","food_name":"Big meal","food_image":"https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80","food_content":"Yeast, Wheat, FLour, Sugar","description":"food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital","price":23.0,"tax":"2","discount":2,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":2,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"SPice","price":20.0,"isRequired":false},{"id":3,"restaurant_code":"IAI42SVTV2VRAT16R1AAS1","maximum_count":4,"addon_name":"tomato","price":40.0,"isRequired":false},{"id":4,"restaurant_code":"JAVA1234DEG","maximum_count":23,"addon_name":"Kachumbari","price":300.0,"isRequired":false}],"preparation_time":null,"is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":3,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-09-07T23:02:19.061789Z","get_total_discount_item_price":2,"get_final_price":23.0}],"isPaid":false,"isOrdered":false,"coupon":null,"order_status":"Ordered","ordered_date":"2022-09-21T15:28:58.865909Z","get_total":123.0}

// AllUserOrders allUserOrdersFromJson(String str) => AllUserOrders.fromJson(json.decode(str));
// String allUserOrdersToJson(AllUserOrders data) => json.encode(data.toJson());
// class AllUserOrders {
//   AllUserOrders({
//       bool? status, 
//       String? message, 
//       Orders? data,}){
//     _status = status;
//     _message = message;
//     _data = data;
// }

//   AllUserOrders.fromJson(dynamic json) {
//     _status = json['status'];
//     _message = json['message'];
//     _data = json['data'] != null ? Orders.fromJson(json['data']) : null;
//   }
//   bool? _status;
//   String? _message;
//   Orders? _data;
// AllUserOrders copyWith({  bool? status,
//   String? message,
//   Orders? data,
// }) => AllUserOrders(  status: status ?? _status,
//   message: message ?? _message,
//   data: data ?? _data,
// );
//   bool? get status => _status;
//   String? get message => _message;
//   Orders? get data => _data;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['message'] = _message;
//     if (_data != null) {
//       map['data'] = _data?.toJson();
//     }
//     return map;
//   }

// }

// /// order_id : "140220ab-ab3d-4dc7-a444-9702034e7c73"
// /// user : {"id":"el2whafOEsgZk92E6EXzMSYWhhz2","first_name":"Wechuli","last_name":"Mavin","mobile_number":"254799143482","email":"maven@gmail.com","user_type":"Client","date_created":"2022-09-06T16:05:05.414149Z","updated_on":"2022-09-06T16:05:05.414125Z"}
// /// table : null
// /// order_item : [{"food":{"menu_category":{"restaurant_code":"M6UM9M693M3M","menu_code":"ZISI0ZZPLZ0S9P44","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"},"food_code":"BGG46BBG54","food_name":"Budger","food_image":"https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1010&q=80","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":4,"restaurant_code":"JAVA1234DEG","maximum_count":23,"addon_name":"Kachumbari","price":300.0,"isRequired":false},{"id":5,"restaurant_code":"KFC1324FRA","maximum_count":32,"addon_name":"Baroquely","price":200.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-09-07T16:55:48.635064Z","get_total_discount_item_price":10,"get_final_price":100.0},{"food":{"menu_category":{"restaurant_code":"JAVA1234DEG","menu_code":"Lunch12","menu_name":"Lunch","menu_image":"https://images.unsplash.com/photo-1592861956120-e524fc739696?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"},"food_code":"Lunfdh726823","food_name":"Big meal","food_image":"https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80","food_content":"Yeast, Wheat, FLour, Sugar","description":"food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital","price":23.0,"tax":"2","discount":2,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":2,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"SPice","price":20.0,"isRequired":false},{"id":3,"restaurant_code":"IAI42SVTV2VRAT16R1AAS1","maximum_count":4,"addon_name":"tomato","price":40.0,"isRequired":false},{"id":4,"restaurant_code":"JAVA1234DEG","maximum_count":23,"addon_name":"Kachumbari","price":300.0,"isRequired":false}],"preparation_time":null,"is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":3,"ratings":null},"quantity":1,"ordered":false,"date_created":"2022-09-07T23:02:19.061789Z","get_total_discount_item_price":2,"get_final_price":23.0}]
// /// isPaid : false
// /// isOrdered : false
// /// coupon : null
// /// order_status : "Ordered"
// /// ordered_date : "2022-09-21T15:28:58.865909Z"
// /// get_total : 123.0

// Orders dataFromJson(String str) => Orders.fromJson(json.decode(str));
// String dataToJson(Orders data) => json.encode(data.toJson());
// class Orders {
//   Orders({
//       String? orderId, 
//       User? user, 
//       dynamic table, 
//       List<OrderItem>? orderItem, 
//       bool? isPaid, 
//       bool? isOrdered, 
//       dynamic coupon, 
//       String? orderStatus, 
//       String? orderedDate, 
//       double? getTotal,}){
//     _orderId = orderId;
//     _user = user;
//     _table = table;
//     _orderItem = orderItem;
//     _isPaid = isPaid;
//     _isOrdered = isOrdered;
//     _coupon = coupon;
//     _orderStatus = orderStatus;
//     _orderedDate = orderedDate;
//     _getTotal = getTotal;
// }

//   Orders.fromJson(dynamic json) {
//     _orderId = json['order_id'];
//     _user = json['user'] != null ? User.fromJson(json['user']) : null;
//     _table = json['table'];
//     if (json['order_item'] != null) {
//       _orderItem = [];
//       json['order_item'].forEach((v) {
//         _orderItem?.add(OrderItem.fromJson(v));
//       });
//     }
//     _isPaid = json['isPaid'];
//     _isOrdered = json['isOrdered'];
//     _coupon = json['coupon'];
//     _orderStatus = json['order_status'];
//     _orderedDate = json['ordered_date'];
//     _getTotal = json['get_total'];
//   }
//   String? _orderId;
//   User? _user;
//   dynamic _table;
//   List<OrderItem>? _orderItem;
//   bool? _isPaid;
//   bool? _isOrdered;
//   dynamic _coupon;
//   String? _orderStatus;
//   String? _orderedDate;
//   double? _getTotal;
// Orders copyWith({  String? orderId,
//   User? user,
//   dynamic table,
//   List<OrderItem>? orderItem,
//   bool? isPaid,
//   bool? isOrdered,
//   dynamic coupon,
//   String? orderStatus,
//   String? orderedDate,
//   double? getTotal,
// }) => Orders(  orderId: orderId ?? _orderId,
//   user: user ?? _user,
//   table: table ?? _table,
//   orderItem: orderItem ?? _orderItem,
//   isPaid: isPaid ?? _isPaid,
//   isOrdered: isOrdered ?? _isOrdered,
//   coupon: coupon ?? _coupon,
//   orderStatus: orderStatus ?? _orderStatus,
//   orderedDate: orderedDate ?? _orderedDate,
//   getTotal: getTotal ?? _getTotal,
// );
//   String? get orderId => _orderId;
//   User? get user => _user;
//   dynamic get table => _table;
//   List<OrderItem>? get orderItem => _orderItem;
//   bool? get isPaid => _isPaid;
//   bool? get isOrdered => _isOrdered;
//   dynamic get coupon => _coupon;
//   String? get orderStatus => _orderStatus;
//   String? get orderedDate => _orderedDate;
//   double? get getTotal => _getTotal;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['order_id'] = _orderId;
//     if (_user != null) {
//       map['user'] = _user?.toJson();
//     }
//     map['table'] = _table;
//     if (_orderItem != null) {
//       map['order_item'] = _orderItem?.map((v) => v.toJson()).toList();
//     }
//     map['isPaid'] = _isPaid;
//     map['isOrdered'] = _isOrdered;
//     map['coupon'] = _coupon;
//     map['order_status'] = _orderStatus;
//     map['ordered_date'] = _orderedDate;
//     map['get_total'] = _getTotal;
//     return map;
//   }

// }

// /// food : {"menu_category":{"restaurant_code":"M6UM9M693M3M","menu_code":"ZISI0ZZPLZ0S9P44","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"},"food_code":"BGG46BBG54","food_name":"Budger","food_image":"https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1010&q=80","food_content":"Fish,tomato,onions","description":"Food for the hungry","price":100.0,"tax":"10","discount":10,"discount_rate":"2","add_ons":[{"id":1,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":4,"restaurant_code":"JAVA1234DEG","maximum_count":23,"addon_name":"Kachumbari","price":300.0,"isRequired":false},{"id":5,"restaurant_code":"KFC1324FRA","maximum_count":32,"addon_name":"Baroquely","price":200.0,"isRequired":false}],"preparation_time":"30mins","is_in_stock":true,"discount_active":false,"show_preparation_time":true,"serving_hours":1,"ratings":null}
// /// quantity : 1
// /// ordered : false
// /// date_created : "2022-09-07T16:55:48.635064Z"
// /// get_total_discount_item_price : 10
// /// get_final_price : 100.0


// /// menu_category : {"restaurant_code":"M6UM9M693M3M","menu_code":"ZISI0ZZPLZ0S9P44","menu_name":"Small Pizza","menu_image":"https://picsum.photos/200/300.jpg"}
// /// food_code : "BGG46BBG54"
// /// food_name : "Budger"
// /// food_image : "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1010&q=80"
// /// food_content : "Fish,tomato,onions"
// /// description : "Food for the hungry"
// /// price : 100.0
// /// tax : "10"
// /// discount : 10
// /// discount_rate : "2"
// /// add_ons : [{"id":1,"restaurant_code":"M6UM9M693M3M","maximum_count":8,"addon_name":"garlic","price":20.0,"isRequired":false},{"id":4,"restaurant_code":"JAVA1234DEG","maximum_count":23,"addon_name":"Kachumbari","price":300.0,"isRequired":false},{"id":5,"restaurant_code":"KFC1324FRA","maximum_count":32,"addon_name":"Baroquely","price":200.0,"isRequired":false}]
// /// preparation_time : "30mins"
// /// is_in_stock : true
// /// discount_active : false
// /// show_preparation_time : true
// /// serving_hours : 1
// /// ratings : null



// /// id : 1
// /// restaurant_code : "M6UM9M693M3M"
// /// maximum_count : 8
// /// addon_name : "garlic"
// /// price : 20.0
// /// isRequired : false

