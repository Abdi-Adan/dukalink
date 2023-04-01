import 'package:flutter/material.dart';

class UnrecoverableErrorWidget extends StatelessWidget {
  const UnrecoverableErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('errorDisplayImgUrl'), fit: BoxFit.fitHeight),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(3, 0), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: const Text(
            '404',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
