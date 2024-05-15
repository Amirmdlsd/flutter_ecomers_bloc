import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/widget/cached_image.dart';

class UserImageAndNameWidget extends StatelessWidget {
  const UserImageAndNameWidget({
    super.key,
    this.avatar = '',
    required this.userName,
  });

  final String avatar;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            width: 120.w,
            height: 120.h,
            child: avatar.isNotEmpty
                ? CachedImage(imageUrl: avatar)
                : const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person_2, size: 80, color: Colors.black),
            )),
        SizedBox(height: 10.h),
        Text(
          userName,
          style: TextStyle(color: Colors.white, fontSize: 20.sp),
        )
      ],
    );
  }
}
