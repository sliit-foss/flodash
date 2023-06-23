import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('reject', () {
    expect(flodash.reject([1, 2, 3, 4], (value) => value % 2 == 0),
        equals([1, 3]));
  });
}
