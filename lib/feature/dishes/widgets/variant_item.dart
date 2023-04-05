import 'package:dukalink_app/core/data/model/dishes_model.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/model/newFavoriteFoodModel.dart';

class VariantTile extends StatefulWidget {
  final Variant? variants;
  final List<Variant>? variantValues;
  late List<ValueChanged<bool>>? isSelected;
  final ValueChanged<double>? onTotalAmountChanged;
  late ValueChanged<String>? onValueChanged;

  // ValueChanged<bool>? isSelected;

  VariantTile(
      {Key? key,
      this.variants,
      this.variantValues,
      required this.isSelected,
      required this.onTotalAmountChanged,
      required this.onValueChanged})
      : super(key: key);

  @override
  State<VariantTile> createState() => _VariantTileState();
}

class _VariantTileState extends State<VariantTile> {
  List<bool> _isSelectedList = [];
  @override
  void initState() {
    super.initState();
    // Initialize the selection state of each checkbox to false
    debugPrint("SELECTED LIST: ${widget.variants!.values}");

    _isSelectedList = List.filled(widget.variants!.values!.length, false);
    debugPrint("SELECTED LIST: ${_isSelectedList}");
  }

  double get totalAmount {
    double total = 0.0;
    for (int i = 0; i < widget.variants!.values!.length; i++) {
      if (_isSelectedList[i]) {
        total += double.parse(widget.variants!.values![i].price!);
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: const EdgeInsets.all(1),
          itemCount: widget.variants?.values?.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Checkbox(
                  value: _isSelectedList[index],
                  activeColor: Palette.dukalinkBlack1,
                  onChanged: (value) {
                    setState(() {
                      _isSelectedList =
                          List.filled(widget.variants!.values!.length, false);
                      _isSelectedList[index] = value!;
                      widget.isSelected![index](value);
                      widget.onTotalAmountChanged!(totalAmount);
                      widget.onValueChanged!(
                          widget.variants!.values![index].valueName!);
                    });
                    debugPrint("SELECTED ITEM LIST Final: ${_isSelectedList}");
                  }),
              title: Text(
                '${widget.variants!.values![index].valueName}',
                maxLines: 3,
                style: TextStyle(
                  color: Palette.dukalinkBlack2,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              trailing: Text(
                '${widget.variants?.values![index].price}',
                style: TextStyle(
                  color: Palette.dukalinkBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            );
          }),
    );
  }
}
