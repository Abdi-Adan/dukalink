import 'package:dukalink_app/shared/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormTitleAndField extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? suffixText;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final Function(String value) onChanged;
  final Function(String? value) onSaved;
  final String? Function(String? value) validate;
  final bool obscure;
  final TextInputAction textInputAction;
  const FormTitleAndField({
    Key? key,
    required this.title,
    this.hintText,
    this.suffixText,
    this.suffixIcon,
    required this.textEditingController,
    required this.onChanged,
    required this.onSaved,
    required this.validate,
    this.obscure = false,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.mulish(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10.h),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: textInputAction,
            onChanged: onChanged,
            onSaved: onSaved,
            validator: validate,
            controller: textEditingController,
            style: GoogleFonts.mulish(
              fontSize: 14,
            ),
            obscureText: obscure,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 12,
                  color: Palette.dukalinkBlack4,
                  fontWeight: FontWeight.w500),
              suffixText: suffixText,
              suffixStyle: GoogleFonts.mulish(fontWeight: FontWeight.bold),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
