import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetButton3 extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final Color backgroundColor;
  final Color buttonTextColor;
  final TextStyle textStyle;

  const WidgetButton3(
      {super.key,
      required this.label,
      this.onTap,
      required this.backgroundColor,
      required this.buttonTextColor,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
            height: 35.h,
            width: 153.w,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Center(
                child: Text(label,
                    style: textStyle.copyWith(color: buttonTextColor)))),
      ),
    );
  }
}
