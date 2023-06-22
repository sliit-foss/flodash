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

void Function(dynamic, Function) forEach = each;

void Function(dynamic, Function) forEachRight = eachRight;
