import 'package:coffie_ecom/application/order_bloc/order_bloc_bloc.dart';
import 'package:coffie_ecom/core/asset_path/icon_path.dart';
import 'package:coffie_ecom/core/asset_path/image_path.dart';
import 'package:coffie_ecom/core/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/text/text_style.dart';
import '../widgets/widget_button.dart';
import '../widgets/widget_button2.dart';
import '../widgets/widget_button3.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = 'order_screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kFrameColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 64.h, left: 24.w),
            child: Column(
              children: [
                _backNavigationAndOrder(context),
                _deliveryOrPickup(),
                _deliveryOrPickupDetails(),
                _sizedBox16(),
                _divider(),
                _sizedBox16(),
                _itemAdder()
              ],
            ),
          ),
          _sizedBox16(),
          _sectionSpliter(),
          _discountAndPaymentSummary(),
          _sizedBox32(),
          _walletAndOrder()
        ],
      ),
    );
  }

  SizedBox _sizedBox32() {
    return SizedBox(
      height: 32.h,
    );
  }

  SizedBox _sizedBox16() {
    return SizedBox(
      height: 16.h,
    );
  }

  Container _sectionSpliter() {
    return Container(
      height: 4.h,
      width: double.infinity,
      color: kSplitColor,
    );
  }

  Padding _divider() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 40.w),
      child: SizedBox(
        width: 295.w,
        child: Divider(
          color: kDiviederColor,
          thickness: 1,
          height: 0,
        ),
      ),
    );
  }

  BlocSelector<OrderBlocBloc, OrderBlocState, bool> _deliveryOrPickupDetails() {
    return BlocSelector<OrderBlocBloc, OrderBlocState, bool>(
      selector: (state) {
        return state.isDeliver;
      },
      builder: (context, isDeliver) {
        if (isDeliver) {
          return _deliveryAddress();
        } else {
          return _blankSpace();
        }
      },
    );
  }

  SizedBox _backNavigationAndOrder(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: Row(
        spacing: 95.w,
        children: [
          Padding(
            padding: EdgeInsets.all(10.h),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(IconPath.backArrow, height: 24.h, width: 24.w),
            ),
          ),
          Text(
            "Order",
            style: kTextStyleSemiBold16.copyWith(color: kDarkFontColor1),
          )
        ],
      ),
    );
  }

  Padding _deliveryOrPickup() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 24.h, right: 24.h),
      child: Container(
        width: double.infinity,
        height: 43.h,
        decoration: BoxDecoration(
            color: kBoxStrokeColor, borderRadius: BorderRadius.circular(12.r)),
        child: BlocSelector<OrderBlocBloc, OrderBlocState, bool>(
          selector: (state) => state.isDeliver,
          builder: (context, isDeliver) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetButton3(
                    label: 'Deliver',
                    onTap: () => context.setOrderBlocBlocState(isDeliver: true),
                    backgroundColor:
                        isDeliver ? kPrimaryButtonColor : kButtonContainerColor,
                    buttonTextColor: isDeliver ? kWhite : kDarkFontColor1,
                    textStyle:
                        isDeliver ? kTextStyleSemiBold16 : kTextStyleRegular16),
                WidgetButton3(
                  label: "Pick Up",
                  onTap: () => context.setOrderBlocBlocState(isDeliver: false),
                  backgroundColor:
                      isDeliver ? kButtonContainerColor : kPrimaryButtonColor,
                  buttonTextColor: isDeliver ? kDarkFontColor1 : kWhite,
                  textStyle:
                      isDeliver ? kTextStyleRegular16 : kTextStyleSemiBold16,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox _itemAdder() {
    return SizedBox(
      height: 54.h,
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                Imagepath.coffeeWithSpoon,
                width: 54.w,
                height: 54.h,
              )),
          SizedBox(
            width: 16.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Caffe Mocha",
                  style: kTextStyleSemiBold16.copyWith(color: kDarkFontColor1),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Deep Foam",
                  style: kTextStyleRegular12.copyWith(color: kLightFontColor),
                )
              ],
            ),
          ),
          SizedBox(
            width: 64.w,
          ),
          SizedBox(
            height: 24.h,
            child: BlocSelector<OrderBlocBloc, OrderBlocState, int>(
              selector: (state) => state.counter,
              builder: (context, counter) {
                return Row(
                  spacing: 18.w,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (counter > 0) {
                          context.setOrderBlocBlocState(counter: counter - 1);
                        }
                      },
                      child: SizedBox(
                        child: Image.asset(
                          IconPath.minus,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                    Text(
                      counter.toString(),
                      style:
                          kTextStyleSemiBold14.copyWith(color: kDigitFontColor),
                    ),
                    GestureDetector(
                      onTap: () =>
                          context.setOrderBlocBlocState(counter: counter + 1),
                      child: SizedBox(
                          child: Image.asset(
                        IconPath.plus,
                        width: 24.w,
                        height: 24.h,
                      )),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Padding _discountAndPaymentSummary() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: kButtonContainerColor),
              color: kWhite,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconPath.discountIcon,
                  height: 20.h,
                  width: 20.w,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  "1 Discount is Applies",
                  style: kTextStyleSemiBold14.copyWith(color: kDarkFontColor2),
                ),
                SizedBox(
                  width: 90.w,
                ),
                Image.asset(
                  IconPath.rightArrow,
                  width: 20.w,
                  height: 20.h,
                )
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 93.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment Summary",
                  style: kTextStyleSemiBold16.copyWith(color: kDarkFontColor1),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style:
                          kTextStyleRegular14.copyWith(color: kDarkFontColor2),
                    ),
                    Text(
                      "\$ 4.53",
                      style:
                          kTextStyleSemiBold14.copyWith(color: kDarkFontColor1),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Fee",
                      style:
                          kTextStyleRegular14.copyWith(color: kDarkFontColor2),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$ 2.0",
                          style: kTextStyleRegular14.copyWith(
                              color: kDigitFontColor,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          "\$ 1.0",
                          style: kTextStyleSemiBold14.copyWith(
                              color: kDarkFontColor1),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _walletAndOrder() {
    return Container(
      height: 165.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: kWhite),
      child: Padding(
        padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      IconPath.wallet,
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cash/Wallet",
                          style: kTextStyleSemiBold14.copyWith(
                              color: kDarkFontColor1),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "\$ 5.53",
                          style: kTextStyleSemiBold12.copyWith(
                              color: kPrimaryFontColor),
                        )
                      ],
                    )
                  ],
                ),
                Image.asset(
                  IconPath.downArrow,
                  height: 24.h,
                  width: 24.w,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            WidgetButton(
              label: 'Order',
              backgroundColor: kPrimaryButtonColor,
              buttonTextColor: kWhite,
            )
          ],
        ),
      ),
    );
  }

  Padding _deliveryAddress() {
    return Padding(
      padding: EdgeInsets.only(right: 36.w),
      child: SizedBox(
        width: 315.w,
        height: 121.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Text(
                  "Delivery Address",
                  style: kTextStyleSemiBold16.copyWith(color: kDarkFontColor1),
                )),
            Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  "Jl. Kpg Sutoyo",
                  style: kTextStyleSemiBold14.copyWith(color: kDarkFontColor1),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Text(
                "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                style: kTextStyleRegular12.copyWith(color: kLightFontColor),
              ),
            ),
            SizedBox(
              width: 229.w,
              height: 24.h,
              child: Row(spacing: 8.w, children: [
                WidgetButton2(
                    image: IconPath.edit, label: 'Edit Address', width: 120.w),
                WidgetButton2(
                    image: IconPath.note, label: 'Add Note', width: 101.w)
              ]),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _blankSpace() {
    return SizedBox(
      height: 121.h,
    );
  }
}
