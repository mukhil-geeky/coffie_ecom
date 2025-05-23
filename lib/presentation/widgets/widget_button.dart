import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/text/text_style.dart';

class WidgetButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Color backgroundColor;
  final Color buttonTextColor;

  const WidgetButton(
      {super.key,
      required this.label,
      this.onTap,
      required this.backgroundColor,
      required this.buttonTextColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
            height: 56.h,
            width: 327.w,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Center(
                child: Text(label,
                    style:
                        kTextStyleMedium16.copyWith(color: buttonTextColor)))),
      ),
    );
  }
}
