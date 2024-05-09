import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key, required this.lable, required this.onTap,
    this.bg=Colors.blue
  });
  final String lable;
  final Function()onTap;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 30.w, vertical: 10.h),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r)),
              backgroundColor: bg,
              minimumSize: Size(double.infinity, 40.h)),
          child:  Text(
            lable,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
