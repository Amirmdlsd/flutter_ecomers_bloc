import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_bloc.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_state.dart';
import 'package:untitled2/widget/cached_image.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});
  static String productDetailScreen ='/productDetailScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProductDetailLoadingState) {
            return Center(
                child: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: const CircularProgressIndicator()));
          }
          if (state is ProductDetailResponseState) {
            return state.detail.fold(
                (l) => Text(l),
                (r) => Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200.h,
                          child: CachedImage(imageUrl: r.image!),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                          child: Text(
                            r.title!,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ));
          }
          return Container();
        },
      )),
    );
  }
}
