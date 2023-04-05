/// message : "freshchat.token.update.success"
/// data : {"token":"string","avatar_id":"string"}

class FreshChatTokenResponse {
  FreshChatTokenResponse({
    String? message,
    FreshData? data,
  }) {
    _message = message;
    _data = data;
  }

  FreshChatTokenResponse.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? FreshData.fromJson(json['data']) : null;
  }
  String? _message;
  FreshData? _data;

  String? get message => _message;
  FreshData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// token : "string"
/// avatar_id : "string"

class FreshData {
  FreshData({
    String? token,
    String? avatarId,
  }) {
    _token = token;
    _avatarId = avatarId;
  }

  FreshData.fromJson(dynamic json) {
    _token = json['token'];
    _avatarId = json['avatar_id'];
  }
  String? _token;
  String? _avatarId;

  String? get token => _token;
  String? get avatarId => _avatarId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['avatar_id'] = _avatarId;
    return map;
  }
}
