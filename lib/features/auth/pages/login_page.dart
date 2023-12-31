import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/custom_outlinebutton_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/height_spacer_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/showDialog.dart';
import 'package:flutter_riverpod_task_management/features/auth/controllers/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/custom_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  Country country = Country(
    phoneCode: "86",
    countryCode: "CN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "China",
    example: "China",
    displayName: "China",
    displayNameNoCountryCode: "CN",
    e164Key: "",
  );

  sendCodeToUser() {
    if (phoneController.text.isEmpty) {
      return showAlertDialog(context: context, message: "Please enter your phone number");
    } else if (phoneController.text.length < 8) {
      return showAlertDialog(context: context, message: "Your number is too short");
    } else {
      print('+${country.phoneCode} ${phoneController.text}');
      ref
          .read(authControllerProvider)
          .sendSms(context: context, phone: '+${country.phoneCode} ${phoneController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: 300,
                ),
              ),
              const HeightSpacer(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: 16.w,
                ),
                child: ReusableTextWidget(
                  text: "please enter your phone number",
                  style: appStyleWidget(
                    17,
                    AppConstants.kLight,
                    FontWeight.w500,
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              Center(
                child: CustomTextField(
                  controller: phoneController,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(15.0.h),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                            backgroundColor: AppConstants.kGreyLight,
                            bottomSheetHeight: AppConstants.kHeight * 0.6,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConstants.kRadius),
                              topRight: Radius.circular(AppConstants.kRadius),
                            ),
                          ),
                          onSelect: (code) {
                            setState(() {
                              country = code;
                            });
                          },
                        );
                      },
                      child: ReusableTextWidget(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appStyleWidget(
                          18,
                          AppConstants.kDarkBk,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: "enter phone number",
                  hintStyle: appStyleWidget(
                    16,
                    AppConstants.kDarkBk,
                    FontWeight.w600,
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              Padding(
                padding: EdgeInsets.all(
                  AppConstants.kWidth * 0.025,
                ),
                child: CustomOutlineButtonWidget(
                  height: AppConstants.kHeight * 0.075,
                  width: AppConstants.kWidth * 0.9,
                  color: AppConstants.kDarkBk,
                  color2: AppConstants.kLight,
                  text: "send code",
                  onTap: () {
                    sendCodeToUser();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
