import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('depth of 3', () {
    expect(
        flodash.flattenDeep([
          1,
          [
            2,
            [
              3,
              [4]
            ],
            5
          ]
        ]),
        equals([1, 2, 3, 4, 5]));
  });
}
