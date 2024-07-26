import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoman/lib.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
        buildWhen: (p, c) => c.todosCompleted != p.todosCompleted,
        builder: (context, state) {
          final list = state.todosCompleted;

          if (list.isEmpty) {
            return const EmptyCompletedList();
          }
          return ListView.builder(
              key: const Key('completed'),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final task = list[index];
                return CardTask(task: task);
              });
        });
  }
}
