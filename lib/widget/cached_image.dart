import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(
        child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: const CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) =>const Icon(
        Icons.image_not_supported,
        size: 40,
      ),
    );
  }
}

