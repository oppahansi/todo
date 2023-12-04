// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:uuid/uuid.dart';

// Project imports:
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
