import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/utils/auth_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotToPage();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Center(child: Text('supermanrket')),
          const Spacer(),
          const CircularProgressIndicator(),
          SizedBox(height: 20.h,)
        ],
      ),
    );
  }

  gotToPage() {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        var check = await AuthManager.checkUserIsLoginOrRegister();
        if (check) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/mainScreen', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/loginScreen', (route) => false);
        }
      },
    );
  }
}
