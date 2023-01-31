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

void forEach = each;

void forEachRight = eachRight;

bool every(dynamic collection, dynamic iteratee) {
  if (collection.isEmpty) return true;
  bool result = true;
  List types = [String, num, int, double, bool, List, Map, Set, Object];
  for (int i = 0; i < collection.length; i++) {
    if (types.contains(iteratee)) {
      result = collection.elementAt(i).runtimeType == iteratee;
    } else {
      result = evaluatePredicate(iteratee, collection.elementAt(i));
    }
    if (!result) break;
  }
  return result;
}

dynamic reduce(List list, dynamic iteratee, {dynamic accumulator}) {
  if (accumulator == null) {
    accumulator = list[0];
    list = list.sublist(1);
  }
  for (int i = 0; i < list.length; i++) {
    accumulator = iteratee(accumulator, list[i], i);
  }
  return accumulator;
}
