import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('depth-of-2', () {
    expect(
        flodash.flattenDepth([
          1,
          [
            2,
            [
              3,
              [4]
            ],
            5
          ]
        ], depth: 2),
        equals([
          1,
          2,
          3,
          [4],
          5
        ]));
  });
}
