// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../providers/providers.dart' show themeModeProvider;
import '../widgets/widgets.dart' show AddTodoSheet, BottomNavigation, TodoList;

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  void _addTodo(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddTodoSheet(),
    );
  }

  Widget _themeToggleButton(ThemeMode themeMode) {
    if (themeMode == ThemeMode.dark) {
      return const Icon(Icons.light_mode);
    } else {
      return const Icon(Icons.dark_mode);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOs"),
        actions: [
          IconButton(
            onPressed: () => ref.read(themeModeProvider.notifier).state =
                themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
            icon: _themeToggleButton(themeMode),
          ),
          IconButton(
            onPressed: () => _addTodo(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: const TodoList(),
    );
  }
}
