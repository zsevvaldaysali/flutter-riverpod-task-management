import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_riverpod_task_management/features/todo/pages/update_task.dart';
import 'package:flutter_riverpod_task_management/features/todo/widgets/todo_tile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../common/models/task_model.dart';

class TodayTasks extends ConsumerWidget {
  const TodayTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where(
          (element) => element.isCompleted == 0 && element.date!.contains(today),
        )
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final data = todayList[index];

        bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          title: data.title,
          description: data.description,
          start: data.startTime,
          end: data.endTime,
          color: color,
          switcherWidget: Switch(
            value: isCompleted,
            onChanged: (value) {
              ref.read(todoStateProvider.notifier).markAsCompleted(
                  data.id ?? 0,
                  data.title.toString(),
                  data.description.toString(),
                  1,
                  data.date.toString(),
                  data.startTime.toString(),
                  data.endTime.toString());
            },
          ),
          deleteFunction: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: GestureDetector(
            onTap: () {
              titles = data.title.toString();
              descriptions = data.description.toString();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTask(
                      id: data.id ?? 0,
                    ),
                  ));
            },
            child: const Icon(
              MaterialCommunityIcons.circle_edit_outline,
            ),
          ),
        );
      },
      itemCount: todayList.length,
    );
  }
}
