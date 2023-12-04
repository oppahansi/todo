import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem(this.todo, {super.key});

  final Todo todo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var navigationIndex = ref.watch(navigationIndexProvider);

    return ExpansionTile(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      collapsedShape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      backgroundColor: todo.color.withOpacity(0.25),
      collapsedBackgroundColor: todo.color.withOpacity(0.25),
      childrenPadding: const EdgeInsets.only(bottom: 16),
      leading: Icon(Icons.square, color: todo.color),
      title: Text(todo.title),
      trailing: _getTrailingWidget(navigationIndex, ref),
      children: [Text(todo.description)],
    );
  }

  Widget _getTrailingWidget(int navigationIndex, WidgetRef ref) {
    return switch (navigationIndex) {
      0 => IconButton(
          onPressed: () {
            todo.status = Status.completed;
            ref.read(todosProvider.notifier).updateTodo(todo);
          },
          icon: const Icon(Icons.check_outlined),
        ),
      1 => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                todo.status = Status.active;
                ref.read(todosProvider.notifier).updateTodo(todo);
              },
              icon: const Icon(Icons.restart_alt_outlined),
            ),
            IconButton(
              onPressed: () {
                todo.status = Status.none;
                ref.read(todosProvider.notifier).updateTodo(todo);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      _ => Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                todo.status = Status.active;
                ref.read(todosProvider.notifier).updateTodo(todo);
              },
              icon: const Icon(Icons.restart_alt_outlined),
            ),
            IconButton(
              onPressed: () =>
                  ref.read(todosProvider.notifier).removeTodo(todo),
              icon: const Icon(Icons.delete),
            )
          ],
        ),
    };
  }
}
