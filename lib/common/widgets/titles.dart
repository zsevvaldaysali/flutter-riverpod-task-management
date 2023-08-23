import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/width_spacer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({super.key, required this.text, required this.text2, this.clr});
  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius)),
                    //TODO: ADD DYNAMIC COLORS
                    color: AppConstants.kGreen,
                  ),
                );
              },
            ),
            WidthSpacer(width: 15.w),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableTextWidget(text: text, style: appStyleWidget(24.w, AppConstants.kLight, FontWeight.bold)),
                  HeightSpacer(height: 10.h),
                  ReusableTextWidget(text: text2, style: appStyleWidget(15.w, AppConstants.kLight, FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
