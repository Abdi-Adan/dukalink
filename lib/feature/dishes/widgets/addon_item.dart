import 'package:dukalink_app/core/data/model/dishes_model.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/model/newFavoriteFoodModel.dart';

class AddonTile extends StatefulWidget {
  final FoodAddon? addon;
  final ValueChanged<bool> isSelected;

  const AddonTile({Key? key, this.addon, required this.isSelected})
      : super(key: key);

  @override
  State<AddonTile> createState() => _AddonTileState();
}

class _AddonTileState extends State<AddonTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    var price = widget.addon?.addon!.price;

    return ListTile(
      leading: Checkbox(
          value: isSelected,
          activeColor: Palette.dukalinkBlack1,
          onChanged: (value) {
            setState(() {
              isSelected = !isSelected;
              widget.isSelected(isSelected);
            });
          }),
      title: Text(
        '${widget.addon!.addon!.foodName}',
        maxLines: 3,
        style: TextStyle(
          color: Palette.dukalinkBlack2,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
      ),
      trailing: (price != 0)
          ? Text(
              '$price',
              style: TextStyle(
                color: Palette.dukalinkBlack,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
