import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    List array = [1, 2, 3, 4];
    expect(flodash.remove(array, (n) => n % 2 == 0), equals([2, 4]));
    expect(array, equals([1, 3]));
  });
  test('no-removals', () {
    expect(flodash.remove([1, 2, 3, 4], (n) => n % 5 == 0), equals([]));
  });
}
