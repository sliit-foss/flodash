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
