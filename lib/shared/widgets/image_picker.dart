import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:dukalink_app/shared/configs/styles.dart';

class PickImageOptions extends StatefulWidget {
  final Function onOptionSelected;

  const PickImageOptions({Key? key, required this.onOptionSelected})
      : super(key: key);

  @override
  _PickImageOptionsState createState() => _PickImageOptionsState();
}

class _PickImageOptionsState extends State<PickImageOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Pick Image'),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  InkWell(
                    onTap: () {
                      widget.onOptionSelected('gallery');
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          const Icon(Icons.image),
                          SizedBox(
                            width: 20.w,
                          ),
                          const Text('Photo Library')
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade300,
                  ),
                  InkWell(
                    onTap: () {
                      widget.onOptionSelected('camera');
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          const Icon(Icons.camera_alt),
                          SizedBox(
                            width: 20.w,
                          ),
                          const Text('Take Photo')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Cancel',
                  style: Styles.normalTextStyle.copyWith(
                      color: Palette.transPrimaryColor, fontSize: 13.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
