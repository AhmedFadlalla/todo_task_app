import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final void Function()? onTap;


  const TextFormFieldWidget({Key? key,
  required this.hintText,
  required this.controller,
  required this.validator,
  required this.keyboardType,
   this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:const BorderSide(
                color: Colors.grey
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:const BorderSide(
                color: Colors.grey
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:const BorderSide(
                color: Colors.grey
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:const BorderSide(
                color: Colors.grey
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide:const BorderSide(
                color: Colors.grey
            )
        ),
      ),
    );
  }
}
