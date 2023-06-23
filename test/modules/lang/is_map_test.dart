import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('integer', () {
    expect(flodash.isMap(1), equals(false));
  });
  test('map', () {
    expect(flodash.isMap({"a": 1, "b": 2}), equals(true));
  });
}
