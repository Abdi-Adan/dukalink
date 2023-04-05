// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  Product({
    required this.id,
    required this.name,
    required this.shopName,
    required this.basePrice,
  });

  final String? id;
  final String? name;
  final String? shopName;
  final double? basePrice;


  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
