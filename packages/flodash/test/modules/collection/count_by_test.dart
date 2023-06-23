import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('count truncated values', () {
    expect(flodash.countBy([6.1, 4.2, 6.3], (dynamic num) => num.floor()),
        equals({'4': 1, '6': 2}));
  });
}
