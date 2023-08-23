import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_outlinebutton_widget.dart';
import 'package:flutter_riverpod_task_management/features/auth/pages/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/height_spacer_widget.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
          const HeightSpacer(height: 50),
          CustomOutlineButtonWidget(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ));
            },
            height: AppConstants.kHeight * 0.06,
            width: AppConstants.kWidth * 0.9,
            color: AppConstants.kLight,
            text: "Log in with a phone number",
          ),
        ],
      ),
    );
  }
}
