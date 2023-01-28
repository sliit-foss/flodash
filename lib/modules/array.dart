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
  return list
      .where((e) =>
          e != null && e != false && e != 0 && e != double.nan && e != "")
      .toList();
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

final differenceBy = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  Function iteratee = argumentClone.removeLast();
  List subList = flatten(argumentClone.sublist(1));
  return arguments[0].where((e) {
    return subList.where((l) => iteratee(e) == iteratee(l)).toList().isEmpty;
  }).toList();
}) as dynamic;

List drop(List list, {int n = 1}) => list.sublist(n);

List dropRight(List list, {int n = 1}) => list.sublist(0, list.length - n);

List flatten(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...element
    ];

List flattenDeep(Iterable<dynamic> list) => [
      for (var element in list)
        if (element is! Iterable) element else ...flattenDeep(element),
    ];
