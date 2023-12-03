import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oppa_todo/screens/todos.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      home: TodosScreen(),
    ),
  ));
}
