// Package Imports
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Relative Project Imports
import '../models/models.dart' show Status;

final todoFilterProvider = StateProvider<Status>((ref) => Status.active);
