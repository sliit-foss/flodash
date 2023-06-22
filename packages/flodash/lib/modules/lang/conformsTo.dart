import 'isEqual.dart';

bool conformsTo(object, source) {
  if (source is Function) return source(object);
  if (source is Map) {
    if (object is! Map) return false;
    for (var key in source.keys) {
      if (!conformsTo(object[key], source[key])) return false;
    }
    return true;
  }
  if (source is List) {
    if (object is! List) return false;
    for (var i = 0; i < source.length; i++) {
      if (!conformsTo(object[i], source[i])) return false;
    }
    return true;
  }
  return isEqual(object, source);
}
