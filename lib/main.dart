// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'constants/constants.dart' show lightTheme, darkTheme;
import 'providers/providers.dart' show themeModeProvider;
import 'screens/screens.dart' show TodosScreen;

void main() {
  runApp(
    const ProviderScope(
      child: MyTodo(),
    ),
  );
}

class MyTodo extends ConsumerWidget {
  const MyTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const TodosScreen(),
    );
  }
}
