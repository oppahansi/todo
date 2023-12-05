// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../models/models.dart';
import '../providers/providers.dart';
import 'todo_item.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosProvider);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (ctx, index) {
          Todo todo = todos[index];

          return Dismissible(
            key: ValueKey(todo.id),
            onDismissed: (value) {
              if (todo.status == Status.none) {
                ref.read(todosProvider.notifier).removeTodo(todo);
                return;
              }

              todo.status = Status.none;
              ref.read(todosProvider.notifier).updateTodo(todo);
            },
            child: TodoItem(todo),
          );
        },
      ),
    );
  }
}
