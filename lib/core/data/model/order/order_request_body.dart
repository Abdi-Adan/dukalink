class PssLoginReq {
  String? _restaurant_code;
  String? _password;

  String? get restaurant_code => _restaurant_code;
  String? get password => _password;

  restaurant_codePssLoginReq({String? restaurant_code, String? password}) {
    _restaurant_code = restaurant_code;
    _password = password;
  }

  PssLoginReq.fromJson(dynamic json) {
    _restaurant_code = json["restaurant_code"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = _restaurant_code;
    map["password"] = _password;
    return map;
  }
}
