import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/pages/basket_screen/basket_screen.dart';
import 'package:untitled2/pages/category_screen/category_screen.dart';
import 'package:untitled2/pages/home_page/home_screen.dart';
import 'package:untitled2/pages/main_screen/bloc/main_bloc.dart';
import 'package:untitled2/pages/main_screen/bloc/main_event.dart';
import 'package:untitled2/pages/main_screen/bloc/main_state.dart';
import 'package:untitled2/pages/profile_screen/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: IndexedStack(
                  index: context.read<MainBloc>().state.currentIndex,
                  children: const [
                HomeScreen(),
                CategoryScreen(),
                BasketScreen(),
                ProfileScreen()
              ])),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              context.read<MainBloc>().add(ChangeIndexEvent(value));
            },
            currentIndex: context.read<MainBloc>().state.currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                  ),
                  label: 'دسته بندی'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'سبدخرید'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2), label: 'پروفایل'),
            ],
          ),
        );
      },
    );
  }
}
