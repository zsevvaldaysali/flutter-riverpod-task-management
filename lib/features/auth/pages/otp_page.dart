import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, required this.smsCodeId, required this.phone});

  final String smsCodeId;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeightSpacer(height: AppConstants.kHeight * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.asset(
                    "assets/images/todo.png",
                    width: AppConstants.kWidth * 0.5,
                  ),
                ),
                HeightSpacer(height: AppConstants.kHeight * 0.03),
                ReusableTextWidget(
                  text: 'enter your otp code',
                  style: appStyleWidget(
                    18,
                    AppConstants.kLight,
                    FontWeight.bold,
                  ),
                ),
                HeightSpacer(height: AppConstants.kHeight * 0.02),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onCompleted: (value) {
                    if (value.length == 6) {}
                  },
                  onSubmitted: (value) {
                    if (value.length == 6) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
