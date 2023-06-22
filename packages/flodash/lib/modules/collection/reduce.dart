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

dynamic reduce(List list, dynamic iteratee, [dynamic accumulator]) =>
    _reduce(list, iteratee, accumulator: accumulator);

dynamic reduceRight(List list, dynamic iteratee, [dynamic accumulator]) =>
    _reduce(list, iteratee, accumulator: accumulator, right: true);
