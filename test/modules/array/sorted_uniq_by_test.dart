import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iteratee', () {
    expect(flodash.sortedUniqBy([1.1, 1.2, 1.4, 2.3, 2.4], (o) => o.floor()),
        equals([1.1, 2.3]));
  });
}
