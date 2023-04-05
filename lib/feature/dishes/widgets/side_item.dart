import 'package:dukalink_app/core/data/model/dishes_model.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidesTile extends StatefulWidget {
  final Sides? side;
  final ValueChanged<bool> isSelected;

  const SidesTile({Key? key, this.side, required this.isSelected})
      : super(key: key);

  @override
  State<SidesTile> createState() => _SidesTileState();
}

class _SidesTileState extends State<SidesTile> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
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
        '${widget.side?.sideName}',
        maxLines: 3,
        style: TextStyle(
          color: Palette.dukalinkBlack2,
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
        ),
      ),
      trailing: Text(
        '${widget.side?.price}',
        style: TextStyle(
          color: Palette.dukalinkBlack,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
