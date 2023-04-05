/// email : "89254021084146138595"
/// password : "+254708440184"

class EmailPssLoginReq {
  String? _email;
  String? _password;

  String? get email => _email;
  String? get password => _password;

  EmailPssLoginReq({String? email, String? password}) {
    _email = email;
    _password = password;
  }

  EmailPssLoginReq.fromJson(dynamic json) {
    _email = json["email"];
    _password = json["password"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = _email;
    map["password"] = _password;
    return map;
  }
}
