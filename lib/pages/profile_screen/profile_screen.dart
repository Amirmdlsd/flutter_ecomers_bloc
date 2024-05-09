import 'package:flutter/material.dart';
import 'package:untitled2/utils/auth_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: GestureDetector(
            onTap: () {
              AuthManager.deleteLoginData();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/loginScreen', (route) => false);
            },
            child: Text('خروج')),
      )),
    );
  }
}
