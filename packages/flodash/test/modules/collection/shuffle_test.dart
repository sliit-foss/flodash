import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('shuffle', () {
    expect(flodash.shuffle([1, 2, 3]), unorderedEquals([1, 2, 3]));
  });
}
