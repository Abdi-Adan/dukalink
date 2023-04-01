// import 'package:dukalink/presentation/widgets/molecular/extended_scan_fab.dart';
// import 'package:flutter/material.dart';

// class DukalinkApp extends StatefulWidget {
//   const DukalinkApp({super.key, required this.title});

//   final String title;

//   @override
//   State<DukalinkApp> createState() => _DukalinkAppState();
// }

// class _DukalinkAppState extends State<DukalinkApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[150],
//       body: CustomScrollView(
//         scrollDirection: Axis.vertical,
//         physics: const AlwaysScrollableScrollPhysics(),
//         slivers: [
//           SliverAppBar(
//             leading: InkWell(
//               onTap: () {},
//               child: const Icon(Icons.menu, color: Colors.black),
//             ),
//             title: Text(
//               widget.title,
//               style: const TextStyle(color: Colors.black),
//             ),
//             actions: [
//               InkWell(
//                 onTap: () {},
//                 child: const Padding(
//                   padding: EdgeInsets.only(right: 20),
//                   child: Icon(Icons.settings, color: Colors.black),
//                 ),
//               ),
//             ],
//             pinned: true,
//             collapsedHeight: 80,
//             expandedHeight: 120,
//             scrolledUnderElevation: 5,
//             elevation: 5,
//             centerTitle: false,
//             backgroundColor: Colors.white,
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(48),
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: const TextField(
//                     enabled: false,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'Search',
//                       suffixIcon: Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Top shops', style: TextStyle(fontSize: 18)),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: 100,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 10,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           height: 120,
//                           width: 140,
//                           margin: const EdgeInsets.only(right: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text('Shop $index'),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Top items', style: TextStyle(fontSize: 18)),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: 300,
//                     child: GridView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 10,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 1,
//                       ),
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           margin: const EdgeInsets.only(right: 10, bottom: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Center(
//                             child: Text('Shop $index'),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Other shops', style: TextStyle(fontSize: 18)),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     child: Flexible(
//                       child: GridView.builder(
//                         scrollDirection: Axis.vertical,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: 10,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           childAspectRatio: 1,
//                         ),
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             margin:
//                                 const EdgeInsets.only(right: 10, bottom: 10),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text('Shop $index'),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton:
//           const ExtendedFAB(), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
