import 'dart:convert';

/// status : true
/// message : "User login successful"
/// access_token : "eyJhbGciOiJSUzI1NiIsImtpZCI6ImFkMWIxOWYwZjU4ZTJjOWE5Njc3M2M5MmNmODA0NDEwMTc5NzEzMjMiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiV2VjaHVsaSBNYXZpbiIsInBpY3R1cmUiOiJodHRwczovL2Nkbi5mYWtlcmNsb3VkLmNvbS9hdmF0YXJzL3NlcmdleXNhZm9ub3ZfMTI4LmpwZyIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9kYWdpem8iLCJhdWQiOiJkYWdpem8iLCJhdXRoX3RpbWUiOjE2NjA4MDUxMjYsInVzZXJfaWQiOiJCMTRDRHd1T20waEdOYnVoMElmekFKRldaTzczIiwic3ViIjoiQjE0Q0R3dU9tMGhHTmJ1aDBJZnpBSkZXWk83MyIsImlhdCI6MTY2MDgwNTEyNiwiZXhwIjoxNjYwODA4NzI2LCJlbWFpbCI6Im1hdmVud2VjaHVsaUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZW1haWwiOlsibWF2ZW53ZWNodWxpQGdtYWlsLmNvbSJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.HuyfCS2KH4zKLOEFnBYM_LlDogAtUxK8XY0JcNCg9A6WZSmV9DuGwnhNxv6G7HRnobz6e1aYW-Nwqfq0qOoMPopFhXPK4wtc9tyf8k1uIk4hu8D18S1bYecjphcKcuO6ACyfcMgpWbJ9OU9tsjwrWPNucr388MN9RqfQZ4DmQ4EQFpRA4RGEypcgdAiYDOZ5164LD6tPND1Or0VAdmT_UqcB7ov91sDHhov32FgXsW0obCG-Srz-Ofi_0GpuX5xqui4vvIi6ATfyx6JuB5AruGlokkVQv_7qNyXp-XzGOwjGUvDDbq2zOLTUFSk1D8nfK2aJryqj4u3lbJpCF7UxGA"
/// refresh_token : "AOEOulYA4Hs6SB0Io2o3L6e7vnyJaDaOkK20oOYeSzvIu8GXcp5bPOX6ohBA2blYSNKehp287jtBelhO7CnTFVuFxtkSdE59rXacbvEnCqLSkltcvu4aboGHmWq3Gl8a61MOvJ7YJX8e_twASv6cFyA9mjZa-Dh-Vdwxnzbt-FAkrm9pcDllQhlsxo1oCJPidn6VUQpz3sIylqpk5brh5m7MtHLwl_Ybmg"
/// token_type : "Bearer"
/// expires_in : "3600"
/// user_id : "B14CDwuOm0hGNbuh0IfzAJFWZO73"
/// user : {"id":"B14CDwuOm0hGNbuh0IfzAJFWZO73","first_name":"Wechuli","last_name":"Mavin","mobile_number":"254799143482","email":"mavenwechuli@gmail.com","user_type":"Client","date_created":"2022-08-14T19:51:47.530146Z","updated_on":"2022-08-14T19:51:47.530128Z"}

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    bool? status,
    String? message,
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    String? expiresIn,
    String? userId,
    User? user,
  }) {
    _status = status;
    _message = message;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _userId = userId;
    _user = user;
  }

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _userId = json['user_id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? _status;
  String? _message;
  String? _accessToken;
  String? _refreshToken;
  String? _tokenType;
  String? _expiresIn;
  String? _userId;
  User? _user;
  LoginResponse copyWith({
    bool? status,
    String? message,
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    String? expiresIn,
    String? userId,
    User? user,
  }) =>
      LoginResponse(
        status: status ?? _status,
        message: message ?? _message,
        accessToken: accessToken ?? _accessToken,
        refreshToken: refreshToken ?? _refreshToken,
        tokenType: tokenType ?? _tokenType,
        expiresIn: expiresIn ?? _expiresIn,
        userId: userId ?? _userId,
        user: user ?? _user,
      );
  bool? get status => _status;
  String? get message => _message;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get tokenType => _tokenType;
  String? get expiresIn => _expiresIn;
  String? get userId => _userId;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['user_id'] = _userId;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

/// id : "B14CDwuOm0hGNbuh0IfzAJFWZO73"
/// first_name : "Wechuli"
/// last_name : "Mavin"
/// mobile_number : "254799143482"
/// email : "mavenwechuli@gmail.com"
/// user_type : "Client"
/// date_created : "2022-08-14T19:51:47.530146Z"
/// updated_on : "2022-08-14T19:51:47.530128Z"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    String? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? email,
    String? userType,
    String? dateCreated,
    String? updatedOn,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _mobileNumber = mobileNumber;
    _email = email;
    _userType = userType;
    _dateCreated = dateCreated;
    _updatedOn = updatedOn;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _mobileNumber = json['phone'];
    _email = json['email'];
    _userType = json['user_type'];
    _dateCreated = json['date_created'];
    _updatedOn = json['updated_on'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _mobileNumber;
  String? _email;
  String? _userType;
  String? _dateCreated;
  String? _updatedOn;
  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? email,
    String? userType,
    String? dateCreated,
    String? updatedOn,
  }) =>
      User(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        mobileNumber: mobileNumber ?? _mobileNumber,
        email: email ?? _email,
        userType: userType ?? _userType,
        dateCreated: dateCreated ?? _dateCreated,
        updatedOn: updatedOn ?? _updatedOn,
      );
  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get mobileNumber => _mobileNumber;
  String? get email => _email;
  String? get userType => _userType;
  String? get dateCreated => _dateCreated;
  String? get updatedOn => _updatedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['mobile_number'] = _mobileNumber;
    map['email'] = _email;
    map['user_type'] = _userType;
    map['date_created'] = _dateCreated;
    map['updated_on'] = _updatedOn;
    return map;
  }
}
