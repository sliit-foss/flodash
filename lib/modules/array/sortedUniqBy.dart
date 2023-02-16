import '../lang/main.dart';

List sortedUniqBy(List list, Function iteratee) {
  List result = [];
  for (int i = 0; i < list.length; i++) {
    if (i == 0 || !isEqual(iteratee(list[i]), iteratee(list[i - 1]))) {
      result.add(list[i]);
    }
  }
  return result;
}
