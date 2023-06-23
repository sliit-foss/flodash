import '../../_utils/_array.dart';

List _takeWhile(List list, dynamic predicate, {int start = 0, dynamic end}) {
  if (list.isEmpty) return [];
  List result = [];
  end ??= list.length;
  bool isFromRight = start > end;
  for (int i = start; isFromRight ? i >= end : i < end;) {
    if (evaluatePredicate(predicate, list[i])) {
      result.add(list[i]);
    } else {
      break;
    }
    isFromRight ? i-- : i++;
  }
  return isFromRight ? result.reversed.toList() : result;
}

List<dynamic> Function(List<dynamic>, dynamic, {dynamic end, int start})
    takeWhile = _takeWhile;

List takeRightWhile(List list, dynamic predicate) =>
    _takeWhile(list, predicate, start: list.length - 1, end: 0);
