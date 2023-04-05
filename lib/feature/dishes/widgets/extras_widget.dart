// import 'package:dukalink_app/shared/configs/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FoodExtrasWidget extends StatefulWidget {
//   const FoodExtrasWidget({Key? key}) : super(key: key);

//   @override
//   State<FoodExtrasWidget> createState() => _FoodExtrasWidgetState();
// }

// class _FoodExtrasWidgetState extends State<FoodExtrasWidget> {
//   bool checked = false;

//   List<String> addons = [
//     'Extra cheese',
//     'Extra avocado',
//     'Chilly',
//     'Kachumbari',
//     'Sour Soup'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(1),
//       itemCount: addons.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           leading: Checkbox(
//               value: checked,
//               activeColor: Palette.dukalinkBlack1,
//               onChanged: (value) {
//                 if (checked) {
//                   setState(() {
//                     checked = false;
//                   });
//                 } else {
//                   setState(() {
//                     checked = true;
//                   });
//                 }
//               }),
//           title: Text(
//             addons[index],
//             maxLines: 3,
//             style: TextStyle(
//               color: Palette.dukalinkBlack2,
//               fontWeight: FontWeight.w500,
//               fontSize: 12.sp,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
