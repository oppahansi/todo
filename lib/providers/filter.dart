import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oppa_todo/models/models.dart';

final todoFilterProvider = StateProvider<Status>((ref) => Status.active);
