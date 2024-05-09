import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/bloc.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/state.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_bloc.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_state.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_bloc.dart';
import 'package:untitled2/pages/product_detail/bloc/detail_state.dart';
import 'package:untitled2/widget/button_widget.dart';
import 'package:untitled2/widget/cached_image.dart';
import 'package:untitled2/widget/flutter_toast_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  static String productDetailScreen = '/productDetailScreen';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

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
                (r) => Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 200.h,
                              child: CachedImage(imageUrl: r.image!),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Text(
                                r.title!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            TabBar(
                                controller: tabController,
                                indicatorColor: Colors.transparent,
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.grey,
                                dividerColor: Colors.transparent,
                                tabs: const [
                                  Tab(
                                    child: Text('مشخصات'),
                                  ),
                                  Tab(
                                    child: Text('نظرات'),
                                  )
                                ]),
                            //   ---------
                            //   --tab view
                            SizedBox(
                              height: 250.h,
                              child: TabBarView(
                                  controller: tabController,
                                  children: const [
                                    Center(child: Text('1')),
                                    Center(child: Text('2'))
                                  ]),
                            )
                          ],
                        ),

                        // ---
                        // tab --------------------

                        // ------------
                        // final price container ----------------

                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: double.infinity,
                            height: 80.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                BlocConsumer<BasketBloc, BasketState>(
                                  builder: (context, state) {
                                    if (state is BasketInitState) {
                                      return SizedBox(
                                        width: 200.w,
                                        child: ElevatedButtonWidget(
                                          bg: Colors.red,
                                          lable: 'ادامه فرایند خرید',
                                          onTap: () {

                                            context
                                                .read<BasketBloc>()
                                                .add(AddToBasketEvent(r, 1));

                                          },
                                        ),
                                      );
                                    }
                                    if (state is BasketLoadingState) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: Colors.red),
                                        width: 140.w,
                                        height: 40.h,
                                        child: Center(
                                            child: SizedBox(
                                                width: 30.w,
                                                height: 30.h,
                                                child:
                                                    const Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: CircularProgressIndicator(
                                                                                                        color: Colors.white,
                                                                                                      ),
                                                    ))),
                                      );
                                    }
                                    if (state is AddToBasketState) {
                                      SizedBox(
                                        width: 200.w,
                                        child: ElevatedButtonWidget(
                                          bg: Colors.red,
                                          lable: 'ادامه فرایند خرید',
                                          onTap: () {
                                            // BasketModel basket = BasketModel(
                                            //     id: r.id,
                                            //     pId: r.pId,
                                            //     title: r.title,
                                            //     image: r.image,
                                            //     catId: r.catId,
                                            //     count: r.count,
                                            //     discount: r.discount,
                                            //     price: r.price,
                                            //     mostSell: r.mostSell,
                                            //     finalPrice: r.finalPrice,
                                            //     isHot: r.isHot);
                                            context
                                                .read<BasketBloc>()
                                                .add(AddToBasketEvent(r, 1));

                                          },
                                        ),
                                      );
                                    }
                                    return SizedBox(
                                      width: 200.w,
                                      child: ElevatedButtonWidget(
                                        bg: Colors.red,
                                        lable: 'ادامه فرایند خرید',
                                        onTap: () {
                                          // BasketModel basket = BasketModel(
                                          //     id: r.id,
                                          //     pId: r.pId,
                                          //     title: r.title,
                                          //     image: r.image,
                                          //     catId: r.catId,
                                          //     count: r.count,
                                          //     discount: r.discount,
                                          //     price: r.price,
                                          //     mostSell: r.mostSell,
                                          //     finalPrice: r.finalPrice,
                                          //     isHot: r.isHot);
                                          context
                                              .read<BasketBloc>()
                                              .add(AddToBasketEvent(r, 1));

                                        },
                                      ),
                                    );
                                  },
                                  listener: (context, state) {
                                    if (state is AddToBasketState) {
                                      state.result.fold(
                                          (l) => ShowToast.ShowMessage(l), (r) {
                                        BlocProvider.of<BasketBloc>(context)
                                            .add(GetAllBasketDataEvent());
                                        return ShowToast.ShowMessage(r);
                                      });
                                    }
                                  },
                                ),
                                Visibility(
                                  visible: r.discount! > 0,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    child: Center(
                                        child: Text(
                                      '% ${r.discount}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      visible: r.discount! > 0,
                                      child: Text(
                                        '${r.price}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    Text(
                                      '${r.finalPrice} تومان',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
