import '../lang/main.dart';

List sortedUniq(List list) {
  List result = [];
  for (int i = 0; i < list.length; i++) {
    if (i == 0 || !isEqual(list[i], list[i - 1])) result.add(list[i]);
  }
  return result;
}
