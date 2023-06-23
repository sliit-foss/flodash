import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.join([1, 2, 3], "-"), equals("1-2-3"));
  });
  test('empty-separator', () {
    expect(flodash.join([1, 2, 3], ""), equals("123"));
  });
}
