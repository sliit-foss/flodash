import 'package:flutter/foundation.dart';
import '../modules/lang.dart';

dropWhileConditions(dynamic predicate, dynamic item) {
  return (predicate is Function && predicate(item)) ||
      ((item is Map && predicate is String && isTruthy(item[predicate])) ||
          (predicate is Map && item is Map && mapEquals(predicate, item))) ||
      (predicate is List && item is List && listEquals(predicate, item)) ||
      (predicate == item);
}
