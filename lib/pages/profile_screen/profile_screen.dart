import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/locator.dart';
import 'package:untitled2/pages/profile_screen/widget/profile_item_chip.dart';
import 'package:untitled2/pages/profile_screen/widget/user_image_and_name_widget.dart';
import 'package:untitled2/utils/auth_manager.dart';
import 'package:untitled2/utils/image_handler.dart';
import 'package:untitled2/widget/cached_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var imageHandler = locator.get<ImageHandler>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(80.r))),
              child: const UserImageAndNameWidget(
                userName: 'نام کاربر',
              ),
            ),
            SizedBox(height: 50.h),
            ProfileItemChip(
              text: 'ویرایش مخصات',
              icon: Icons.edit,
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            ProfileItemChip(
              text: 'تغییر رمز عبور',
              icon: Icons.password_outlined,
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            ProfileItemChip(
              text: 'خروج از حساب',
              icon: Icons.logout,
              onTap: () {
                AuthManager.deleteLoginData();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/loginScreen', (route) => false);
              },
            ),
          ],
        ),
      )),
    );
  }
}



// SizedBox(
// width: 150.w,
// height: 150.h,
// child: imageHandler.getImageFile != null
// ? ClipRRect(
// borderRadius: BorderRadius.circular(80.r),
// child: Image.file(
// File(imageHandler.getImageFile!.path),
// fit: BoxFit.cover))
//     :const CircleAvatar(
// backgroundColor: Colors.white,
// child: const Icon(Icons.person_2,
// size: 80, color: Colors.black),
// )),
// TextButton(
// onPressed: () {
// imageHandler
//     .getUserImage(source: ImageSource.gallery)
//     .then((value) => setState(() {}));
// },
// child: Text(
// 'انتخاب عکس',
// style: TextStyle(color: Colors.white, fontSize: 20.sp),
// ))
