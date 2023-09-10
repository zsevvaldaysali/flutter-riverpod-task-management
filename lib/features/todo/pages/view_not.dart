import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/width_spacer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, this.payload});
  final String? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Container(
                width: AppConstants.kWidth,
                height: AppConstants.kHeight * 0.7,
                decoration: BoxDecoration(
                  color: AppConstants.kLightBk,
                  borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableTextWidget(
                        text: "Reminder",
                        style: appStyleWidget(40, AppConstants.kLight, FontWeight.bold),
                      ),
                      const HeightSpacer(height: 5),
                      Container(
                        width: AppConstants.kWidth,
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppConstants.kYellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(9.h),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReusableTextWidget(
                              text: "Today",
                              style: appStyleWidget(14, AppConstants.kDarkBk, FontWeight.bold),
                            ),
                            WidthSpacer(
                              width: 15.w,
                            ),
                            ReusableTextWidget(
                              text: "From : start To : end",
                              style: appStyleWidget(14, AppConstants.kDarkBk, FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      HeightSpacer(
                        height: 10.h,
                      ),
                      ReusableTextWidget(
                        text: "Title",
                        style: appStyleWidget(30, AppConstants.kDarkBk, FontWeight.bold),
                      ),
                      HeightSpacer(
                        height: 10.h,
                      ),
                      Text(
                        "Title the task I wanna do",
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style: appStyleWidget(16, AppConstants.kLight, FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                right: 12.w,
                top: -10.h,
                child: Image.asset(
                  'assets/images/bell.png',
                  width: 70.w,
                  height: 70.h,
                )),
            Positioned(
                bottom: -AppConstants.kHeight * 0.142,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/notification.png',
                  width: AppConstants.kHeight * 0.8,
                  height: AppConstants.kHeight * 0.6,
                )),
          ],
        ),
      ),
    );
  }
}
