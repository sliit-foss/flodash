import '../../_utils/_array.dart';
import '../collection/main.dart';

Map<dynamic, dynamic> zipObjectDeep(List list, List values) => reduce(
    list,
    (acc, element, index) =>
        setRecursiveProperty(element.split('.'), values[index], acc),
    {});
