// To parse this JSON data, do
//
//     final userOrdersModel = userOrdersModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final userOrdersModel = userOrdersModelFromJson(jsonString);

import 'dart:convert';

UserOrdersModel userOrdersModelFromJson(String str) =>
    UserOrdersModel.fromJson(json.decode(str));

String userOrdersModelToJson(UserOrdersModel data) =>
    json.encode(data.toJson());

class UserOrdersModel {
  UserOrdersModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<UserOrders>? data;

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) =>
      UserOrdersModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<UserOrders>.from(
                json["data"]!.map((x) => UserOrders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserOrders {
  UserOrders({
    this.id,
    this.restaurant,
    this.orderItem,
    this.payment,
    this.orderDetails,
    this.paymentMode,
    this.paymentOption,
    this.orderType,
    this.customerEmail,
    this.payingPhone,
    this.customerPhone,
    this.orderId,
    this.deviceId,
    this.orderNumber,
    this.amount,
    this.anonuserId,
    this.orderStatus,
    this.paymentStatus,
    this.orderedDate,
    this.created,
    this.user,
    this.table,
  });

  String? id;
  UserOrdersRestaurant? restaurant;
  dynamic orderItem;
  Payment? payment;
  List<OrderDetail>? orderDetails;
  String? paymentMode;
  String? paymentOption;
  String? orderType;
  String? customerEmail;
  String? payingPhone;
  String? customerPhone;
  dynamic orderId;
  String? deviceId;
  String? orderNumber;
  double? amount;
  dynamic anonuserId;
  String? orderStatus;
  String? paymentStatus;
  DateTime? orderedDate;
  DateTime? created;
  String? user;
  dynamic table;

  factory UserOrders.fromJson(Map<String, dynamic> json) => UserOrders(
        id: json["id"],
        restaurant: json["restaurant"] == null
            ? null
            : UserOrdersRestaurant.fromJson(json["restaurant"]),
        orderItem: json["order_item"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
        orderDetails: json["order_details"] == null
            ? []
            : List<OrderDetail>.from(
                json["order_details"]!.map((x) => OrderDetail.fromJson(x))),
        paymentMode: json["payment_mode"],
        paymentOption: json["payment_option"],
        orderType: json["order_type"],
        customerEmail: json["customer_email"],
        payingPhone: json["paying_phone"],
        customerPhone: json["customer_phone"],
        orderId: json["order_id"],
        deviceId: json["device_id"],
        orderNumber: json["order_number"],
        amount: json["amount"],
        anonuserId: json["anonuser_id"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        orderedDate: json["ordered_date"] == null
            ? null
            : DateTime.parse(json["ordered_date"]),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        user: json["user"],
        table: json["table"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant": restaurant?.toJson(),
        "order_item": orderItem,
        "payment": payment?.toJson(),
        "order_details": orderDetails == null
            ? []
            : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
        "payment_mode": paymentMode,
        "payment_option": paymentOption,
        "order_type": orderType,
        "customer_email": customerEmail,
        "paying_phone": payingPhone,
        "customer_phone": customerPhone,
        "order_id": orderId,
        "device_id": deviceId,
        "order_number": orderNumber,
        "amount": amount,
        "anonuser_id": anonuserId,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "ordered_date": orderedDate?.toIso8601String(),
        "created": created?.toIso8601String(),
        "user": user,
        "table": table,
      };
}

class OrderDetail {
  OrderDetail({
    this.foodImage,
    this.orderList,
  });

  List<FoodImage>? foodImage;
  OrderList? orderList;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        foodImage: json["food_image"] == null
            ? []
            : List<FoodImage>.from(
                json["food_image"]!.map((x) => FoodImage.fromJson(x))),
        orderList: json["order_list"] == null
            ? null
            : OrderList.fromJson(json["order_list"]),
      );

  Map<String, dynamic> toJson() => {
        "food_image": foodImage == null
            ? []
            : List<dynamic>.from(foodImage!.map((x) => x.toJson())),
        "order_list": orderList?.toJson(),
      };
}

class FoodImage {
  FoodImage({
    this.url,
  });

  String? url;

  factory FoodImage.fromJson(Map<String, dynamic> json) => FoodImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class OrderList {
  OrderList({
    this.quantity,
    this.foodPrice,
    this.foodFoodCode,
    this.foodFoodName,
    this.additionalNotes,
  });

  int? quantity;
  double? foodPrice;
  String? foodFoodCode;
  String? foodFoodName;
  String? additionalNotes;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        quantity: json["quantity"],
        foodPrice: json["food__price"],
        foodFoodCode: json["food__food_code"],
        foodFoodName: json["food__food_name"],
        additionalNotes: json["additional_notes"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "food__price": foodPrice,
        "food__food_code": foodFoodCode,
        "food__food_name": foodFoodName,
        "additional_notes": additionalNotes,
      };
}

class Payment {
  Payment({
    this.id,
    this.amount,
    this.receiptCode,
    this.date,
    this.reference,
    this.email,
    this.type,
    this.chargeId,
    this.callbackId,
    this.channel,
    this.status,
    this.statusCode,
    this.phoneNumber,
    this.created,
  });

  String? id;
  String? amount;
  String? receiptCode;
  DateTime? date;
  dynamic reference;
  String? email;
  dynamic type;
  String? chargeId;
  String? callbackId;
  String? channel;
  String? status;
  String? statusCode;
  String? phoneNumber;
  DateTime? created;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        amount: json["amount"],
        receiptCode: json["receipt_code"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reference: json["reference"],
        email: json["email"],
        type: json["type"],
        chargeId: json["charge_id"],
        callbackId: json["callback_id"],
        channel: json["channel"],
        status: json["status"],
        statusCode: json["status_code"],
        phoneNumber: json["phone_number"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "receipt_code": receiptCode,
        "date": date?.toIso8601String(),
        "reference": reference,
        "email": email,
        "type": type,
        "charge_id": chargeId,
        "callback_id": callbackId,
        "channel": channel,
        "status": status,
        "status_code": statusCode,
        "phone_number": phoneNumber,
        "created": created?.toIso8601String(),
      };
}

class UserOrdersRestaurant {
  UserOrdersRestaurant({
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
  RestaurantRestaurant? restaurant;
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

  factory UserOrdersRestaurant.fromJson(Map<String, dynamic> json) =>
      UserOrdersRestaurant(
        id: json["id"],
        restaurantCode: json["restaurant_code"],
        restaurant: json["restaurant"] == null
            ? null
            : RestaurantRestaurant.fromJson(json["restaurant"]),
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
        updatedOn: json["updated_on"] == null
            ? null
            : DateTime.parse(json["updated_on"]),
        createdOn: json["created_on"] == null
            ? null
            : DateTime.parse(json["created_on"]),
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
        "email": email,
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

class RestaurantRestaurant {
  RestaurantRestaurant({
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
  String? email;
  double? latitude;
  double? longitude;

  factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) =>
      RestaurantRestaurant(
        restaurantCode: json["restaurant_code"],
        resaurantBranch: json["resaurant_branch"],
        restaurantName: json["restaurant_name"],
        restaurantImage: json["restaurant_image"],
        address: json["address"],
        firstContacts: json["first_contacts"],
        secondContacts: json["second_contacts"],
        email: json["email"],
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




// import 'dart:convert';

// import 'order_item.dart';

// UserOrdersModel userOrdersModelFromJson(String str) => UserOrdersModel.fromJson(json.decode(str));

// String userOrdersModelToJson(UserOrdersModel data) => json.encode(data.toJson());

// class UserOrdersModel {
//     UserOrdersModel({
//         this.status,
//         this.message,
//         this.data,
//     });

//     bool? status;
//     String? message;
//     List<UserOrders>? data;

//     factory UserOrdersModel.fromJson(Map<String, dynamic> json) => UserOrdersModel(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<UserOrders>.from(json["data"]!.map((x) => UserOrders.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class UserOrders {
//     UserOrders({
//         this.id,
//         this.restaurant,
//         this.orderItem,
//         this.payment,
//         this.paymentMode,
//         this.paymentOption,
//         this.orderType,
//         this.customerEmail,
//         this.payingPhone,
//         this.customerPhone,
//         this.orderId,
//         this.deviceId,
//         this.orderNumber,
//         this.amount,
//         this.anonuserId,
//         this.orderStatus,
//         this.paymentStatus,
//         this.orderedDate,
//         this.created,
//         this.user,
//         this.table,
//     });

//     String? id;
//     BranchClass? restaurant;
//     OrderItem? orderItem;
//     dynamic payment;
//     String? paymentMode;
//     String? paymentOption;
//     String? orderType;
//     String? customerEmail;
//     String? payingPhone;
//     String? customerPhone;
//     String? orderId;
//     String? deviceId;
//     String? orderNumber;
//     double? amount;
//     String? anonuserId;
//     String? orderStatus;
//     String? paymentStatus;
//     DateTime? orderedDate;
//     DateTime? created;
//     String? user;
//     dynamic table;

//     factory UserOrders.fromJson(Map<String, dynamic> json) => UserOrders(
//         id: json["id"],
//         restaurant: json["restaurant"] == null ? null : BranchClass.fromJson(json["restaurant"]),
//         orderItem: json["order_item"] == null ? null : OrderItem.fromJson(json["order_item"]),
//         payment: json["payment"],
//         paymentMode: json["payment_mode"],
//         paymentOption: json["payment_option"],
//         orderType: json["order_type"],
//         customerEmail: json["customer_email"],
//         payingPhone: json["paying_phone"],
//         customerPhone: json["customer_phone"],
//         orderId: json["order_id"],
//         deviceId: json["device_id"],
//         orderNumber: json["order_number"],
//         amount: json["amount"],
//         anonuserId: json["anonuser_id"],
//         orderStatus: json["order_status"],
//         paymentStatus: json["payment_status"],
//         orderedDate: json["ordered_date"] == null ? null : DateTime.parse(json["ordered_date"]),
//         created: json["created"] == null ? null : DateTime.parse(json["created"]),
//         user: json["user"],
//         table: json["table"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "restaurant": restaurant?.toJson(),
//         "order_item": orderItem?.toJson(),
//         "payment": payment,
//         "payment_mode": paymentMode,
//         "payment_option": paymentOption,
//         "order_type": orderType,
//         "customer_email": customerEmail,
//         "paying_phone": payingPhone,
//         "customer_phone": customerPhone,
//         "order_id": orderId,
//         "device_id": deviceId,
//         "order_number": orderNumber,
//         "amount": amount,
//         "anonuser_id": anonuserId,
//         "order_status": orderStatus,
//         "payment_status": paymentStatus,
//         "ordered_date": orderedDate?.toIso8601String(),
//         "created": created?.toIso8601String(),
//         "user": user,
//         "table": table,
//     };
// }

// class OrderItem {
//     OrderItem({
//         this.quantity,
//         this.deviceId,
//         this.totalPrice,
//         this.orderId,
//         this.id,
//         this.branch,
//         this.ordered,
//         this.updatedOn,
//         this.food,
//         this.additionalNotes,
//     });

//     int? quantity;
//     String? deviceId;
//     int? totalPrice;
//     String? orderId;
//     String? id;
//     dynamic branch;
//     bool? ordered;
//     DateTime? updatedOn;
//     Food? food;
//     dynamic additionalNotes;

//     factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
//         quantity: json["quantity"],
//         deviceId: json["device_id"],
//         totalPrice: json["total_price"],
//         orderId: json["order_id"],
//         id: json["id"],
//         branch: json["branch"],
//         ordered: json["ordered"],
//         updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
//         food: json["food"] == null ? null : Food.fromJson(json["food"]),
//         additionalNotes: json["additional_notes"],
//     );

//     Map<String, dynamic> toJson() => {
//         "quantity": quantity,
//         "device_id": deviceId,
//         "total_price": totalPrice,
//         "order_id": orderId,
//         "id": id,
//         "branch": branch,
//         "ordered": ordered,
//         "updated_on": updatedOn?.toIso8601String(),
//         "food": food?.toJson(),
//         "additional_notes": additionalNotes,
//     };
// }

// class Food {
//     Food({
//         this.id,
//         this.menuCategory,
//         this.variants,
//         this.foodAddons,
//         this.taxObject,
//         this.branch,
//         this.servingHoursId,
//         this.foodCode,
//         this.foodName,
//         this.foodImage,
//         this.foodContent,
//         this.description,
//         this.price,
//         this.discount,
//         this.discountRate,
//         this.servingHours,
//         this.preparationTime,
//         this.isInStock,
//         this.favoriteUserId,
//         this.discountActive,
//         this.showPreparationTime,
//         this.isFavorite,
//         this.updatedOn,
//         this.sidesJson,
//         this.dishCategory,
//         this.addonsJson,
//         this.dateCreated,
//         this.deletedAt,
//         this.sides,
//         this.addons,
//         this.taxId,
//     });

//     String? id;
//     MenuCategory? menuCategory;
//     List<Variant>? variants;
//     dynamic foodAddons;
//     List<TaxObject>? taxObject;
//     BranchClass? branch;
//     ServingHoursId? servingHoursId;
//     String? foodCode;
//     String? foodName;
//     String? foodImage;
//     String? foodContent;
//     String? description;
//     double? price;
//     int? discount;
//     String? discountRate;
//     dynamic servingHours;
//     String? preparationTime;
//     bool? isInStock;
//     dynamic favoriteUserId;
//     bool? discountActive;
//     bool? showPreparationTime;
//     bool? isFavorite;
//     DateTime? updatedOn;
//     dynamic sidesJson;
//     String? dishCategory;
//     dynamic addonsJson;
//     DateTime? dateCreated;
//     dynamic deletedAt;
//     dynamic sides;
//     dynamic addons;
//     dynamic taxId;

//     factory Food.fromJson(Map<String, dynamic> json) => Food(
//         id: json["id"],
//         menuCategory: json["menu_category"] == null ? null : MenuCategory.fromJson(json["menu_category"]),
//         variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
//         foodAddons: json["food_addons"],
//         taxObject: json["tax_object"] == null ? [] : List<TaxObject>.from(json["tax_object"]!.map((x) => TaxObject.fromJson(x))),
//         branch: json["branch"] == null ? null : BranchClass.fromJson(json["branch"]),
//         servingHoursId: json["serving_hours_id"] == null ? null : ServingHoursId.fromJson(json["serving_hours_id"]),
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
//         updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
//         sidesJson: json["sides_json"],
//         dishCategory: json["dish_category"],
//         addonsJson: json["addons_json"],
//         dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         sides: json["sides"],
//         addons: json["addons"],
//         taxId: json["tax_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "menu_category": menuCategory?.toJson(),
//         "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
//         "food_addons": foodAddons,
//         "tax_object": taxObject == null ? [] : List<dynamic>.from(taxObject!.map((x) => x.toJson())),
//         "branch": branch?.toJson(),
//         "serving_hours_id": servingHoursId?.toJson(),
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
//         "updated_on": updatedOn?.toIso8601String(),
//         "sides_json": sidesJson,
//         "dish_category": dishCategory,
//         "addons_json": addonsJson,
//         "date_created": dateCreated?.toIso8601String(),
//         "deleted_at": deletedAt,
//         "sides": sides,
//         "addons": addons,
//         "tax_id": taxId,
//     };
// }

// class BranchClass {
//     BranchClass({
//         this.id,
//         this.restaurantCode,
//         this.restaurant,
//         this.branchName,
//         this.restaurantImage,
//         this.address,
//         this.firstContacts,
//         this.secondContacts,
//         this.email,
//         this.rating,
//         this.ratingStatus,
//         this.type,
//         this.latitude,
//         this.longitude,
//         this.favoriteUserId,
//         this.isFavorite,
//         this.updatedOn,
//         this.createdOn,
//         this.deletedOn,
//     });

//     String? id;
//     String? restaurantCode;
//     RestaurantRestaurant? restaurant;
//     String? branchName;
//     String? restaurantImage;
//     String? address;
//     String? firstContacts;
//     String? secondContacts;
//     String? email;
//     dynamic rating;
//     dynamic ratingStatus;
//     String? type;
//     double? latitude;
//     double? longitude;
//     dynamic favoriteUserId;
//     bool? isFavorite;
//     DateTime? updatedOn;
//     DateTime? createdOn;
//     dynamic deletedOn;

//     factory BranchClass.fromJson(Map<String, dynamic> json) => BranchClass(
//         id: json["id"],
//         restaurantCode: json["restaurant_code"],
//         restaurant: json["restaurant"] == null ? null : RestaurantRestaurant.fromJson(json["restaurant"]),
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
//         updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
//         createdOn: json["created_on"] == null ? null : DateTime.parse(json["created_on"]),
//         deletedOn: json["deleted_on"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "restaurant_code": restaurantCode,
//         "restaurant": restaurant?.toJson(),
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
//         "updated_on": updatedOn?.toIso8601String(),
//         "created_on": createdOn?.toIso8601String(),
//         "deleted_on": deletedOn,
//     };
// }

// class RestaurantRestaurant {
//     RestaurantRestaurant({
//         this.restaurantCode,
//         this.resaurantBranch,
//         this.restaurantName,
//         this.restaurantImage,
//         this.address,
//         this.firstContacts,
//         this.secondContacts,
//         this.email,
//         this.latitude,
//         this.longitude,
//     });

//     String? restaurantCode;
//     String? resaurantBranch;
//     String? restaurantName;
//     dynamic restaurantImage;
//     dynamic address;
//     dynamic firstContacts;
//     dynamic secondContacts;
//     dynamic email;
//     dynamic latitude;
//     dynamic longitude;

//     factory RestaurantRestaurant.fromJson(Map<String, dynamic> json) => RestaurantRestaurant(
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
//         this.id,
//         this.sectionCode,
//         this.sectionName,
//         this.sectionImage,
//         this.updatedOn,
//         this.dateCreated,
//         this.deletedAt,
//         this.menuId,
//     });

//     String? id;
//     dynamic sectionCode;
//     String? sectionName;
//     String? sectionImage;
//     DateTime? updatedOn;
//     DateTime? dateCreated;
//     dynamic deletedAt;
//     String? menuId;

//     factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
//         id: json["id"],
//         sectionCode: json["section_code"],
//         sectionName: json["section_name"],
//         sectionImage: json["section_image"],
//         updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
//         dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         menuId: json["menu_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "section_code": sectionCode,
//         "section_name": sectionName,
//         "section_image": sectionImage,
//         "updated_on": updatedOn?.toIso8601String(),
//         "date_created": dateCreated?.toIso8601String(),
//         "deleted_at": deletedAt,
//         "menu_id": menuId,
//     };
// }

// class ServingHoursId {
//     ServingHoursId({
//         this.id,
//         this.day,
//         this.servingType,
//         this.fromTime,
//         this.toTime,
//         this.created,
//     });

//     String? id;
//     dynamic day;
//     String? servingType;
//     String? fromTime;
//     String? toTime;
//     DateTime? created;

//     factory ServingHoursId.fromJson(Map<String, dynamic> json) => ServingHoursId(
//         id: json["id"],
//         day: json["day"],
//         servingType: json["serving_type"],
//         fromTime: json["from_time"],
//         toTime: json["to_time"],
//         created: json["created"] == null ? null : DateTime.parse(json["created"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "day": day,
//         "serving_type": servingType,
//         "from_time": fromTime,
//         "to_time": toTime,
//         "created": created?.toIso8601String(),
//     };
// }

// class TaxObject {
//     TaxObject({
//         this.tax,
//     });

//     Tax? tax;

//     factory TaxObject.fromJson(Map<String, dynamic> json) => TaxObject(
//         tax: json["tax"] == null ? null : Tax.fromJson(json["tax"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "tax": tax?.toJson(),
//     };
// }

// class Tax {
//     Tax({
//         this.taxCode,
//         this.taxRate,
//         this.taxType,
//         this.isActive,
//         this.taxPrice,
//         this.isRequired,
//     });

//     String? taxCode;
//     String? taxRate;
//     String? taxType;
//     bool? isActive;
//     double? taxPrice;
//     bool? isRequired;

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
//         this.name,
//         this.values,
//     });

//     String? name;
//     List<Value>? values;

//     factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//         name: json["name"],
//         values: json["values"] == null ? [] : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x.toJson())),
//     };
// }

// class Value {
//     Value({
//         this.price,
//         this.valueName,
//     });

//     String? price;
//     String? valueName;

//     factory Value.fromJson(Map<String, dynamic> json) => Value(
//         price: json["price"],
//         valueName: json["value_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "price": price,
//         "value_name": valueName,
//     };
// }
