import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.kHeight,
      width: AppConstants.kWidth,
      color: AppConstants.kDarkBk,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Image.asset("assets/images/todo.png"),
          ),
          const HeightSpacer(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableTextWidget(
                text: "ToDo with Riverpod",
                style: appStyleWidget(30, AppConstants.kLight, FontWeight.w700),
              ),
              const HeightSpacer(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "welcome! do you want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appStyleWidget(16, AppConstants.kGreyLight, FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
