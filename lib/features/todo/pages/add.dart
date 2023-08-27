import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_outlinebutton_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_text_field.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            HeightSpacer(height: 20.h),
            CustomTextField(
              controller: titleController,
              hintText: "add title",
              hintStyle: appStyleWidget(16.w, AppConstants.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 20.h),
            CustomTextField(
              controller: descriptionController,
              hintText: "add description",
              hintStyle: appStyleWidget(16.w, AppConstants.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 20.h),
            CustomOutlineButtonWidget(
                height: 52.h,
                width: AppConstants.kWidth.w,
                color: AppConstants.kLight,
                color2: AppConstants.kBlueLight,
                text: "set date"),
            HeightSpacer(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomOutlineButtonWidget(
                height: 52.h,
                width: AppConstants.kWidth * .4.w,
                color: AppConstants.kLight,
                color2: AppConstants.kBlueLight,
                text: "start time",
                onTap: () {},
              ),
              CustomOutlineButtonWidget(
                height: 52.h,
                width: AppConstants.kWidth * .4.w,
                color: AppConstants.kLight,
                color2: AppConstants.kBlueLight,
                text: "end time",
                onTap: () {},
              ),
            ]),
            HeightSpacer(height: 20.h),
            CustomOutlineButtonWidget(
                height: 52.h,
                width: AppConstants.kWidth * .4.w,
                color: AppConstants.kLight,
                color2: AppConstants.kBlueLight,
                text: "submit"),
          ],
        ),
      ),
    );
  }
}
