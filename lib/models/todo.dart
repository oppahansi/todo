import 'package:flutter/material.dart';
import 'package:oppa_todo/models/status.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  final String id;
  final String title;
  final String description;
  final Status status;
  final Color color;

  Todo({
    required this.title,
    required this.description,
    required this.status,
    required this.color,
  }) : id = uuid.v4();
}
