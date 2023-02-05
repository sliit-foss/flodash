import 'dart:math';

import 'package:flodash/flodash.dart';
import 'package:flodash/utils/array.dart';

Map<dynamic, dynamic> countBy(List list, dynamic iteratee) {
  return reduce(list, (Map<dynamic, dynamic> result, dynamic value, int index) {
    final key = (iteratee is Function
            ? iteratee(value)
            : value is Map && iteratee is String
                ? value[iteratee]
                : iteratee)
        .toString();
    result[key] = result[key] == null ? 1 : result[key] + 1;
    return result;
  }, accumulator: {});
}

void _each(dynamic collection, Function iteratee, {bool reverse = false}) {
  for (int i = reverse ? collection.length - 1 : 0;
      reverse ? i >= 0 : i < collection.length;
      reverse ? i-- : i++) {
    if (collection is List || collection is Set) {
      iteratee(collection.elementAt(i), i);
    } else if (collection is Map) {
      String key = collection.keys.elementAt(i);
      iteratee(collection[key], key);
    } else {
      throw Exception('Collection type not supported');
    }
  }
}

void each(dynamic collection, Function iteratee) => _each(collection, iteratee);

void eachRight(dynamic collection, Function iteratee) =>
    _each(collection, iteratee, reverse: true);

bool _every(dynamic collection, dynamic iteratee, {bool some = false}) {
  if (collection.isEmpty) return true;
  bool result = true;
  List types = [String, num, int, double, bool, List, Map, Set, Object];
  for (int i = 0; i < collection.length; i++) {
    if (types.contains(iteratee)) {
      result = collection.elementAt(i).runtimeType == iteratee;
    } else {
      result = evaluatePredicate(iteratee, collection.elementAt(i));
    }
    if ((some && result) || !result) break;
  }
  return result;
}

bool every(dynamic collection, dynamic iteratee) =>
    _every(collection, iteratee);

@Deprecated("Use inbuilt List.where() instead")
List filter(List list, dynamic iteratee) =>
    list.where((element) => evaluatePredicate(iteratee, element)).toList();

@Deprecated("Use inbuilt List.firstWhere() instead")
dynamic find(List list, dynamic iteratee) {
  try {
    return list.firstWhere((element) => evaluatePredicate(iteratee, element));
  } catch (e) {
    return null;
  }
}

@Deprecated("Use inbuilt List.lastWhere() instead")
dynamic findLast(List list, dynamic iteratee) {
  try {
    return list.lastWhere((element) => evaluatePredicate(iteratee, element));
  } catch (e) {
    return null;
  }
}

List flatMap(List list, dynamic iteratee) =>
    flatten(list.map((element) => iteratee(element)).toList());

List flatMapDeep(List list, dynamic iteratee) =>
    flattenDeep(list.map((element) => iteratee(element)).toList());

List flatMapDepth(List list, dynamic iteratee, {int depth = 1}) =>
    flattenDepth(list.map((element) => iteratee(element)).toList(),
        depth: depth);

void Function(dynamic, Function) forEach = each;

void Function(dynamic, Function) forEachRight = eachRight;

Map<dynamic, dynamic> groupBy(List list, dynamic iteratee) {
  return reduce(list, (Map<dynamic, dynamic> result, dynamic value, int index) {
    final key = evaluatePredicateKey(iteratee, value);
    result[key] = result[key] == null ? [value] : [...result[key], value];
    return result;
  }, accumulator: {});
}

bool includes(dynamic collection, dynamic value, {int fromIndex = 0}) {
  try {
    if (fromIndex < 0) fromIndex = collection.length + fromIndex;
    if (collection is List) {
      return collection
          .sublist(fromIndex)
          .where((element) => isEqual(element, value))
          .isNotEmpty;
    } else if (collection is Set) {
      return collection
          .skip(fromIndex + 1)
          .where((element) => isEqual(element, value))
          .isNotEmpty;
    } else if (collection is String) {
      return collection.substring(fromIndex).contains(value);
    }
    return false;
  } catch (e) {
    return false;
  }
}

Map<dynamic, dynamic> keyBy(List list, dynamic iteratee) {
  return reduce(list, (Map<dynamic, dynamic> result, dynamic value, int index) {
    final key = evaluatePredicateKey(iteratee, value);
    result[key] = value;
    return result;
  }, accumulator: {});
}

@Deprecated("Use inbuilt List.map() instead")
List map(List list, dynamic iteratee) =>
    list.map((element) => evaluatePredicateKey(iteratee, element)).toList();

List orderBy(List list, List<dynamic> iteratees, [dynamic orders]) {
  orders = orders != null
      ? orders.map((o) {
          if (o is String) return o == 'asc' ? true : false;
          if (o is num || o is bool) return e == 1 ? true : false;
          return o;
        }).toList()
      : List.generate(iteratees.length, (index) => true);
  int sortOrder(
      List<dynamic> iteratees, List<dynamic> orders, dynamic a, dynamic b) {
    dynamic iteratee = iteratees.first;
    dynamic order = orders.first ? 1 : -1;
    final valueA = evaluatePredicateKey(iteratee, a);
    final valueB = evaluatePredicateKey(iteratee, b);
    if (gt(valueA, valueB)) return (1 * order).toInt();
    if (lt(valueA, valueB)) return (-1 * order).toInt();
    return iteratees.length > 1
        ? sortOrder(iteratees.sublist(1), orders.sublist(1), a, b)
        : 0;
  }

  list.sort((a, b) => sortOrder(iteratees, orders, a, b));
  return list;
}

List partition(dynamic list, dynamic iteratee) {
  if (list is String) list = list.split('');
  return reduce(list, (List<List<dynamic>> result, dynamic value, int index) {
    if (evaluatePredicateKey(iteratee, value)) {
      result[0].add(value);
    } else {
      result[1].add(value);
    }
    return result;
  }, accumulator: [[], []]);
}

dynamic _reduce(List list, dynamic iteratee,
    {dynamic accumulator, bool right = false}) {
  if (accumulator == null) {
    accumulator = right ? list.last : list.first;
    list = right ? list.sublist(0, list.length - 1) : list.sublist(1);
  }
  for (int i = right ? list.length - 1 : 0;
      right ? i >= 0 : i < list.length;
      right ? i-- : i++) {
    accumulator = iteratee(accumulator, list[i], i);
  }
  return accumulator;
}

dynamic reduce(List list, dynamic iteratee, {dynamic accumulator}) =>
    _reduce(list, iteratee, accumulator: accumulator);

dynamic reduceRight(List list, dynamic iteratee, {dynamic accumulator}) =>
    _reduce(list, iteratee, accumulator: accumulator, right: true);

List reject(List list, dynamic iteratee) =>
    list.where((element) => !evaluatePredicate(iteratee, element)).toList();

dynamic sample(dynamic collection) =>
    collection.elementAt(Random().nextInt(collection.length));

List sampleSize(dynamic collection, {int n = 1}) {
  List result = [];
  for (int i = 0; i < n; i++) {
    dynamic item = sample(collection);
    result.add(item);
    collection =
        collection.where((element) => !isEqual(element, item)).toList();
    if (collection.length == 0) break;
  }
  return result;
}

@Deprecated("Use inbuilt List.shuffle() instead")
List shuffle(List collection) {
  collection.shuffle();
  return collection;
}

int size(dynamic collection) {
  if (collection is List || collection is Set || collection is String) {
    return collection.length;
  } else if (collection is Map) {
    return collection.keys.length;
  } else {
    throw Exception('Collection type not supported');
  }
}

bool some(dynamic collection, dynamic iteratee) =>
    _every(collection, iteratee, some: true);

List sortBy(List list, dynamic iteratees) {
  if (iteratees is! List) iteratees = [iteratees];
  return orderBy(list, iteratees);
}
