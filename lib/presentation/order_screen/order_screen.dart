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

class OrderScreen extends StatelessWidget {
  static const String routeName = 'order_screen';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 64.h, left: 24.w),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 44.h,
                  child: Row(
                    spacing: 95.w,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Image.asset(IconPath.backArrow,
                            height: 24.h, width: 24.w),
                      ),
                      Text(
                        "Order",
                        style: kTextStyleSemiBold16.copyWith(color: textColor1),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 24.h, bottom: 24.h, right: 24.h),
                  child: Container(
                    color: color3,
                    width: double.infinity,
                    height: 43.h,
                  ),
                ),
                SizedBox(
                  width: 315.w,
                  height: 121.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Text(
                            "Delivery Address",
                            style: kTextStyleSemiBold16.copyWith(
                                color: textColor1),
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Text(
                            "Jl. Kpg Sutoyo",
                            style: kTextStyleSemiBold14.copyWith(
                                color: textColor1),
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Text(
                          "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                          style:
                              kTextStyleRegular12.copyWith(color: textColor2),
                        ),
                      ),
                      SizedBox(
                        width: 229.w,
                        height: 24.h,
                        child: Row(spacing: 8.w, children: [
                          WidgetButton2(
                              image: IconPath.edit,
                              label: 'Edit Address',
                              width: 120.w),
                          WidgetButton2(
                              image: IconPath.note,
                              label: 'Add Note',
                              width: 101.w)
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 295.w,
                  child: Divider(
                    color: color4,
                    thickness: 1,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
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
                        padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Caffe Mocha",
                              style: kTextStyleSemiBold16.copyWith(
                                  color: textColor1),
                            ),
                            Text(
                              "Deep Foam",
                              style: kTextStyleRegular12.copyWith(
                                  color: textColor2),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 64.w,
                      ),
                      SizedBox(
                        height: 24.h,
                        child: BlocBuilder<OrderBlocBloc, OrderBlocState>(
                          builder: (context, state) {
                            return Row(
                              spacing: 18.w,
                              children: [
                                GestureDetector(
                                  onTap: () => context.setOrderBlocBlocState(
                                      counter: state.counter - 1),
                                  child: Container(
                                    height: 24.h,
                                    width: 24.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: addSubStrokeColor),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: white),
                                    child: Center(
                                      child: Text(
                                        "-",
                                        style: kTextStyleBold16.copyWith(
                                            color: textColor2),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  state.counter.toString(),
                                  style: kTextStyleSemiBold14.copyWith(
                                      color: textColor3),
                                ),
                                GestureDetector(
                                  onTap: () => context.setOrderBlocBlocState(
                                      counter: state.counter + 1),
                                  child: Container(
                                    height: 24.h,
                                    width: 24.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: addSubStrokeColor),
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: white),
                                    child: Center(
                                      child: Text(
                                        "+",
                                        style: kTextStyleBold16.copyWith(
                                            color: textColor3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 4.h,
            width: double.infinity,
            color: color5,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: disStroke),
                    color: white,
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
                        style: kTextStyleSemiBold14.copyWith(color: color3),
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
                        style: kTextStyleSemiBold16.copyWith(color: textColor1),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price",
                            style: kTextStyleRegular14.copyWith(color: color3),
                          ),
                          Text(
                            "\$ 4.53",
                            style: kTextStyleSemiBold14.copyWith(
                                color: textColor1),
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
                            style: kTextStyleRegular14.copyWith(color: color3),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "\$ 2.0",
                                style: kTextStyleSemiBold14.copyWith(
                                    color: textColor3,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                "\$ 1.0",
                                style: kTextStyleSemiBold14.copyWith(
                                    color: textColor1),
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
          ),
          SizedBox(
            height: 32.h,
          ),
          Container(
            height: 165.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r), color: white),
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
                                style: kTextStyleRegular14.copyWith(
                                    color: textColor1),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "\$ 5.53",
                                style: kTextStyleSemiBold12.copyWith(
                                    color: color1),
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
                    backgroundColor: color1,
                    buttonTextColor: white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
