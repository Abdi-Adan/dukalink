import 'package:flutter/material.dart';

import '../../core/data/model/menu_model.dart';

class CategoryIconWithText extends StatelessWidget {
  final List<MenuCategory> menu;
  CategoryIconWithText({
    Key? key,
    required this.menu,
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
    return SizedBox(
      height: 75,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menu.length,
        itemBuilder: (context, index) {
          // if (index == categories.length) {
          //   return Padding(
          //     padding: const EdgeInsets.only(right: 30),
          //     child: Column(
          //       children: [
          //         Material(
          //           color: Colors.transparent,
          //           borderRadius: BorderRadius.circular(50.0),
          //           child: InkWell(
          //             onTap: () {},
          //             borderRadius: BorderRadius.circular(50.0),
          //             child: CircleAvatar(
          //               backgroundColor: Colors
          //                   .primaries[index % Colors.primaries.length]
          //                   .withOpacity(0.5),
          //               child: FaIcon(
          //                 FontAwesomeIcons.plus,
          //                 color: Colors.black,
          //                 size: 16,
          //               ),
          //             ),
          //           ),
          //         ),
          //         const SizedBox(height: 10),
          //         Text(
          //           "More",
          //           style: TextStyle(
          //             fontSize: 10,
          //             color: Colors.grey.shade600,
          //           ),
          //         ),
          //       ],
          //     ),
          //   );
          // }

          return Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              children: [
                Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50.0),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50.0),
                      child: CircleAvatar(
                        backgroundColor: Colors
                            .primaries[index % Colors.primaries.length]
                            .withOpacity(0.5),
                        backgroundImage:
                            NetworkImage('${menu[index].menuImage}'),
                      ),
                    )),
                const SizedBox(height: 10),
                Text(
                  '${menu[index].menuName}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
