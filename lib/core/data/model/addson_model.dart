class AddOns {
  AddOns({
    int? id,
    String? restaurantCode,
    int? maximumCount,
    String? addonName,
    double? price,
    bool? isRequired,
  }) {
    _id = id;
    _restaurantCode = restaurantCode;
    _maximumCount = maximumCount;
    _addonName = addonName;
    _price = price;
    _isRequired = isRequired;
  }

  AddOns.fromJson(dynamic json) {
    _id = json['id'];
    _restaurantCode = json['restaurant_code'];
    _maximumCount = json['maximum_count'];
    _addonName = json['addon_name'];
    _price = json['price'];
    _isRequired = json['isRequired'];
  }
  int? _id;
  String? _restaurantCode;
  int? _maximumCount;
  String? _addonName;
  double? _price;
  bool? _isRequired;
  AddOns copyWith({
    int? id,
    String? restaurantCode,
    int? maximumCount,
    String? addonName,
    double? price,
    bool? isRequired,
  }) =>
      AddOns(
        id: id ?? _id,
        restaurantCode: restaurantCode ?? _restaurantCode,
        maximumCount: maximumCount ?? _maximumCount,
        addonName: addonName ?? _addonName,
        price: price ?? _price,
        isRequired: isRequired ?? _isRequired,
      );
  int? get id => _id;
  String? get restaurantCode => _restaurantCode;
  int? get maximumCount => _maximumCount;
  String? get addonName => _addonName;
  double? get price => _price;
  bool? get isRequired => _isRequired;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['restaurant_code'] = _restaurantCode;
    map['maximum_count'] = _maximumCount;
    map['addon_name'] = _addonName;
    map['price'] = _price;
    map['isRequired'] = _isRequired;
    return map;
  }
}
