import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/pages/%20product_list/bloc/product_event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/bloc.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket/state.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_bloc.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_event.dart';
import 'package:untitled2/pages/basket_screen/bloc/basket_state.dart';
import 'package:untitled2/pages/basket_screen/data/model/basket_model.dart';
import 'package:untitled2/pages/basket_screen/data/repo/repository.dart';
import 'package:untitled2/pages/home_page/data/model/product_model.dart';
import 'package:untitled2/widget/button_widget.dart';
import 'package:untitled2/widget/cached_image.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<BasketBloc>(context).add(GetAllBasketDataEvent());
    // BlocProvider.of<NextBasketBloc>(context).add(GetAllNextBasketEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                      pinned: true,
                      expandedHeight: 50.0.w,
                      title: TabBar(
                          controller: _tabController,
                          labelStyle: TextStyle(fontSize: 16.sp),
                          tabs: const [
                            Tab(
                              child: Text('لیست سبدخریدبعدی'),
                            ),
                            Tab(
                              child: Text("سبدخرید"),
                            )
                          ])),
                ),
              ],
          body: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: TabBarView(controller: _tabController, children: [
              // next basket screen
              BlocBuilder<NextBasketBloc, NextBasketState>(
                builder: (context, state) {
                  if (state is NextBasketLoadinState) {
                    return Center(
                        child: SizedBox(
                            width: 30.w,
                            child: const CircularProgressIndicator()));
                  }
                  if (state is NextBasketGetAllItem) {
                    return SizedBox(
                        child: ListView.builder(
                      itemBuilder: (context, index) => state.basket.fold(
                        (l) => Text(l),
                        (r) {
                          print(r.length.toString());
                          return r.isNotEmpty
                              ? SizedBox(
                                  child: ListView.builder(
                                    itemCount: 5,
                                    itemBuilder: (context, index) => Container(
                                      margin: EdgeInsets.only(
                                          right: 20.w,
                                          left: 20.w,
                                          bottom: 10.h,
                                          top: index == 0 ? 60.h : 0),
                                      height: 160.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                offset: const Offset(2, 1),
                                                spreadRadius: .1,
                                                blurRadius: .2)
                                          ]),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 100.w,
                                              child: CachedImage(
                                                  imageUrl: r[index].image!)),
                                          Expanded(
                                              child: Column(
                                            children: [
                                              SizedBox(
                                                  width: 200.w,
                                                  child: Text(
                                                    r[index].title!,
                                                    style: TextStyle(
                                                        fontSize: 14.sp),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  DiscountContainerWidget(
                                                      text: r[index]
                                                          .discount
                                                          .toString()),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    r[index].price.toString(),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Text(
                                                    " ${r[index].finalPrice} تومان",
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 200.w,
                                                height: 40.h,
                                                child: ElevatedButtonWidget(
                                                    bg: Colors.red,
                                                    lable: 'حذف از لیست',
                                                    onTap: () {
                                                      debugPrint(
                                                          'pId is ${r[index].pId}');
                                                      context
                                                          .read<
                                                              NextBasketBloc>()
                                                          .add(
                                                              RemoveFromNextBasketEvent(
                                                                  index));
                                                    }),
                                              ),
                                              SizedBox(
                                                width: 300.w,
                                                height: 45.h,
                                                child: ElevatedButtonWidget(
                                                    lable: 'افزودن به سبدخرید',
                                                    onTap: () {}),
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text("سبدخرید خالی است")],
                                );
                        },
                      ),
                    ));
                  }
                  return Container();
                },
              ),

              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                if (state is BasketLoadingState) {
                  return Center(
                      child: SizedBox(
                    width: 20.h,
                    child: const CircularProgressIndicator(),
                  ));
                }
                if (state is GetAllBasketItemState) {
                  return state.basket.fold(
                      (l) => Text(l),
                      (r) => r.isNotEmpty
                          ? SizedBox(
                              child: ListView.builder(
                              itemCount: r.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10.h, right: 10.w, left: 10.w),
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: Colors.white,
                                      ),
                                      height: 165.h,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 150.w,
                                              child: CachedImage(
                                                  imageUrl: r[index].image)),
                                          SizedBox(height: 10.h),
                                          Expanded(
                                              child: Column(
                                            children: [
                                              SizedBox(height: 10.h),
                                              SizedBox(
                                                width: 160.w,
                                                child: Text(
                                                  r[index].title,
                                                  style: TextStyle(
                                                      fontSize: 14.sp),
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Row(
                                                children: [
                                                  DiscountContainerWidget(
                                                      text: r[index]
                                                          .discount
                                                          .toString()),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    r[index].price.toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12.sp,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Text(
                                                    r[index]
                                                        .finalPrice
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    context.read<NextBasketBloc>().add(
                                                        AddToNextBasketEvent(
                                                            BasketModel(
                                                                title: r[index]
                                                                    .title,
                                                                image: r[index]
                                                                    .image,
                                                                catId: r[index]
                                                                    .catId,
                                                                discount: r[
                                                                        index]
                                                                    .discount,
                                                                price: r[index]
                                                                    .price,
                                                                mostSell: r[
                                                                        index]
                                                                    .mostSell,
                                                                isHot: r[index]
                                                                    .isHot)));
                                                  },
                                                  child: const Text(
                                                      'افزودن به سبدخریدبعدی')),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        context
                                                            .read<BasketBloc>()
                                                            .add(
                                                                IncreaseCounterEvent(
                                                              ProductModel(
                                                                  id: '',
                                                                  catId: r[index]
                                                                      .catId,
                                                                  isHot: r[index]
                                                                      .isHot,
                                                                  mostSell: r[
                                                                          index]
                                                                      .mostSell,
                                                                  count: int.parse(
                                                                      r[index]
                                                                          .count
                                                                          .toString()),
                                                                  discount: r[
                                                                          index]
                                                                      .discount,
                                                                  price: r[
                                                                          index]
                                                                      .price,
                                                                  title:
                                                                      r[index]
                                                                          .title,
                                                                  image: r[index]
                                                                      .image,
                                                                  pId: int.parse(r[
                                                                          index]
                                                                      .pId
                                                                      .toString())),
                                                            ));
                                                        context
                                                            .read<BasketBloc>()
                                                            .add(
                                                                GetAllBasketDataEvent());
                                                      },
                                                      icon: const Icon(
                                                          Icons.add)),
                                                  Text(r[index]
                                                      .number
                                                      .toString()),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                          Icons.remove))
                                                ],
                                              )
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ))
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("سبدخرید خالی است")],
                            ));
                }
                return const Text('er');
              })
            ]),
          )),
    );
  }
}

class DiscountContainerWidget extends StatelessWidget {
  const DiscountContainerWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 20.h,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12)),
      child: Text(
        '%$text',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
