// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Relative Project Imports
import '../models/models.dart' show Todo, Status;
import '../providers/providers.dart' show filteredTodosProvider, todosProvider;
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
