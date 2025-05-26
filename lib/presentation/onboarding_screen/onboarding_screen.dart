import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/asset_path/image_path.dart';
import '../../core/color/color.dart';
import '../../core/text/text_style.dart';
import '../order_screen/order_screen.dart';
import '../widgets/widget_button.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = 'homeScreen';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            image(),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  blankSpace(),
                  Column(
                    children: [
                      mainText(),
                      subText(),
                      getStartedButton(context)
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

  Image image() {
    return Image.asset(
            Imagepath.coffeeCover,
            fit: BoxFit.cover,
          );
  }

  SizedBox blankSpace() {
    return SizedBox(
                  height: 452.h,
                );
  }

  Padding getStartedButton(BuildContext context) {
    return Padding(
                      padding: EdgeInsets.only(top: 32.h, bottom: 54.h),
                      child: WidgetButton(
                        onTap: () => Navigator.pushNamed(
                            context, OrderScreen.routeName),
                        label: 'Get Started',
                        backgroundColor: kPrimaryButtonColor,
                        buttonTextColor: kWhite,
                      ),
                    );
  }

  SizedBox subText() {
    return SizedBox(
                      width: 327.w,
                      height: 42.h,
                      child: Text(
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                        textAlign: TextAlign.center,
                        style: kTextStyleRegular14.copyWith(
                            color: kLightFontColor),
                      ),
                    );
  }

  Padding mainText() {
    return Padding(
                      padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
                      child: SizedBox(
                        width: 327.w,
                        height: 144.h,
                        child: Text(
                          'Fall in Love with Coffee in BlissFul Delight',
                          style: kTextStyleSemiBold32.copyWith(color: kWhite),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
  }
}
