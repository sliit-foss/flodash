import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.zipObject(["a", "b"], [1, 2]), equals({"a": 1, "b": 2}));
  });
  test('empty', () {
    expect(flodash.zipObject([], []), equals({}));
  });
}
