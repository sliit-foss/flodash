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
      .where((e) => evaluateComparator(subList, e, comparator: comparator))
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

final pull = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  List values = argumentClone.sublist(1);
  List list = argumentClone[0];
  for (int i = 0; i < list.length; i++) {
    if (values
        .where((element) => isEqual(element, list[i]))
        .toList()
        .isNotEmpty) {
      list.removeAt(i);
      i--;
    }
  }
  return list;
}) as dynamic;
