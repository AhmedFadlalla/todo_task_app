import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const BottomWidget({Key? key,
  required this.text,
  required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.pink
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}
