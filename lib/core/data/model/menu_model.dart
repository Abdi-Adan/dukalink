
// TODO note... Old menu category
class MenuCategory {
  MenuCategory({
    String? restaurantCode,
    String? menuCode,
    String? menuName,
    String? menuImage,
  }) {
    _restaurantCode = restaurantCode;
    _menuCode = menuCode;
    _menuName = menuName;
    _menuImage = menuImage;
  }

  MenuCategory.fromJson(dynamic json) {
    _restaurantCode = json['restaurant_code'];
    _menuCode = json['menu_code'];
    _menuName = json['menu_name'];
    _menuImage = json['menu_image'];
  }
  String? _restaurantCode;
  String? _menuCode;
  String? _menuName;
  String? _menuImage;
  MenuCategory copyWith({
    String? restaurantCode,
    String? menuCode,
    String? menuName,
    String? menuImage,
  }) =>
      MenuCategory(
        restaurantCode: restaurantCode ?? _restaurantCode,
        menuCode: menuCode ?? _menuCode,
        menuName: menuName ?? _menuName,
        menuImage: menuImage ?? _menuImage,
      );
  String? get restaurantCode => _restaurantCode;
  String? get menuCode => _menuCode;
  String? get menuName => _menuName;
  String? get menuImage => _menuImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['restaurant_code'] = _restaurantCode;
    map['menu_code'] = _menuCode;
    map['menu_name'] = _menuName;
    map['menu_image'] = _menuImage;
    return map;
  }
}



// class MenuCategory {
//   MenuCategory({
//     required this.id,
//     this.sectionCode,
//     required this.sectionName,
//     this.sectionImage,
//     required this.updatedOn,
//     required this.dateCreated,
//     this.deletedAt,
//     required this.menuId,
//   });

//   String id;
//   dynamic sectionCode;
//   String sectionName;
//   dynamic sectionImage;
//   DateTime updatedOn;
//   DateTime dateCreated;
//   dynamic deletedAt;
//   String menuId;

//   factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
//         id: json["id"],
//         sectionCode: json["section_code"],
//         sectionName: json["section_name"],
//         sectionImage: json["section_image"],
//         updatedOn: DateTime.parse(json["updated_on"]),
//         dateCreated: DateTime.parse(json["date_created"]),
//         deletedAt: json["deleted_at"],
//         menuId: json["menu_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "section_code": sectionCode,
//         "section_name": sectionName,
//         "section_image": sectionImage,
//         "updated_on": updatedOn.toIso8601String(),
//         "date_created": dateCreated.toIso8601String(),
//         "deleted_at": deletedAt,
//         "menu_id": menuId,
//       };
// }