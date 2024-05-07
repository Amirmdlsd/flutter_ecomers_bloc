import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_bloc.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_event.dart';
import 'package:untitled2/pages/%20product_list/product_list_screen.dart';
import 'package:untitled2/pages/home_page/bloc/home_bloc.dart';
import 'package:untitled2/pages/home_page/bloc/home_bloc.dart';
import 'package:untitled2/pages/home_page/bloc/home_state.dart';
import 'package:untitled2/pages/home_page/home_screen.dart';
import 'package:untitled2/widget/cached_image.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<HomeBLoc, HomeState>(
        builder: (context, state) {
          if (state is HomeResponseState) {
            return state.category.fold(
                    (l) => Text(l),
                    (r) =>
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 30.h),
                      child: GridView.builder(
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 10.w,
                            childAspectRatio: 1.2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<ProductListBloc>(context)
                                  .add(FetchProductListEvent(
                                  r[index].id));
                              Navigator.pushNamed(
                                  context, ProductListScreen.productListScreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.5),
                                        offset: const Offset(1, 1),
                                        spreadRadius: 1,
                                        blurRadius: 1),
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    height: 80.h,
                                    child: CachedImage(
                                        imageUrl: r[index].image),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    r[index].title,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.sp),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ));
          }

          return Container();
        },
      )),
    );
  }
}
