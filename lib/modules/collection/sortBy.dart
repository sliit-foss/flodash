import 'orderBy.dart';

List sortBy(List list, dynamic iteratees) {
  if (iteratees is! List) iteratees = [iteratees];
  return orderBy(list, iteratees);
}
