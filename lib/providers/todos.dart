import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oppa_todo/models/models.dart';
import 'package:oppa_todo/providers/filter.dart';

List<Todo> _todos = [
  Todo(
    title: "Test 1",
    description: "description 1",
    status: Status.active,
    color: Colors.green,
  ),
  Todo(
    title: "Test 2",
    description: "description 2",
    status: Status.completed,
    color: Colors.orange,
  ),
  Todo(
    title: "Test 3",
    description: "description 3",
    status: Status.active,
    color: Colors.purple,
  ),
  Todo(
    title: "Test 4",
    description: "description 4",
    status: Status.none,
    color: Colors.blue,
  ),
  Todo(
    title: "Test 5",
    description: "description 5",
    status: Status.none,
    color: Colors.red,
  ),
  Todo(
    title: "Test 6",
    description: "description 6",
    status: Status.active,
    color: Colors.green,
  ),
  Todo(
    title: "Test 7",
    description: "description 7",
    status: Status.completed,
    color: Colors.orange,
  ),
  Todo(
    title: "Test 8",
    description: "description 8",
    status: Status.active,
    color: Colors.purple,
  ),
  Todo(
    title: "Test 9",
    description: "description 9",
    status: Status.none,
    color: Colors.blue,
  ),
  Todo(
    title: "Test 10",
    description: "description 10",
    status: Status.none,
    color: Colors.red,
  ),
];

class TodosNotifier extends Notifier<List<Todo>> {
  @override
  List<Todo> build() {
    return _todos;
  }

  void addTodo(Todo todo) {
    if (state.contains(todo)) return;

    state = [...state, todo];
  }

  void removeTodo(Todo todo) {
    state = [
      ...state.where((element) => element != todo),
    ];
  }

  void updateTodo(Todo todo) {
    var index = state.indexOf(todo);
    state[index] = todo;

    state = [...state];
  }
}

final todosProvider =
    NotifierProvider<TodosNotifier, List<Todo>>(TodosNotifier.new);

final filteredTodosProvider = Provider((ref) {
  final filter = ref.watch(todoFilterProvider);
  final todos = ref.watch(todosProvider);

  switch (filter) {
    case Status.active:
      return todos.where((element) => element.status == Status.active).toList();
    case Status.completed:
      return todos
          .where((element) => element.status == Status.completed)
          .toList();
    case Status.none:
      return todos.where((element) => element.status == Status.none).toList();
  }
});
