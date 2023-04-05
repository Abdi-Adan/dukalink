// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: Example(),
// //   ));
// // }

// @immutable
// class Example extends StatelessWidget {
//    Example({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: OrderProgress(
//           step: 2,
//           children: [
//             Text('Ordered'),
//             Text('Posted'),
//             Column(
//               children: [
//                 Text('Expected'),
//                 Text('1 Oct'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// @immutable
// class OrderProgress extends StatefulWidget {
//   const OrderProgress({
//     Key? key,
//     this.step,
//     @required this.children,
//   }) : super(key: key);

//   final int? step;
//   final List<Widget>? children;

//   @override
//   _OrderProgressState createState() => _OrderProgressState();
// }

// class _OrderProgressState extends State<OrderProgress> {
//   List<GlobalKey>? _keys;

//   @override
//   void initState() {
//     super.initState();
//     _keys = List.generate(widget.children!.length, (_) => GlobalKey());
//   }

//   @override
//   void didUpdateWidget(covariant OrderProgress oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.children!.length != oldWidget.children!.length) {
//       if (widget.children!.length < oldWidget.children!.length) {
//         _keys = _keys!.sublist(0, widget.children!.length);
//       } else {
//         _keys!.addAll(
//           List.generate(
//             widget.children!.length - oldWidget.children!.length,
//                 (_) => GlobalKey(),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _BackgroundStepBar(
//       keys: _keys!,
//       step: widget.step!,
//       color: Colors.blue,
//       thickness: 8.0,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           for (int i = 0; i < widget.children!.length; i++)
//             DefaultTextStyle.merge(
//               style: TextStyle(
//                 color: (i < widget.step!) ? Colors.black : Colors.grey.shade500,
//                 fontSize: 12.0,
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   DecoratedBox(
//                     key: _keys![i],
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: (i < widget.step!) ? Colors.blue : Colors.grey.shade300,
//                     ),
//                     child: SizedBox(
//                       width: 32.0,
//                       height: 32.0,
//                       child: Center(
//                         child: DecoratedBox(
//                           decoration: const BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                           ),
//                           child: SizedBox(
//                             width: 16.0,
//                             height: 16.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24.0),
//                   widget.children![i],
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// @immutable
// class _BackgroundStepBar extends SingleChildRenderObjectWidget {
//   const _BackgroundStepBar({
//     Key? key,
//     required this.keys,
//     required this.step,
//     required this.color,
//     required this.thickness,
//     Widget? child,
//   }) : super(key: key, child: child);

//   final List<GlobalKey> keys;
//   final int step;
//   final Color color;
//   final double thickness;

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return _RenderBackgroundBar(
//       keys: keys,
//       step: step,
//       color: color,
//       thickness: thickness,
//     );
//   }

//   @override
//   void updateRenderObject(BuildContext context, covariant _RenderBackgroundBar renderObject) {
//     renderObject
//       ..keys = keys
//       ..step = step
//       ..color = color
//       ..thickness = thickness;
//   }
// }

// class _RenderBackgroundBar extends RenderProxyBox {
//   _RenderBackgroundBar({
//     @required List<GlobalKey>? keys,
//     @required int? step,
//     @required Color? color,
//     @required double? thickness,
//     RenderBox? child,
//   })
//       : _keys = keys!,
//         _step = step!,
//         _color = color!,
//         _thickness = thickness!,
//         super(child);

//   List<GlobalKey> _keys;
//   int _step;
//   Color _color;
//   double _thickness;

//   set keys(List<GlobalKey> value) {
//     if (_keys != value) {
//       _keys = value;
//       markNeedsPaint();
//     }
//   }

//   set step(int value) {
//     if (_step != value) {
//       _step = value;
//       markNeedsPaint();
//     }
//   }

//   set color(Color value) {
//     if (_color != value) {
//       _color = value;
//       markNeedsPaint();
//     }
//   }

//   set thickness(double value) {
//     if (_thickness != value) {
//       _thickness = value;
//       markNeedsPaint();
//     }
//   }

//   Rect _keyToRect(int index) {
//     final box = _keys[index].currentContext!.findRenderObject() as RenderBox;
//     return box.localToGlobal(Offset.zero, ancestor: this) & box.size;
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     final firstRect = _keyToRect(0);
//     final activeRect = _keyToRect(_step - 1);
//     final lastRect = _keyToRect(_keys.length - 1);
//     final canvas = context.canvas;
//     canvas.save();
//     canvas.translate(offset.dx, offset.dy);
//     final paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = _thickness;
//     canvas.drawLine(firstRect.center, lastRect.center, paint..color = Colors.grey.shade300);
//     canvas.drawLine(firstRect.center, activeRect.center, paint..color = _color);
//     canvas.restore();
//     super.paint(context, offset);
//   }
// }


import 'package:flutter/material.dart';

class OrderProgressStepper extends StatefulWidget {
  @override
  _OrderProgressStepperState createState() => _OrderProgressStepperState();
}

class _OrderProgressStepperState extends State<OrderProgressStepper> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  int _currentIndex = 0;
  List<String> _steps = [
    'Order Confirmed',
    'Order Preparing',
    'Order Served',
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!);

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _steps
                .map(
                  (step) => Expanded(
                    child: Text(
                      step,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _steps.indexOf(step) <= _currentIndex ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              Container(
                height: 2,
                color: Colors.grey[300],
              ),
              AnimatedBuilder(
                animation: _animation!,
                builder: (context, child) => Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width / 3 * _animation!.value,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (_currentIndex > 0) {
                    setState(() {
                      _currentIndex--;
                    });
                    _controller!.reverse();
                  }
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_currentIndex < _steps.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                    _controller!.forward(from: 0);
                  }
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _currentIndex < _steps.length - 1 ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
