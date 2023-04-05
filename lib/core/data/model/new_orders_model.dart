
import 'dart:convert';

NewOrdersModel newOrdersModelFromJson(String str) => NewOrdersModel.fromJson(json.decode(str));

String newOrdersModelToJson(NewOrdersModel data) => json.encode(data.toJson());

class NewOrdersModel {
    NewOrdersModel({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    List<NewOrders>? data;

    factory NewOrdersModel.fromJson(Map<String, dynamic> json) => NewOrdersModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<NewOrders>.from(json["data"]!.map((x) => NewOrders.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class NewOrders {
    NewOrders({
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
    Branch? branch;
    bool? ordered;
    DateTime? updatedOn;
    Food? food;
    String? additionalNotes;

    factory NewOrders.fromJson(Map<String, dynamic> json) => NewOrders(
        quantity: json["quantity"],
        deviceId: json["device_id"],
        totalPrice: json["total_price"],
        orderId: json["order_id"],
        id: json["id"],
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        ordered: json["ordered"],
        updatedOn: json["updated_on"] == null ? null : DateTime.parse(json["updated_on"]),
        food: json["food"] == null ? null : Food.fromJson(json["food"]),
        additionalNotes: json["additional_notes"],
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "device_id": deviceId,
        "total_price": totalPrice,
        "order_id": orderId,
        "id": id,
        "branch": branch?.toJson(),
        "ordered": ordered,
        "updated_on": updatedOn?.toIso8601String(),
        "food": food?.toJson(),
        "additional_notes": additionalNotes,
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
    String? email;
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

class Food {
    Food({
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
    List<dynamic>? variants;
    List<dynamic>? foodAddons;
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
    dynamic taxId;

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        menuCategory: json["menu_category"] == null ? null : MenuCategory.fromJson(json["menu_category"]),
        variants: json["variants"] == null ? [] : List<dynamic>.from(json["variants"]!.map((x) => x)),
        foodAddons: json["food_addons"] == null ? [] : List<dynamic>.from(json["food_addons"]!.map((x) => x)),
        taxObject: json["tax_object"] == null ? [] : List<TaxObject>.from(json["tax_object"]!.map((x) => TaxObject.fromJson(x))),
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
        sidesJson: json["sides_json"] == null ? [] : List<dynamic>.from(json["sides_json"]!.map((x) => x)),
        dishCategory: json["dish_category"],
        addonsJson: json["addons_json"] == null ? [] : List<dynamic>.from(json["addons_json"]!.map((x) => x)),
        dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
        taxId: json["tax_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "menu_category": menuCategory?.toJson(),
        "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "food_addons": foodAddons == null ? [] : List<dynamic>.from(foodAddons!.map((x) => x)),
        "tax_object": taxObject == null ? [] : List<dynamic>.from(taxObject!.map((x) => x.toJson())),
        "branch": branch?.toJson(),
        "serving_hours_id": servingHoursId?.toJson(),
        "food_image_json": foodImageJson == null ? [] : List<dynamic>.from(foodImageJson!.map((x) => x.toJson())),
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
        "maximum_count": maximumCount,
        "is_favorite": isFavorite,
        "updated_on": updatedOn?.toIso8601String(),
        "isRequired": isRequired,
        "isVisible": isVisible,
        "sides_json": sidesJson == null ? [] : List<dynamic>.from(sidesJson!.map((x) => x)),
        "dish_category": dishCategory,
        "addons_json": addonsJson == null ? [] : List<dynamic>.from(addonsJson!.map((x) => x)),
        "date_created": dateCreated?.toIso8601String(),
        "tax_id": taxId,
    };
}

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

    String? taxCode;
    String? taxRate;
    String? taxType;
    bool? isActive;
    double? taxPrice;
    bool? isRequired;

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

