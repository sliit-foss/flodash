import '../modules/lang.dart';

bool evaluateComparator(List subList, e, {comparator}) {
  return subList
      .where((l) {
        if (comparator != null) {
          if (comparator is Function)
            return isEqual(comparator(e), comparator(l));
          if (l is Map && comparator is String)
            return isEqual(l[comparator], e[comparator]);
        }
        return isEqual(l, e);
      })
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
      if (evaluateComparator((lists[i] as List), e, comparator: comparator)) {
        intersects = false;
        break;
      }
    }
    return intersects;
  }).toList();
}
