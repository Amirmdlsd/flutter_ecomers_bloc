import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemChip extends StatelessWidget {
  const ProfileItemChip(
      {super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          borderRadius: BorderRadius.circular(12.r),
          elevation: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 20.w),
                Text(
                  text,
                  style: TextStyle(fontSize: 16.sp),
                ),
                const Spacer(),
                const RotatedBox(
                    quarterTurns: -2, child: Icon(Icons.arrow_back_ios_sharp)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}