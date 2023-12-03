import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oppa_todo/models/todo.dart';
import 'package:oppa_todo/providers/todos.dart';
import 'package:oppa_todo/widgets/add_todo_sheet.dart';

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
    var todos = ref.watch(todosProvider);

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (ctx, index) {
            Todo todo = todos[index];

            return Dismissible(
              key: ValueKey(todo.id),
              onDismissed: (value) =>
                  ref.read(todosProvider.notifier).removeTodo(todo),
              child: ExpansionTile(
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
                trailing: IconButton(
                  onPressed: () =>
                      ref.read(todosProvider.notifier).removeTodo(todo),
                  icon: const Icon(Icons.delete),
                ),
                children: [
                  Text(todo.description),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
