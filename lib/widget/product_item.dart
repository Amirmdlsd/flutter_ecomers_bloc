
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_bloc.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_event.dart';

import '../pages/home_page/data/model/product_model.dart';
import 'cached_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<ProductDetailBloc>()
            .add(ProductDetailResponseEvent(productModel.id!));
        Navigator.pushNamed(context, '/productDetailScreen');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: 150.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 100.h,
              child: CachedImage(
                imageUrl: productModel.image!,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                productModel.title!,
                style: TextStyle(fontSize: 14.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: 15.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    '%${productModel.discount}',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
              Text(
                '${productModel.price}',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 1.w),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ]),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                '${productModel.finalPrice} تومان ',
                style: TextStyle(fontSize: 16.sp),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
