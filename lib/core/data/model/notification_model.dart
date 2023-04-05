class Notification {
  Notification({
    String? title,
    String? subtitle,
    String? body,
    dynamic createdAt,
    bool? isRead,
  }) {
    _title = title;
    _subtitle = subtitle;
    _body = body;
    _createdAt = createdAt;
    _isRead = isRead;
  }

  Notification.fromJson(dynamic json) {
    _title = json['title'];
    _subtitle = json['subtitle'];
    _body = json['body'];
    _createdAt = json['created_at'];
    _isRead = json['isRead'];
  }
  String? _title;
  String? _subtitle;
  String? _body;
  dynamic _createdAt;
  bool? _isRead;
  Notification copyWith({
    String? title,
    String? subtitle,
    String? body,
    dynamic createdAt,
    bool? isRead,
  }) =>
      Notification(
        title: title ?? _title,
        subtitle: subtitle ?? _subtitle,
        body: body ?? _body,
        createdAt: createdAt ?? _createdAt,
        isRead: isRead ?? _isRead,
      );
  String? get title => _title;
  String? get subtitle => _subtitle;
  String? get body => _body;
  dynamic get createdAt => _createdAt;
  bool? get isRead => _isRead;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_code'] = _title;
    map['notification_id'] = _subtitle;
    map['notification_name'] = _body;
    map['notification_location'] = _createdAt;
    map['isRead'] = _isRead;
    return map;
  }
}
