import 'package:flutter/material.dart';

class ReusableTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ReusableTextWidget({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      textAlign: TextAlign.left,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: style,
    );
  }
}
