import 'package:dukalink/presentation/widgets/atomic/app_themes.dart';
import 'package:flutter/material.dart';

class PhoneLoginField extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final Function(String)? onChanged;

  const PhoneLoginField({
    Key? key,
    required this.phoneNumberController,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<PhoneLoginField> createState() => _PhoneLoginFieldState();
}

class _PhoneLoginFieldState extends State<PhoneLoginField> {
  @override
  void initState() {
    super.initState();
    widget.phoneNumberController.text = '+254';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        alignment: Alignment.center,
        child: TextField(
          controller: widget.phoneNumberController,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '+(254) 700 000 000',
            hintStyle: TextStyle(color: DukalinkThemes.primaryColor.withOpacity(.6)),
          ),
          readOnly: true,
          showCursor: true,
          cursorColor: DukalinkThemes.orange,
          autofocus: true,
          style: const TextStyle(fontSize: 28),
          onChanged: widget.onChanged!,
        ),
      ),
    );
  }
}
