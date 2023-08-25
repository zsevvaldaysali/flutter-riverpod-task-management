import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/width_spacer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.deleteFunction,
      this.switcherWidget});
  final Color? color;
  final String? description;
  final String? title;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final void Function()? deleteFunction;
  final Widget? switcherWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConstants.kWidth,
            decoration: BoxDecoration(
              color: AppConstants.kGreyLight,
              borderRadius: BorderRadius.all(Radius.circular(
                AppConstants.kRadius,
              )),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius)),
                        //TODO: ADD DYNAMIC COLORS
                        color: color ?? AppConstants.kRed,
                      ),
                    ),
                    const WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConstants.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableTextWidget(
                                text: title ?? "Title of ToDo",
                                style: appStyleWidget(20.w, AppConstants.kLight, FontWeight.bold)),
                            HeightSpacer(height: 5.h),
                            ReusableTextWidget(
                                text: description ?? "description of ToDo",
                                style: appStyleWidget(15.w, AppConstants.kLight, FontWeight.bold)),
                            HeightSpacer(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConstants.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.3,
                                      color: AppConstants.kGreyDark,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(AppConstants.kRadius)),
                                    color: AppConstants.kDarkBk,
                                  ),
                                  child: Center(
                                    child: ReusableTextWidget(
                                        text: "$start  |  $end",
                                        style: appStyleWidget(13.w, AppConstants.kLight, FontWeight.normal)),
                                  ),
                                ),
                                WidthSpacer(width: 20.w),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    WidthSpacer(width: 20.w),
                                    GestureDetector(
                                      onTap: deleteFunction,
                                      child: const Icon(MaterialCommunityIcons.delete_circle),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 0.h,
                  ),
                  child: switcherWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
