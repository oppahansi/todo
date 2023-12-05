// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../models/models.dart' show Status;

final todoFilterProvider = StateProvider<Status>((ref) => Status.active);
