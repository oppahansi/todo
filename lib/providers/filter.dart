import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oppa_todo/models/status.dart';

final todoFilterProvider = StateProvider<Status>((ref) => Status.none);
