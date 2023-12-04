// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../models/models.dart';

final todoFilterProvider = StateProvider<Status>((ref) => Status.active);
