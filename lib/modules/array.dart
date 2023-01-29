import 'package:flodash/flodash.dart';
import 'package:flutter/foundation.dart';
import 'package:flodash/utils/varargs.dart';

import '../utils/array.dart';

List chunk(List list, {int size = 1}) {
  List chunks = [];
  for (int i = 0; i < list.length; i += size) {
    int end = i + size;
    if (end > list.length) end = list.length;
    chunks.add(list.sublist(i, end));
  }
  return chunks;
}

List compact(List list) {
  return list.where((e) => !isFalsy(e)).toList();
}

final concat = VarargsFunction((arguments) {
  return arguments.fold([], (List acc, element) {
    if (element is List) {
      acc.addAll(element);
    } else {
      acc.add(element);
    }
    return acc;
  });
}) as dynamic;

final difference = VarargsFunction((arguments) {
  List subList = flatten(arguments.sublist(1));
  return arguments[0].where((e) {
    if (e is List) {
      return subList
          .whereType<List>()
          .where((l) => listEquals(e, l))
          .toList()
          .isEmpty;
    }
    if (e is Map) {
      return subList
          .whereType<Map>()
          .where((m) => mapEquals(e, m))
          .toList()
          .isEmpty;
    }
    return !subList.contains(e);
  }).toList();
}) as dynamic;

final differenceWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic comparator = argumentClone.removeLast();
  List subList = flatten(argumentClone.sublist(1));
  return arguments[0]
      .where((e) => evaluateDifference(subList, e, comparator: comparator))
      .toList();
}) as dynamic;

List drop(List list, {int n = 1}) => list.sublist(n);

List dropRight(List list, {int n = 1}) => list.sublist(0, list.length - n);

List dropRightWhile(List list, dynamic predicate) {
  for (int i = list.length - 1; i >= 0; i--) {
    if (evaluatePredicate(predicate, list[i])) {
      list.removeAt(i);
    } else {
      break;
    }
  }
  return list;
}

List dropWhile(List list, dynamic predicate) {
  for (int i = 0; i < list.length; i++) {
    if (evaluatePredicate(predicate, list[i])) {
      list.removeAt(i);
      i--;
    } else {
      break;
    }
  }
  return list;
}

@Deprecated('Use inbuilt List.fillRange() instead')
List fill(List list, dynamic value, {int start = 0, dynamic end}) {
  end ??= list.length;
  list.fillRange(start, end, value);
  return list;
}

@Deprecated("Use inbuilt List.indexOf() or List.indexWhere() instead")
int findIndex(List list, dynamic predicate, {int fromIndex = 0}) {
  for (int i = fromIndex; i < list.length; i++) {
    if (evaluatePredicate(predicate, list[i])) return i;
  }
  return -1;
}

@Deprecated("Use inbuilt List.lastIndexOf() or List.lastIndexWhere() instead")
int findLastIndex(List list, dynamic predicate, {dynamic fromIndex}) {
  fromIndex ??= list.length - 1;
  for (int i = fromIndex; i >= 0; i--) {
    if (evaluatePredicate(predicate, list[i])) return i;
  }
  return -1;
}

@Deprecated("Use inbuilt List.first instead")
dynamic first(List list) => list.first;

@Deprecated("Use inbuilt List.first instead")
dynamic head(List list) => list.first;

List flatten(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...element
    ];

List flattenDeep(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...flattenDeep(element),
    ];

List flattenDepth(Iterable<dynamic> list, {int depth = 1}) {
  if (depth == 0) return list.toList();
  return [
    for (var element in list)
      if (element is! Iterable)
        element
      else
        ...flattenDepth(element, depth: depth - 1),
  ];
}

Map<String, dynamic> fromPairs(List list) {
  Map<String, dynamic> map = {};
  for (int i = 0; i < list.length; i++) {
    map[list[i][0]] = list[i][1];
  }
  return map;
}

@Deprecated("Use inbuilt List.indexOf instead")
int indexOf(List list, dynamic value, {int fromIndex = 0}) =>
    list.indexOf(value, fromIndex);

List initial(List list) => list.sublist(0, list.length - 1);

final intersection =
    VarargsFunction((arguments) => baseIntersection(arguments)) as dynamic;

final intersectionWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic comparator = argumentClone.removeLast();
  return baseIntersection(argumentClone, comparator: comparator);
}) as dynamic;

@Deprecated("Use inbuilt List.join instead")
String join(List list, [String separator = ',']) => list.join(separator);

@Deprecated("Use inbuilt List.last instead")
dynamic last(List list) => list.last;

@Deprecated("Use inbuilt List.lastIndexOf instead")
int lastIndexOf(List list, dynamic value, {dynamic fromIndex}) {
  fromIndex ??= list.length - 1;
  return list.lastIndexOf(value, fromIndex);
}

dynamic nth(List list, {int n = 0}) {
  if (n < 0) n = list.length + n;
  try {
    return list[n];
  } catch (e) {
    return null;
  }
}

List remove(List list, dynamic predicate) {
  List removed = [];
  list.removeWhere((element) {
    if (evaluatePredicate(predicate, element)) {
      removed.add(element);
      return true;
    }
    return false;
  });
  return removed;
}

@Deprecated(
    "Use inbuilt List.reversed.toList() instead. Further this methods does not mutate the passed list like the original javascript method")
List reverse(List list) => list.reversed.toList();

@Deprecated("Use inbuilt List.sublist instead")
List slice(List list, {int start = 0, dynamic end}) {
  end ??= list.length;
  if (end < 0) end = list.length + end;
  if (start < 0) start = list.length + start;
  return list.sublist(start, end);
}

int _sortedIndex(List list, dynamic value, {dynamic iteratee, operation = lt}) {
  int low = 0;
  int high = list.length;
  if (operation == gte) high--;
  while (low < high) {
    int mid = (low + high) ~/ 2;
    if (evaluateOperation(list[mid], value,
        comparator: iteratee, operation: operation)) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return operation == lt ? low : high;
}

int sortedIndex(List list, dynamic value) => _sortedIndex(list, value);

int sortedIndexBy(List list, dynamic value, dynamic iteratee) =>
    _sortedIndex(list, value, iteratee: iteratee);

int Function(List<dynamic>, dynamic) sortedIndexOf = sortedIndex;

int sortedLastIndex(List list, dynamic value) =>
    _sortedIndex(list, value, operation: gte);

int sortedLastIndexBy(List list, dynamic value, dynamic iteratee) =>
    _sortedIndex(list, value, iteratee: iteratee, operation: gte);

int sortedLastIndexOf(List list, dynamic value) =>
    _sortedIndex(list, value, operation: gte) - 1;

List sortedUniq(List list) {
  List result = [];
  for (int i = 0; i < list.length; i++) {
    if (i == 0 || !isEqual(list[i], list[i - 1])) result.add(list[i]);
  }
  return result;
}

List sortedUniqBy(List list, Function iteratee) {
  List result = [];
  for (int i = 0; i < list.length; i++) {
    if (i == 0 || !isEqual(iteratee(list[i]), iteratee(list[i - 1]))) {
      result.add(list[i]);
    }
  }
  return result;
}

List tail(List list) {
  try {
    return list.sublist(1);
  } catch (e) {
    return [];
  }
}

List take(List list, {int n = 1}) {
  try {
    return list.sublist(0, n);
  } catch (e) {
    return [];
  }
}

List takeRight(List list, {int n = 1}) {
  try {
    return list.sublist(list.length - n);
  } catch (e) {
    return [];
  }
}

List _takeWhile(List list, dynamic predicate, {int start = 0, dynamic end}) {
  if (list.isEmpty) return [];
  List result = [];
  end ??= list.length;
  bool isFromRight = start > end;
  for (int i = start; isFromRight ? i >= end : i < end;) {
    if (evaluatePredicate(predicate, list[i])) {
      result.add(list[i]);
    } else {
      break;
    }
    isFromRight ? i-- : i++;
  }
  return isFromRight ? result.reversed.toList() : result;
}

List takeRightWhile(List list, dynamic predicate) =>
    _takeWhile(list, predicate, start: list.length - 1, end: 0);

List<dynamic> Function(List<dynamic>, dynamic, {dynamic end, int start})
    takeWhile = _takeWhile;

final union =
    VarargsFunction((arguments) => uniq(flatten(arguments))) as dynamic;

final unionWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic comparator = argumentClone.removeLast();
  return uniqBy(flatten(argumentClone), comparator);
}) as dynamic;

List _uniq(List list, {dynamic comparator}) {
  List result = [];
  for (dynamic element in list) {
    if (!result
        .where((e) => evaluateOperation(e, element, comparator: comparator))
        .isNotEmpty) {
      result.add(element);
    }
  }
  return result;
}

List uniq(List list) => _uniq(list);

List uniqBy(List list, dynamic iteratee) => _uniq(list, comparator: iteratee);
