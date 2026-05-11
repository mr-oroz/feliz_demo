import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_store_demo/core/themes/app_colors.dart';
import 'package:loading_indicator/loading_indicator.dart';


class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.fit,
    this.width,
    this.height,
    this.borderRadius,
    this.imageUrl,
    this.errorWidget,
    this.placeholder,
  });

  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? imageUrl;
  final Widget? errorWidget;
  final Widget? placeholder;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl ?? '',
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) =>
        placeholder ??
            Container(
              width: width,
              height: height,
              color: Colors.transparent,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineSpinFadeLoader,
                    colors: [AppColors.primary],
                  ),
                ),
              ),
            ),
        errorWidget: (context, url, error) {
          return SizedBox(
            width: width,
            height: height,
            child: errorWidget ??
                Icon(
                  Icons.error_outline,
                  color: AppColors.red,
                ),
          );
        },
      ),
    );
  }
}