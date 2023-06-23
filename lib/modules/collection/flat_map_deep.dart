import '../array/flatten_deep.dart';

List flatMapDeep(List list, dynamic iteratee) =>
    flattenDeep(list.map((element) => iteratee(element)).toList());
