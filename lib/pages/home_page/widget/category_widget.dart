
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_bloc.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_event.dart';
import 'package:untitled2/pages/%20product_list/product_list_screen.dart';
import 'package:untitled2/pages/home_page/data/model/category_model.dart';
import 'package:untitled2/widget/cached_image.dart';

class CategoryItemList extends StatelessWidget {
  const CategoryItemList({
    super.key,
    required this.categoryList,
  });

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      height: 100.h,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ProductListBloc>(context)
                    .add(FetchProductListEvent(categoryList[index].id));
                Navigator.pushNamed(
                    context, ProductListScreen.productListScreen);
              },
              child: SizedBox(
                width: 70.w,
                height: 90.h,
                child: Column(children: [
                  Expanded(
                      child: CachedImage(imageUrl: categoryList[index].image)),
                  SizedBox(height: 10.h),
                  Text(
                    categoryList[index].title,
                    style: TextStyle(fontSize: 12.sp),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
