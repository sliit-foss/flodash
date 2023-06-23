bool lt(a, b) {
  if (a is String && b is String) return a.compareTo(b) < 0;
  if (a is num && b is num) return a < b;
  if ((a is List && b is List) || a is Map && b is Map) {
    return a.length < b.length;
  }
  return false;
}
