import '../lang/main.dart';

List compact(List list) {
  return list.where((e) => !isFalsy(e)).toList();
}
