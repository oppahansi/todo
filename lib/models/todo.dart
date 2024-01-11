// Flutter Imports
import 'package:flutter/material.dart';

// Package Imports
import 'package:uuid/uuid.dart';

// Relative Project Imports
import 'status.dart';

const uuid = Uuid();

class Todo {
  final String id;
  final String title;
  final String description;
  final Color color;
  Status status;

  Todo({
    required this.title,
    required this.description,
    required this.color,
    this.status = Status.active,
  }) : id = uuid.v4();
}
