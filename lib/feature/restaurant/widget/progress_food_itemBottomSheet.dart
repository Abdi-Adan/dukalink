import 'package:dukalink_app/core/data/model/order_item.dart';
import 'package:dukalink_app/responsive.dart';
import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/data/model/new_orders_model.dart';
import '../../../core/data/model/orderTrackingModel.dart';
import '../../../core/data/model/userOrdersModel.dart';

class ProgressFoodItemBottomSheet extends StatelessWidget {
  const ProgressFoodItemBottomSheet({
    Key? key,
    required this.orderItem,
  }) : super(key: key);
//  Todo uncomment this
  // final OrderItem orderItem;
  final List<OrderDetail>? orderItem;

  @override
  Widget build(BuildContext context) {
    bool isWeb = Responsive.isDesktop(context);
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: orderItem?.length,
        itemBuilder: (context, index) {
          // UserOrders previousOrder = previousOrders[index];
          return Padding(
            padding: EdgeInsets.only(
                left: 10.sm, right: 12.sm, top: 7.sm, bottom: 7.sm),
            child: Container(
              color: Palette.dukalinkInputColor,
              child: Row(children: [
                SizedBox(
                  height: 60.h,
                  width: 60.h,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        // TODO add image
                        image: NetworkImage(
                            '${orderItem?[index].foodImage![0].url}'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${orderItem?[index].orderList?.foodFoodName}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Palette.dukalinkBlack)),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: size.width * 0.58,
                      child: Row(
                        children: [
                          Text('${orderItem?[index].orderList?.quantity} x',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.dukalinkBlack2)),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.0.sm,
                                bottom: 7.sm,
                                left: 5.sm,
                                right: 5.sm),
                            child: Center(
                              child: Text(
                                'Ksh ${orderItem?[index].orderList?.foodPrice}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Palette.dukalinkBlack2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          );
        });
  }
}
