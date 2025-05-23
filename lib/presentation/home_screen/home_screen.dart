import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/asset_path/image_path.dart';
import '../../core/color/color.dart';
import '../../core/text/text_style.dart';
import '../widgets/widget_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              Imagepath.coffeeCover,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 452.h,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
                        child: SizedBox(
                          width: 327.w,
                          height: 144.h,
                          child: Text(
                            'Fall in Love with Coffee in BlissFul Delight',
                            style: kTextStyleSemiBold32.copyWith(color: white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 327.w,
                        height: 42.h,
                        child: Text(
                          'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                          textAlign: TextAlign.center,
                          style:
                              kTextStyleRegular14.copyWith(color: textColor2),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h, bottom: 54.h),
                        child: WidgetButton(
                          label: 'Get Started',
                          backgroundColor: color1,
                          buttonTextColor: white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
