import 'dart:convert';

/// status : false
/// message : "Please provide correct username and password"
/// detail : "Detailed"

ApiErrorRes apiErrorResFromJson(String str) =>
    ApiErrorRes.fromJson(json.decode(str));
String apiErrorResToJson(ApiErrorRes data) => json.encode(data.toJson());

class ApiErrorRes {
  ApiErrorRes({
    bool? status,
    String? message,
    String? detail,
  }) {
    _status = status;
    _message = message;
    _detail = detail;
  }

  ApiErrorRes.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'] ?? json['detail'];
    _detail = json['detail'] ?? json['message'];
  }
  bool? _status;
  String? _message;
  String? _detail;
  ApiErrorRes copyWith({
    bool? status,
    String? message,
    String? detail,
  }) =>
      ApiErrorRes(
        status: status ?? _status,
        message: message ?? _message,
        detail: detail ?? _detail,
      );
  bool? get status => _status;
  String? get message => _message;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['detail'] = _detail;
    return map;
  }
}
