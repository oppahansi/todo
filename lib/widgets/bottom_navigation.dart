import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navigationIndexProvider);

    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) {
        ref.read(navigationIndexProvider.notifier).update((state) => value);
        ref.read(todoFilterProvider.notifier).update(
          (state) {
            if (value == 0) {
              return Status.active;
            } else if (value == 1) {
              return Status.completed;
            } else {
              return Status.none;
            }
          },
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: "Active",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_all_outlined),
          label: "Done",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_circle_outline),
          label: "Deleted",
        ),
      ],
    );
  }
}
