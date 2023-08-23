import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';

class CustomOutlineButtonWidget extends StatelessWidget {
  const CustomOutlineButtonWidget(
      {super.key,
      this.onTap,
      required this.height,
      required this.width,
      this.color2,
      required this.color,
      required this.text});
  final void Function()? onTap;
  final double height, width;
  final Color? color2;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color2,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: color),
        ),
        child: Center(
          child: ReusableTextWidget(
            text: text,
            style: appStyleWidget(18, color, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
