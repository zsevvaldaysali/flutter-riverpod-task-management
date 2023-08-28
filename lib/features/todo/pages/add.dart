import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/models/task_model.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_outlinebutton_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_text_field.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/dates/dates_provider.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

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
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(endTimeStateProvider);
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
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2023, 1, 1),
                    maxTime: DateTime(2024, 1, 1),
                    theme: const picker.DatePickerTheme(doneStyle: TextStyle(color: AppConstants.kGreen, fontSize: 16)),
                    onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              height: 52.h,
              width: AppConstants.kWidth.w,
              color: AppConstants.kLight,
              color2: AppConstants.kBlueLight,
              text: scheduleDate == "" ? "set date" : scheduleDate.substring(0, 10),
            ),
            HeightSpacer(height: 20.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomOutlineButtonWidget(
                height: 52.h,
                width: AppConstants.kWidth * .4.w,
                color: AppConstants.kLight,
                color2: AppConstants.kBlueLight,
                text: start == "" ? "start time" : start.substring(10, 16),
                onTap: () {
                  picker.DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      ref.read(startTimeStateProvider.notifier).setStartTime(date.toString());
                    },
                    locale: picker.LocaleType.en,
                  );
                },
              ),
              CustomOutlineButtonWidget(
                height: 52.h,
                width: AppConstants.kWidth * .4.w,
                color: AppConstants.kLight,
                color2: AppConstants.kBlueLight,
                text: finish == "" ? "finish time" : finish.substring(10, 16),
                onTap: () {
                  picker.DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      ref.read(endTimeStateProvider.notifier).setEndTime(date.toString());
                    },
                    locale: picker.LocaleType.en,
                  );
                },
              ),
            ]),
            HeightSpacer(height: 20.h),
            CustomOutlineButtonWidget(
                onTap: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      start.isNotEmpty &&
                      finish.isNotEmpty) {
                    Task task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      startTime: start.substring(10, 16),
                      endTime: finish.substring(10, 16),
                      date: scheduleDate,
                      isCompleted: 0,
                      remind: 0,
                      repeat: "yes",
                    );
                    ref.read(todoStateProvider.notifier).addItem(task);
                    ref.read(endTimeStateProvider.notifier).setEndTime('');
                    ref.read(startTimeStateProvider.notifier).setStartTime('');
                    ref.read(dateStateProvider.notifier).setDate('');
                    Navigator.pop(context);
                  } else {
                    print("failed to add task");
                  }
                },
                height: 52.h,
                width: AppConstants.kWidth * .4.w,
                color: AppConstants.kLight,
                color2: AppConstants.kGreen,
                text: "submit"),
          ],
        ),
      ),
    );
  }
}
