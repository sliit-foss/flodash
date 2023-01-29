import 'package:flutter/foundation.dart';

bool eq(a, b) => a == b;

bool ne(a, b) => a != b;

bool gt(a, b) {
  if (a is String && b is String) return a.compareTo(b) > 0;
  if (a is num && b is num) return a > b;
  if ((a is List && b is List) || a is Map && b is Map)
    return a.length > b.length;
  return false;
}

bool gte(a, b) {
  if (a is String && b is String) return a.compareTo(b) >= 0;
  if (a is num && b is num) return a >= b;
  if ((a is List && b is List) || a is Map && b is Map)
    return a.length >= b.length;
  return false;
}

bool lt(a, b) {
  if (a is String && b is String) return a.compareTo(b) < 0;
  if (a is num && b is num) return a < b;
  if ((a is List && b is List) || a is Map && b is Map)
    return a.length < b.length;
  return false;
}

bool lte(a, b) {
  if (a is String && b is String) return a.compareTo(b) <= 0;
  if (a is num && b is num) return a <= b;
  if ((a is List && b is List) || a is Map && b is Map)
    return a.length <= b.length;
  return false;
}

@Deprecated('Use inbuilt == operator comparison instead')
bool isNull(v) => v == null;

@Deprecated('Use inbuilt != operator comparison instead')
bool isNotNull(v) => v != null;

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
