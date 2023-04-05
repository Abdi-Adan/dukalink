// To parse this JSON data, do
//
//     final cartVariants = cartVariantsFromJson(jsonString);

import 'dart:convert';

// CartVariants cartVariantsFromJson(String str) => CartVariants.fromJson(json.decode(str));

String cartVariantsToJson(CartVariants data) => json.encode(data.toJson());

class CartVariants {
    CartVariants({
        required this.variants,
    });

    List<CartVariant> variants;

    // factory CartVariants.fromJson(Map<String, dynamic> json) => CartVariants(
    //     variants: List<CartVariant>.from(json["variants"].map((x) => CartVariant.fromJson(x))),
    // );

    Map<String, dynamic> toJson() => {
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    };
}

class CartVariant {
  final String? name;
  final String? price;
  final String? valueName;

  CartVariant({this.name, this.price, this.valueName});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'valueName': valueName,
    };
  }
}
