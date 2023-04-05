// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable(explicitToJson: true)
class Shop {
  Shop({
    required this.id,
    required this.name,
    required this.type,
  });

  final String? id;
  final String? name;
  final String? type;

  factory Shop.fromJson(Map<String, dynamic> json) =>
      _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
