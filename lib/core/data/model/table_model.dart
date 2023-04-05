class Table {
  Table({
    String? restaurantCode,
    int? tableId,
    String? tableName,
    dynamic tableLocation,
  }) {
    _restaurantCode = restaurantCode;
    _tableId = tableId;
    _tableName = tableName;
    _tableLocation = tableLocation;
  }

  Table.fromJson(dynamic json) {
    _restaurantCode = json['restaurant_code'];
    _tableId = json['table_id'];
    _tableName = json['table_name'];
    _tableLocation = json['table_location'];
  }
  String? _restaurantCode;
  int? _tableId;
  String? _tableName;
  dynamic _tableLocation;
  Table copyWith({
    String? restaurantCode,
    int? tableId,
    String? tableName,
    dynamic tableLocation,
  }) =>
      Table(
        restaurantCode: restaurantCode ?? _restaurantCode,
        tableId: tableId ?? _tableId,
        tableName: tableName ?? _tableName,
        tableLocation: tableLocation ?? _tableLocation,
      );
  String? get restaurantCode => _restaurantCode;
  int? get tableId => _tableId;
  String? get tableName => _tableName;
  dynamic get tableLocation => _tableLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_code'] = _restaurantCode;
    map['table_id'] = _tableId;
    map['table_name'] = _tableName;
    map['table_location'] = _tableLocation;
    return map;
  }
}
