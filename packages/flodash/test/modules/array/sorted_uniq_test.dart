import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.sortedUniq([1, 1, 2]), equals([1, 2]));
  });
}
