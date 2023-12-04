import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  void _addTodo(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddTodoSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(filteredTodosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOs"),
        actions: [
          IconButton(
            onPressed: () => _addTodo(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Padding(
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
      ),
    );
  }
}
