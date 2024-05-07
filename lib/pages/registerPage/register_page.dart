import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/registerPage/bloc/home_event.dart';
import 'package:untitled2/pages/registerPage/bloc/home_state.dart';
import 'package:untitled2/pages/registerPage/bloc/register_bloc.dart';
import 'package:untitled2/widget/button_widget.dart';
import 'package:untitled2/widget/text_field_widget.dart';

import '../../gen/assets.gen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Center(
                  child: SizedBox(
                    width: 250.w,
                    height: 250.h,
                    child: Image.asset(Assets.images.register.path,
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 50.h),
                AppTextFieldWidget(
                  hitnText: 'لطفا نامتان را وارد کنید',
                  icon: Icons.email,
                  controller: nameController,
                ),
                SizedBox(height: 30.h),
                AppTextFieldWidget(
                  hitnText: 'لطفا ایمیلتان را وارد کنید',
                  icon: Icons.email,
                  controller: emailController,
                ),
                SizedBox(height: 30.h),
                AppTextFieldWidget(
                  type: 'password',
                  hitnText: 'لطفا پسوردتان را وارد کنید',
                  icon: Icons.password,
                  controller: passController,
                ),
                SizedBox(height: 80.h),
                ElevatedButtonWidget(
                  lable: 'ثبت نام',
                  onTap: () {
                    context.read<RegisterBloc>().add(RegisterEvent(
                        nameController.text,
                        emailController.text,
                        passController.text,
                        context));
                  },
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
