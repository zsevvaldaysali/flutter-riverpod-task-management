import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/app_style_widget.dart';
import 'package:flutter_riverpod_task_management/common/widgets/reusable_text_widget.dart';
import 'package:flutter_riverpod_task_management/features/auth/controllers/code_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableTextWidget(text: code, style: appStyleWidget(30.w, AppConstants.kLight, FontWeight.bold)),
            TextButton(
              onPressed: () {
                ref.read(codeStateProvider.notifier).setStart("Hello zsevvaldaysali");
              },
              child: const Text("press me"),
            ),
          ],
        ),
      ),
    );
  }
}
