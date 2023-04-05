/// mediaUrl : "{{$randomImageUrl}}"
/// mediaPathUrl : "/users/1"
/// mediaType : "image/jpeg"

class AssetModel {
  AssetModel({
    String? mediaUrl,
    String? mediaPathUrl,
    String? mediaType,
  }) {
    _mediaUrl = mediaUrl;
    _mediaPathUrl = mediaPathUrl;
    _mediaType = mediaType;
  }

  AssetModel.fromJson(dynamic json) {
    _mediaUrl = json['mediaUrl'];
    _mediaPathUrl = json['mediaPathUrl'];
    _mediaType = json['mediaType'];
  }

  String? _mediaUrl;
  String? _mediaPathUrl;
  String? _mediaType;

  AssetModel copyWith({
    String? mediaUrl,
    String? mediaPathUrl,
    String? mediaType,
  }) =>
      AssetModel(
        mediaUrl: mediaUrl ?? _mediaUrl,
        mediaPathUrl: mediaPathUrl ?? _mediaPathUrl,
        mediaType: mediaType ?? _mediaType,
      );

  String? get mediaUrl => _mediaUrl;

  String? get mediaPathUrl => _mediaPathUrl;

  String? get mediaType => _mediaType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mediaUrl'] = _mediaUrl;
    map['mediaPathUrl'] = _mediaPathUrl;
    map['mediaType'] = _mediaType;
    return map;
  }
}
