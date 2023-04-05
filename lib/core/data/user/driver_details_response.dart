/// message : "user.update.success"
/// data : {"user":{"user_id":"U_ASD123","first_name":"Mickey","last_name":"Mouse","phone_number":"+2547341237890","email":"acme@example.com","tax_identification_number":"A12312312"}}

class DriverDetailsResponse {
  DriverDetailsResponse({
    String? message,
    DriverDto? data,
  }) {
    _message = message;
    _data = data;
  }

  DriverDetailsResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? DriverDto.fromJson(json['data']) : null;
  }
  String? _message;
  DriverDto? _data;

  String? get message => _message;
  DriverDto? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// user : {"user_id":"U_ASD123","first_name":"Mickey","last_name":"Mouse","phone_number":"+2547341237890","email":"acme@example.com","tax_identification_number":"A12312312"}

class DriverDto {
  DriverDto({
    Driver? driver,
  }) {
    _driver = driver;
  }

  DriverDto.fromJson(dynamic json) {
    _driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }
  Driver? _driver;

  Driver? get user => _driver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_driver != null) {
      map['user'] = _driver?.toJson();
    }
    return map;
  }
}

/// user_id : "U-YQC-9792"
/// first_name : "Tester"
/// last_name : "Faithshop"
/// phone_number : "+254711223344"
/// email : "tester@sendyit.com"

class Driver {
  Driver({
    String? userId,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
  }) {
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _email = email;
  }

  Driver.fromJson(dynamic json) {
    _userId = json['user_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phoneNumber = json['phone_number'];
    _email = json['email'];
  }
  String? _userId;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  String? _email;

  String? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone_number'] = _phoneNumber;
    map['email'] = _email;
    return map;
  }

  set phoneNumber(String? value) {
    _phoneNumber = value;
  }

  set userId(String? value) {
    _userId = value;
  }

  set email(String? value) {
    _email = value;
  }

  set lastName(String? value) {
    _lastName = value;
  }

  set firstName(String? value) {
    _firstName = value;
  }
}
