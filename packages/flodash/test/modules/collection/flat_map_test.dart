import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test("iterator function", () {
    expect(flodash.flatMap([1, 2, 3, 4], (value) => [value, value]),
        equals([1, 1, 2, 2, 3, 3, 4, 4]));
  });
}
