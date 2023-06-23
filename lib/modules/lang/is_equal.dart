import 'package:flutter/foundation.dart';

bool isEqual(a, b) {
  if (a is List && b is List) return listEquals(a, b);
  if (a is Map && b is Map) return mapEquals(a, b);
  return a == b;
}
