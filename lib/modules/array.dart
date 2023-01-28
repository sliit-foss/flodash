import 'package:flodash/flodash.dart';
import 'package:flutter/foundation.dart';
import 'package:flodash/utils/varargs.dart';

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
  dynamic iteratee = argumentClone.removeLast();
  List subList = flatten(argumentClone.sublist(1));
  return arguments[0].where((e) {
    if (iteratee is Function) {
      return subList.where((l) => iteratee(e) == iteratee(l)).toList().isEmpty;
    }
    if (iteratee is String) {
      return subList.where((l) => l[iteratee] == e[iteratee]).toList().isEmpty;
    }
    return false;
  }).toList();
}) as dynamic;

List drop(List list, {int n = 1}) => list.sublist(n);

List dropRight(List list, {int n = 1}) => list.sublist(0, list.length - n);

List dropRightWhile(List list, dynamic predicate) {
  for (int i = list.length - 1; i >= 0; i--) {
    if ((predicate is Function && predicate(list[i])) ||
        ((list[i] is Map &&
                predicate is String &&
                isTruthy(list[i][predicate])) ||
            (predicate is Map &&
                list[i] is Map &&
                mapEquals(predicate, list[i]))) ||
        (predicate is List &&
            list[i] is List &&
            listEquals(predicate, list[i])) ||
        (predicate == list[i])) {
      list.removeAt(i);
    } else {
      break;
    }
  }
  return list;
}

List flatten(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...element
    ];

List flattenDeep(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...flattenDeep(element),
    ];
