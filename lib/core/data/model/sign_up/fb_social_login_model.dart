/// email : "dsmr.apps@gmail.com"
/// id : 3003332493073668
/// name : "Darwin Morocho"
/// picture : {"data":{"height":50,"is_silhouette":0,"url":"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668","width":50}}

class FbSocialLoginModel {
  String? email;
  int? id;
  String? name;
  Picture? picture;

  FbSocialLoginModel({this.email, this.id, this.name, this.picture});

  FbSocialLoginModel.fromJson(dynamic json) {
    email = json["email"];
    id = json["id"];
    name = json["name"];
    picture =
        json["picture"] != null ? Picture.fromJson(json["picture"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["email"] = email;
    map["id"] = id;
    map["name"] = name;
    if (picture != null) {
      map["picture"] = picture?.toJson();
    }
    return map;
  }
}

/// data : {"height":50,"is_silhouette":0,"url":"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668","width":50}

class Picture {
  FbData? data;

  Picture({this.data});

  Picture.fromJson(dynamic json) {
    data = json["data"] != null ? FbData.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }
}

/// height : 50
/// is_silhouette : 0
/// url : "https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3003332493073668"
/// width : 50

class FbData {
  int? height;
  int? isSilhouette;
  String? url;
  int? width;

  FbData({this.height, this.isSilhouette, this.url, this.width});

  FbData.fromJson(dynamic json) {
    height = json["height"];
    isSilhouette = json["is_silhouette"];
    url = json["url"];
    width = json["width"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["height"] = height;
    map["is_silhouette"] = isSilhouette;
    map["url"] = url;
    map["width"] = width;
    return map;
  }
}
