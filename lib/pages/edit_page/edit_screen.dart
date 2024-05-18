import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/pages/edit_page/bloc/edit_user_bloc.dart';
import 'package:untitled2/pages/profile_screen/bloc/user_bloc.dart';
import 'package:untitled2/pages/registerPage/register_page.dart';
import 'package:untitled2/utils/image_handler.dart';
import 'package:untitled2/widget/button_widget.dart';
import 'package:untitled2/widget/flutter_toast_widget.dart';
import 'package:untitled2/widget/text_field_widget.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen({super.key});

  static const String userEditScreen = '/userEditScreen';

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  final userName = TextEditingController();
  final userEmail = TextEditingController();

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("ویرایش مشخصات"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey),
              width: 120.w,
              height: 120.h,
              child: imageHandler.getImageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.file(File(imageHandler.getImageFile!.path),
                          fit: BoxFit.cover))
                  : const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person_2,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
            ),
            TextButton(
                onPressed: () {
                  imageHandler
                      .getUserImage(source: ImageSource.gallery)
                      .then((value) => setState(() {}));
                },
                child: const Text(
                  'انتخاب عکس',
                  style: TextStyle(color: Colors.black),
                )),
            AppTextFieldWidget(
                hitnText: 'نام کاربری',
                icon: Icons.person_2,
                controller: userName),
            SizedBox(height: 20.h),
            AppTextFieldWidget(
                hitnText: 'ایمیل', icon: Icons.email, controller: userEmail),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on_outlined),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'ثبت موقیت مکانی',
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 150.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 150.h,
                    margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Text(
                      'iran,masshad',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            BlocConsumer<EditUserBloc, EditUserState>(
              listener: (context, state) {
                if (state is EditUserResponseState) {
                  state.result.fold((l) {
                    ShowToast.ShowMessage(l);
                  }, (r) {
                    ShowToast.ShowMessage(r);
                    context.read<UserBloc>().add(GetUserInfoEvent());
                    Navigator.pop(context);
                  });
                }
              },
              builder: (context, state) {
                if (state is EditUserInitial) {
                  return ElevatedButtonWidget(
                    lable: 'تایید',
                    onTap: () {
                      BlocProvider.of<EditUserBloc>(context).add(UserEditEvent(
                          imageHandler.getImageFile ?? File(''),
                          userName.text,
                          userEmail.text));
                    },
                  );
                }
                if (state is EditUserLoadingState) {
                  return Center(
                    child: SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is EditUserResponseState) {
                  state.result.fold(
                    (l) => ElevatedButtonWidget(
                      lable: 'تایید',
                      onTap: () {
                        BlocProvider.of<EditUserBloc>(context).add(
                            UserEditEvent(imageHandler.getImageFile ?? File(''),
                                userName.text, userEmail.text));
                      },
                    ),
                    (r) => ElevatedButtonWidget(
                      lable: 'تایید',
                      onTap: () {
                        BlocProvider.of<EditUserBloc>(context).add(
                            UserEditEvent(imageHandler.getImageFile ?? File(''),
                                userName.text, userEmail.text));
                      },
                    ),
                  );
                }
                return ElevatedButtonWidget(
                  lable: 'تایید',
                  onTap: () {
                    BlocProvider.of<EditUserBloc>(context).add(UserEditEvent(
                        imageHandler.getImageFile ?? File(''),
                        userName.text,
                        userEmail.text));
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
