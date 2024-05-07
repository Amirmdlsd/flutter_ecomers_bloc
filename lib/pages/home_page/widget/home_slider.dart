import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled2/pages/home_page/data/model/slider_model.dart';
import 'package:untitled2/widget/cached_image.dart';

class HomeSlider extends StatelessWidget {
   HomeSlider({
    super.key,
    required this.sliderList,
  });

  final List<SliderModel> sliderList;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150.h,
          child: PageView.builder(
              itemCount: sliderList.length,
              controller: _pageController,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedImage(
                        imageUrl: sliderList[index].imageUrl,
                      ),
                    ),
                  )),
        ),
        Positioned(
            bottom: 15.h,
            left: 70.w,
            child: SmoothPageIndicator(
                controller: _pageController,
                // PageController
                count: sliderList.length,
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey, dotWidth: 5.w, dotHeight: 5.h),
                // your preferred effect
                onDotClicked: (index) {}))
      ],
    );
  }
}
