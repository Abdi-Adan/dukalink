import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishReviews extends StatelessWidget {
  static const routeName = 'DishReviews';
  final int? count;

  DishReviews({
    Key? key,
    this.count,
  }) : super(key: key);
  List<String> names = [
    'Starter',
    'Breakfirst',
    'Lunch',
    'Dinner',
    'Special',
    'Yummy'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: count ?? names.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeConfig.screenWidth * 0.85,
                child: Row(
                  children: [
                    Text(
                      'Java Mbagathi',
                      style: TextStyle(
                        color: Palette.dukalinkBlack1,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '25/06/2020',
                      style: TextStyle(
                        color: Palette.dukalinkBlack1,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '4.5',
                    style: TextStyle(
                      color: Palette.dukalinkBlack1,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: 2.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'The food was amazing but the wait time was high.',
                style: TextStyle(
                  color: Palette.dukalinkBlack1,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
