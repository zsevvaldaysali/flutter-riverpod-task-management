import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_task_management/common/utils/constants.dart';
import 'package:flutter_riverpod_task_management/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter_riverpod_task_management/features/todo/widgets/todo_tile.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../common/models/task_model.dart';

class CompletedTasks extends ConsumerWidget {
  const CompletedTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    List lastMonth = ref.read(todoStateProvider.notifier).last30days();
    var completedList = listData
        .where(
          (element) => element.isCompleted == 1 && lastMonth.contains(element.date!.substring(0, 10)),
        )
        .toList();

    return ListView.builder(
      itemCount: completedList.length,
      itemBuilder: (context, index) {
        final data = completedList[index];
        
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          title: data.title,
          description: data.description,
          start: data.startTime,
          end: data.endTime,
          color: color,
          deleteFunction: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: const SizedBox.shrink(),
          switcherWidget: const Icon(
            AntDesign.checkcircle,
            color: AppConstants.kGreen,
          ),
        );
      },
    );
  }
}
