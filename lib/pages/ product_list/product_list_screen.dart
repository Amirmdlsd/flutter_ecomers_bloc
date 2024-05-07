import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_bloc.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_state.dart';
import 'package:untitled2/widget/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  static String productListScreen = '/productListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListLoadingState) {
            return Center(
              child: SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: const CircularProgressIndicator()),
            );
          }
          if (state is ProductListResponseState) {
            return state.product.fold(
                (l) => Text(l),
                (r) => Padding(
                  padding:  EdgeInsets.only(top: 20.h,right: 10.w,left: 10.w),
                  child: GridView.builder(
                        itemCount: r.length,
                        gridDelegate:
                           const  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,

                                childAspectRatio: .6, crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            r.isNotEmpty?
                            Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.r),
                            elevation: 5,
                            child: ProductItem(
                              productModel: r[index],
                            ),
                          ),
                        ): const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('کالا یافت نشد')
                              ],
                            )
                      ),
                ));
          }
          return Container();
        },
      )),
    );
  }
}
