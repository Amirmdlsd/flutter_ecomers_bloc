
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/gen/assets.gen.dart';
import 'package:untitled2/pages/login/bloc/login_event.dart';
import 'package:untitled2/pages/login/bloc/login_state.dart';
import 'package:untitled2/pages/main_screen/bloc/main_bloc.dart';
import 'package:untitled2/pages/main_screen/bloc/main_event.dart';
import 'package:untitled2/widget/text_field_widget.dart';

import '../../widget/button_widget.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Center(
                  child: SizedBox(
                    width: 250.w,
                    height: 250.h,
                    child: Image.asset(Assets.images.login.path,
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 30.h),
                Text('ورود به حساب کاربری',
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 50.h),
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
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('هنوز ثبت نام نکردم',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                    SizedBox(
                      width: 20.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<MainBloc>().add(ChangeIndexEvent(0));
                        Navigator.pushReplacementNamed(context, '/registerScreen');
                      },
                      child: Text('ثبت نام',
                          style: TextStyle(
                              fontSize: 14.sp, color: Colors.lightBlue)),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
                ElevatedButtonWidget(
                  lable: "تایید",
                  onTap: () {
                    context.read<LoginBloc>().add(LoginEvent(
                        emailController.text, passController.text, context));
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
