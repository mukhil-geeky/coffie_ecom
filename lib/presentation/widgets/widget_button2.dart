import 'package:coffie_ecom/core/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/text/text_style.dart';

class WidgetButton2 extends StatelessWidget {
  final String label;
  final String image;
  final void Function()? onTap;
  final double width;

  const WidgetButton2({
    super.key,
    required this.label,
    required this.image,
    required this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          height: 26.h,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: kLightFontColor),
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image, height: 14.h, width: 14.w),
                SizedBox(width: 4.w),
                Text(
                  label,
                  style: kTextStyleRegular12.copyWith(color: kDarkFontColor2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
