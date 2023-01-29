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
