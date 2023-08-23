import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/titles.dart';

class XpansionTile extends StatelessWidget {
  XpansionTile({super.key, required this.text, required this.text2, this.trailing, required this.children});
  final String text;
  final String text2;
  final Widget? trailing;
  void Function(bool)? onExpansionChanged;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.kLightBk,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.kRadius),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: AppConstants.kGreen,
        ),
        child: ExpansionTile(
          title: BottomTitles(
            text: text,
            text2: text2,
          ),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
