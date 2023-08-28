/*import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayAfterTomorrow extends ConsumerWidget {
  const DayAfterTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/common/widgets/xpansion_tile.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/xpansion_provider.dart';
import 'package:flutter_riverpod_task_management/features/todo/pages/update_task.dart';
import 'package:flutter_riverpod_task_management/features/todo/widgets/todo_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayAfterTomorrow extends ConsumerWidget {
  const DayAfterTomorrow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var color = ref.watch(todoStateProvider.notifier).getRandomColor();
    String dayAfterTomorrow = ref.read(todoStateProvider.notifier).getAfterTomorrow();
    var tomorrowsTasks = todos.where((element) => element.date!.contains(dayAfterTomorrow)).toList();
    return XpansionTile(
      text: DateTime.now().add(const Duration(days: 2)).toString().substring(5, 10),
      text2: "Day after tomorrow tasks",
      onExpansionChanged: (bool expanded) {
        ref.read(xpansionStateProvider.notifier).setStart(!expanded);
      },
      trailing: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: ref.watch(xpansionStateProvider)
            ? const Icon(
                AntDesign.circledown,
              )
            : const Icon(
                AntDesign.closecircleo,
              ),
      ),
      children: [
        for (final todo in tomorrowsTasks)
          TodoTile(
            start: todo.startTime,
            end: todo.endTime,
            title: todo.title,
            description: todo.description,
            color: color,
            deleteFunction: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {
                titles = todo.title.toString();
                descriptions = todo.description.toString();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateTask(
                        id: todo.id ?? 0,
                      ),
                    ));
              },
              child: const Icon(
                MaterialCommunityIcons.circle_edit_outline,
              ),
            ),
            switcherWidget: const SizedBox.shrink(),
          ),
      ],
    );
  }
}
