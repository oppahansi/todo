import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oppa_todo/models/status.dart';
import 'package:oppa_todo/models/todo.dart';
import 'package:oppa_todo/providers/todos.dart';

class AddTodoSheet extends ConsumerStatefulWidget {
  const AddTodoSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoSheetState();
}

class _AddTodoSheetState extends ConsumerState<AddTodoSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Color _selectedColor = Colors.red;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add new todo.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: _titleController,
              keyboardType: TextInputType.name,
              maxLength: 50,
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty ||
                    value.trim().length < 2 ||
                    value.trim().length > 50) {
                  return "Title should be atleast 2 and max 50 characters long.";
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Description",
              ),
              controller: _descriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 5,
              maxLength: 250,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              value: _selectedColor,
              items: const [
                DropdownMenuItem(
                  value: Colors.red,
                  child: Icon(Icons.square, color: Colors.red),
                ),
                DropdownMenuItem(
                  value: Colors.green,
                  child: Icon(Icons.square, color: Colors.green),
                ),
                DropdownMenuItem(
                  value: Colors.blue,
                  child: Icon(Icons.square, color: Colors.blue),
                ),
                DropdownMenuItem(
                  value: Colors.black,
                  child: Icon(Icons.square, color: Colors.black),
                ),
                DropdownMenuItem(
                  value: Colors.grey,
                  child: Icon(Icons.square, color: Colors.grey),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  _selectedColor = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    ref.watch(todosProvider.notifier).addTodo(
                          Todo(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            status: Status.active,
                            color: _selectedColor,
                          ),
                        );

                    Navigator.pop(context);
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
