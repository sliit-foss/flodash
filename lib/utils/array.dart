import 'package:flodash/flodash.dart';

bool evaluateOperation(a, b, {comparator, operation = isEqual}) {
  if (comparator != null) {
    if (comparator is Function) {
      return operation(comparator(a), comparator(b));
    }
    if (a is Map && comparator is String) {
      return operation(a[comparator], b[comparator]);
    }
  }
  return operation(a, b);
}

bool evaluateDifference(List subList, e, {comparator}) {
  return subList
      .where((l) =>
          evaluateOperation(l, e, comparator: comparator, operation: isEqual))
      .toList()
      .isEmpty;
}

bool evaluatePredicate(dynamic predicate, dynamic item) {
  return (predicate is Function && predicate(item)) ||
      ((item is Map && predicate is String && isTruthy(item[predicate])) ||
          isEqual(item, predicate));
}

List baseIntersection(List lists, {comparator}) {
  return lists[0].where((e) {
    bool intersects = true;
    for (int i = 1; i < lists.length; i++) {
      if (evaluateDifference((lists[i] as List), e, comparator: comparator)) {
        intersects = false;
        break;
      }
    }
    return intersects;
  }).toList();
}

Map<dynamic, dynamic> setRecursiveProperty(
    List properties, dynamic value, Map<dynamic, dynamic> current) {
  dynamic property = properties.iterator.moveNext() ? properties.first : null;
  if (property == null) return current;
  if (properties.length == 1) {
    current[property] = value;
  } else {
    if (current[property] == null) {
      if (property.contains('[') && property.contains(']')) {
        String key = property.split("[").first;
        int index = int.parse(property.split("[").last.split("]").first);
        if (current[key] == null) {
          current[key] = [];
        }
        if (nth(current[key], n: index) == null) current[key].add({});
        current[key][index] = setRecursiveProperty(
            properties.sublist(1), value, current[key][index]);
      } else {
        current[property] =
            setRecursiveProperty(properties.sublist(1), value, {});
      }
    } else {
      current[property] =
          setRecursiveProperty(properties.sublist(1), value, current[property]);
    }
  }
  return current;
}
