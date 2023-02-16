import '../array/flatten.dart';

List flatMap(List list, dynamic iteratee) =>
    flatten(list.map((element) => iteratee(element)).toList());
