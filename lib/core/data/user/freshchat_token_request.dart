/// user_id : "U_ASDF123"
/// token : "TASDDFGDFGH"
/// avatar_id : "ASDFFDGDG"

class FreshChatTokenRequest {
  FreshChatTokenRequest({
    String? userId,
    String? token,
    String? avatarId,
  }) {
    _userId = userId;
    _token = token;
    _avatarId = avatarId;
  }

  FreshChatTokenRequest.fromJson(dynamic json) {
    _userId = json['user_id'];
    _token = json['token'];
    _avatarId = json['avatar_id'];
  }
  String? _userId;
  String? _token;
  String? _avatarId;

  String? get userId => _userId;
  String? get token => _token;
  String? get avatarId => _avatarId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['token'] = _token;
    map['avatar_id'] = _avatarId;
    return map;
  }
}
