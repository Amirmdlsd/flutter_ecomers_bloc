import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget(
      {super.key,
      required this.hitnText,
      required this.icon,
      required this.controller,
      this.type = 'text'});

  final String hitnText;
  final String type;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.grey.withOpacity(.5))),
          color: Colors.white),
      margin: EdgeInsets.only(right: 30.w, left: 30.w, top: 10.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.withOpacity(.5), size: 32),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextField(
                onChanged: (value) {

                },
                obscureText: type == 'password' ? true : false,
                controller: controller,
                decoration: InputDecoration(
                    hintText: hitnText,
                    border:const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
