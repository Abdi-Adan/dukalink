/// message : "login.fail"
/// data : null
/// errors : [{"message":"user.email.already.exists","source":"user-service","value":"mzitojob@gmail.com"}]

class ErrorsModel {
  ErrorsModel({
    String? message,
    dynamic data,
    List<Errors>? errors,
  }) {
    _message = message;
    _data = data;
    _errors = errors;
  }

  ErrorsModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'];
    if (json['errors'] != null) {
      _errors = [];
      json['errors'].forEach((v) {
        _errors?.add(Errors.fromJson(v));
      });
    }
  }

  String? _message;
  dynamic _data;
  List<Errors>? _errors;

  String? get message => _message;

  dynamic get data => _data;

  List<Errors>? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['data'] = _data;
    if (_errors != null) {
      map['errors'] = _errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// message : "user.email.already.exists"
/// source : "user-service"
/// value : "mzitojob@gmail.com"

class Errors {
  Errors({
    String? message,
    String? source,
    String? value,
  }) {
    _message = message;
    _source = source;
    _value = value;
  }

  Errors.fromJson(dynamic json) {
    _message = json['message'];
    _source = json['source'];
    if (json['value'] != null) _value = json['value'];
  }

  String? _message;
  String? _source;
  String? _value;

  String? get message => _message;

  String? get source => _source;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['source'] = _source;
    map['value'] = _value;
    return map;
  }
}
