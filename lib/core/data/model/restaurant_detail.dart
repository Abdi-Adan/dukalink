import 'dart:convert';

import 'package:dukalink_app/core/data/model/new_restaurant_detail.dart';

import 'dishes_model.dart';
import 'favoriteRestaurantModel.dart';
import 'menu_model.dart';
import 'restaurant_model.dart';

/// status : true
/// message : "Branch detail fetched"
/// data : {"restaurant_code":"SVRES8RE81VOT8L8SI2V","branch_name":"Carlitos Two rivers","restaurant_image":"https://images.unsplash.com/photo-1648227132835-24a6405b2fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG9","address":"P.O BOX 254 Two rivers","first_contacts":"254743143383","second_contacts":" 254743143361","email":"carlitosq@gmail.com","latitude":0.087,"longitude":12.0937,"ratings":null,"menu":[{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"ZS0MAAA0ALSL0LAP","menu_name":"Supper meal","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"SZAAS5SMAZSA8","menu_name":"Small pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"Z2A220ALP2AAL4","menu_name":"Large Pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"II3L8IA2ALGGP2RI","menu_name":"Large2 Pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"3P4AIPL232P5Z7772","menu_name":"Large3 Pizza","menu_image":"shorturl.at/gipB9"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"G7PA73P3G77RZP3E","menu_name":"Large5 Pizza","menu_image":"shorturl.at/gipB9"}],"food":[],"tableCount":{"maximum_tables__sum":45},"operationDays":[{"id":1,"day":"2022-10-29T20:37:52.652666Z","from_time":"09:00:00","to_time":"05:00:00","restaurant":"SVRES8RE81VOT8L8SI2V"},{"id":2,"day":"2022-10-29T20:38:01.456349Z","from_time":"09:00:00","to_time":"05:00:00","restaurant":"SVRES8RE81VOT8L8SI2V"}],"venues":[{"id":1,"place_type":"Room","place_name":"Room A","maximum_tables":15,"person_per_table":8,"restaurant":"SVRES8RE81VOT8L8SI2V"},{"id":2,"place_type":"Room","place_name":"Room B","maximum_tables":15,"person_per_table":8,"restaurant":"SVRES8RE81VOT8L8SI2V"},{"id":3,"place_type":"Area","place_name":"Pool","maximum_tables":15,"person_per_table":8,"restaurant":"SVRES8RE81VOT8L8SI2V"}]}

RestaurantDetail restaurantDetailFromJson(String str) =>
    RestaurantDetail.fromJson(json.decode(str));
String restaurantDetailToJson(RestaurantDetail data) =>
    json.encode(data.toJson());

class RestaurantDetail {
  RestaurantDetail({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  RestaurantDetail.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
  RestaurantDetail copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      RestaurantDetail(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// restaurant_code : "SVRES8RE81VOT8L8SI2V"
/// branch_name : "Carlitos Two rivers"
/// restaurant_image : "https://images.unsplash.com/photo-1648227132835-24a6405b2fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG9"
/// address : "P.O BOX 254 Two rivers"
/// first_contacts : "254743143383"
/// second_contacts : " 254743143361"
/// email : "carlitosq@gmail.com"
/// latitude : 0.087
/// longitude : 12.0937
/// ratings : null
/// menu : [{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"ZS0MAAA0ALSL0LAP","menu_name":"Supper meal","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"SZAAS5SMAZSA8","menu_name":"Small pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"Z2A220ALP2AAL4","menu_name":"Large Pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"II3L8IA2ALGGP2RI","menu_name":"Large2 Pizza","menu_image":"https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"3P4AIPL232P5Z7772","menu_name":"Large3 Pizza","menu_image":"shorturl.at/gipB9"},{"restaurant_code":"SVRES8RE81VOT8L8SI2V","menu_code":"G7PA73P3G77RZP3E","menu_name":"Large5 Pizza","menu_image":"shorturl.at/gipB9"}]
/// food : []
/// tableCount : {"maximum_tables__sum":45}
/// operationDays : [{"id":1,"day":"2022-10-29T20:37:52.652666Z","from_time":"09:00:00","to_time":"05:00:00","restaurant":"SVRES8RE81VOT8L8SI2V"},{"id":2,"day":"2022-10-29T20:38:01.456349Z","from_time":"09:00:00","to_time":"05:00:00","restaurant":"SVRES8RE81VOT8L8SI2V"}]
/// venues : [{"id":1,"place_type":"Room","place_name":"Room A","maximum_tables":15,"person_per_table":8,"restaurant":"SVRES8RE81VOT8L8SI2V"},{"id":2,"place_type":"Room","place_name":"Room B","maximum_tables":15,"person_per_table":8,"restaurant":"SVRES8RE81VOT8L8SI2V"},{"id":3,"place_type":"Area","place_name":"Pool","maximum_tables":15,"person_per_table":8,"restaurant":"SVRES8RE81VOT8L8SI2V"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? restaurantCode,
    String? branchName,
    String? restaurantImage,
    String? address,
    String? firstContacts,
    String? secondContacts,
    String? email,
    double? latitude,
    double? longitude,
    dynamic ratings,
    List<MenuCategory>? menu,
    List<Food>? food,
    TableCount? tableCount,
    List<OperationDays>? operationDays,
    List<Venues>? venues,
    // List<FavoriteRestaurant>? favorites,
  }) {
    _restaurantCode = restaurantCode;
    _branchName = branchName;
    _restaurantImage = restaurantImage;
    _address = address;
    _firstContacts = firstContacts;
    _secondContacts = secondContacts;
    _email = email;
    _latitude = latitude;
    _longitude = longitude;
    _ratings = ratings;
    _menu = menu;
    _food = food;
    _tableCount = tableCount;
    _operationDays = operationDays;
    _venues = venues;
    // _favorites = favorites;
  }

  Data.fromJson(dynamic json) {
    _restaurantCode = json['restaurant_code'];
    _branchName = json['branch_name'];
    _restaurantImage = json['restaurant_image'];
    _address = json['address'];
    _firstContacts = json['first_contacts'];
    _secondContacts = json['second_contacts'];
    _email = json['email'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _ratings = json['ratings'];
    if (json['menu'] != null) {
      _menu = [];
      json['menu'].forEach((v) {
        _menu?.add(MenuCategory.fromJson(v));
      });
    }
    if (json['food'] != null) {
      _food = [];
      json['food'].forEach((v) {
        _food?.add(Food.fromJson(v));
      });
    }
    _tableCount = json['tableCount'] != null
        ? TableCount.fromJson(json['tableCount'])
        : null;
    if (json['operationDays'] != null) {
      _operationDays = [];
      json['operationDays'].forEach((v) {
        _operationDays?.add(OperationDays.fromJson(v));
      });
    }
    if (json['venues'] != null) {
      _venues = [];
      json['venues'].forEach((v) {
        _venues?.add(Venues.fromJson(v));
      });
    }
    // if (json['favorites'] != null) {
    //   _favorites = [];
    //   json['favorites'].forEach((v) {
    //     _favorites?.add(FavoriteRestaurant.fromJson(v));
    //   });
    // }
  }
  String? _restaurantCode;
  String? _branchName;
  String? _restaurantImage;
  String? _address;
  String? _firstContacts;
  String? _secondContacts;
  String? _email;
  double? _latitude;
  double? _longitude;
  dynamic _ratings;
  List<MenuCategory>? _menu;
  List<Food>? _food;
  TableCount? _tableCount;
  List<OperationDays>? _operationDays;
  List<Venues>? _venues;
  List<RestaurantData>? _favorites;
  Data copyWith({
    String? restaurantCode,
    String? branchName,
    String? restaurantImage,
    String? address,
    String? firstContacts,
    String? secondContacts,
    String? email,
    double? latitude,
    double? longitude,
    dynamic ratings,
    List<MenuCategory>? menu,
    List<Food>? food,
    TableCount? tableCount,
    List<OperationDays>? operationDays,
    List<Venues>? venues,
    // List<FavoriteRestaurant>? favorites,
  }) =>
      Data(
        restaurantCode: restaurantCode ?? _restaurantCode,
        branchName: branchName ?? _branchName,
        restaurantImage: restaurantImage ?? _restaurantImage,
        address: address ?? _address,
        firstContacts: firstContacts ?? _firstContacts,
        secondContacts: secondContacts ?? _secondContacts,
        email: email ?? _email,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        ratings: ratings ?? _ratings,
        menu: menu ?? _menu,
        food: food ?? _food,
        tableCount: tableCount ?? _tableCount,
        operationDays: operationDays ?? _operationDays,
        venues: venues ?? _venues,
        // favorites: favorites ?? _favorites,
      );
  String? get restaurantCode => _restaurantCode;
  String? get branchName => _branchName;
  String? get restaurantImage => _restaurantImage;
  String? get address => _address;
  String? get firstContacts => _firstContacts;
  String? get secondContacts => _secondContacts;
  String? get email => _email;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  dynamic get ratings => _ratings;
  List<MenuCategory>? get menu => _menu;
  List<Food>? get food => _food;
  TableCount? get tableCount => _tableCount;
  List<OperationDays>? get operationDays => _operationDays;
  List<Venues>? get venues => _venues;
  // List<FavoriteRestaurant>? get favorites => _favorites;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_code'] = _restaurantCode;
    map['branch_name'] = _branchName;
    map['restaurant_image'] = _restaurantImage;
    map['address'] = _address;
    map['first_contacts'] = _firstContacts;
    map['second_contacts'] = _secondContacts;
    map['email'] = _email;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['ratings'] = _ratings;
    if (_menu != null) {
      map['menu'] = _menu?.map((v) => v.toJson()).toList();
    }
    if (_food != null) {
      map['food'] = _food?.map((v) => v.toJson()).toList();
    }
    if (_tableCount != null) {
      map['tableCount'] = _tableCount?.toJson();
    }
    if (_operationDays != null) {
      map['operationDays'] = _operationDays?.map((v) => v.toJson()).toList();
    }
    if (_venues != null) {
      map['venues'] = _venues?.map((v) => v.toJson()).toList();
    }
    // if (_favorites != null) {
    //   map['favorites'] = _favorites?.map((v) => v.toJson()).toList();
    // }
    return map;
  }
}

/// id : 1
/// place_type : "Room"
/// place_name : "Room A"
/// maximum_tables : 15
/// person_per_table : 8
/// restaurant : "SVRES8RE81VOT8L8SI2V"

Venues venuesFromJson(String str) => Venues.fromJson(json.decode(str));
String venuesToJson(Venues data) => json.encode(data.toJson());

class Venues {
  Venues({
    int? id,
    String? placeType,
    String? placeName,
    int? maximumTables,
    int? personPerTable,
    String? restaurant,
  }) {
    _id = id;
    _placeType = placeType;
    _placeName = placeName;
    _maximumTables = maximumTables;
    _personPerTable = personPerTable;
    _restaurant = restaurant;
  }

  Venues.fromJson(dynamic json) {
    _id = json['id'];
    _placeType = json['place_type'];
    _placeName = json['place_name'];
    _maximumTables = json['maximum_tables'];
    _personPerTable = json['person_per_table'];
    _restaurant = json['restaurant'];
  }
  int? _id;
  String? _placeType;
  String? _placeName;
  int? _maximumTables;
  int? _personPerTable;
  String? _restaurant;
  Venues copyWith({
    int? id,
    String? placeType,
    String? placeName,
    int? maximumTables,
    int? personPerTable,
    String? restaurant,
  }) =>
      Venues(
        id: id ?? _id,
        placeType: placeType ?? _placeType,
        placeName: placeName ?? _placeName,
        maximumTables: maximumTables ?? _maximumTables,
        personPerTable: personPerTable ?? _personPerTable,
        restaurant: restaurant ?? _restaurant,
      );
  int? get id => _id;
  String? get placeType => _placeType;
  String? get placeName => _placeName;
  int? get maximumTables => _maximumTables;
  int? get personPerTable => _personPerTable;
  String? get restaurant => _restaurant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['place_type'] = _placeType;
    map['place_name'] = _placeName;
    map['maximum_tables'] = _maximumTables;
    map['person_per_table'] = _personPerTable;
    map['restaurant'] = _restaurant;
    return map;
  }
}

/// id : 1
/// day : "2022-10-29T20:37:52.652666Z"
/// from_time : "09:00:00"
/// to_time : "05:00:00"
/// restaurant : "SVRES8RE81VOT8L8SI2V"

OperationDays operationDaysFromJson(String str) =>
    OperationDays.fromJson(json.decode(str));
String operationDaysToJson(OperationDays data) => json.encode(data.toJson());

class OperationDays {
  OperationDays({
    int? id,
    String? day,
    String? fromTime,
    String? toTime,
    String? restaurant,
  }) {
    _id = id;
    _day = day;
    _fromTime = fromTime;
    _toTime = toTime;
    _restaurant = restaurant;
  }

  OperationDays.fromJson(dynamic json) {
    _id = json['id'];
    _day = json['day'];
    _fromTime = json['from_time'];
    _toTime = json['to_time'];
    _restaurant = json['restaurant'];
  }
  int? _id;
  String? _day;
  String? _fromTime;
  String? _toTime;
  String? _restaurant;
  OperationDays copyWith({
    int? id,
    String? day,
    String? fromTime,
    String? toTime,
    String? restaurant,
  }) =>
      OperationDays(
        id: id ?? _id,
        day: day ?? _day,
        fromTime: fromTime ?? _fromTime,
        toTime: toTime ?? _toTime,
        restaurant: restaurant ?? _restaurant,
      );
  int? get id => _id;
  String? get day => _day;
  String? get fromTime => _fromTime;
  String? get toTime => _toTime;
  String? get restaurant => _restaurant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['day'] = _day;
    map['from_time'] = _fromTime;
    map['to_time'] = _toTime;
    map['restaurant'] = _restaurant;
    return map;
  }
}

/// maximum_tables__sum : 45

TableCount tableCountFromJson(String str) =>
    TableCount.fromJson(json.decode(str));
String tableCountToJson(TableCount data) => json.encode(data.toJson());

class TableCount {
  TableCount({
    int? maximumTablesSum,
  }) {
    _maximumTablesSum = maximumTablesSum;
  }

  TableCount.fromJson(dynamic json) {
    _maximumTablesSum = json['maximum_tables__sum'];
  }
  int? _maximumTablesSum;
  TableCount copyWith({
    int? maximumTablesSum,
  }) =>
      TableCount(
        maximumTablesSum: maximumTablesSum ?? _maximumTablesSum,
      );
  int? get maximumTablesSum => _maximumTablesSum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maximum_tables__sum'] = _maximumTablesSum;
    return map;
  }
}

/// restaurant_code : "SVRES8RE81VOT8L8SI2V"
/// menu_code : "ZS0MAAA0ALSL0LAP"
/// menu_name : "Supper meal"
/// menu_image : "https://images.unsplash.com/photo-1551218808-94e220e084d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
