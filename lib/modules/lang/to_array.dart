List toArray(dynamic obj) {
  if (obj is List) {
    return obj;
  }
  if (obj is Set) {
    return obj.toList();
  }
  if (obj is Map) {
    return obj.values.toList();
  }
  if (obj is String) {
    return obj.split('');
  }
  return [];
}
