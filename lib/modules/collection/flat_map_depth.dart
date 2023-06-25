import '../array/flatten_depth.dart';

List flatMapDepth(List list, dynamic iteratee, {int depth = 1}) =>
    flattenDepth(list.map((element) => iteratee(element)).toList(),
        depth: depth);
