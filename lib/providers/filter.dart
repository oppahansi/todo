import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

final todoFilterProvider = StateProvider<Status>((ref) => Status.active);
