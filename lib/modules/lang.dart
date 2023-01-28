import 'package:flutter/foundation.dart';

bool isTruthy(v) =>
    v != null &&
    v != false &&
    v != 0 &&
    v != "" &&
    (v is num ? !v.isNaN : true);

bool isFalsy(v) => !isTruthy(v);

bool isEqual(a, b) {
  if (a is List && b is List) return listEquals(a, b);
  if (a is Map && b is Map) return mapEquals(a, b);
  return a == b;
}
