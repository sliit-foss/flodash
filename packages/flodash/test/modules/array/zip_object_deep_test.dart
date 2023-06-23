import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(
        flodash.zipObjectDeep(["a.b[0].c", "a.b[1].d"], [1, 2]),
        equals({
          "a": {
            "b": [
              {"c": 1},
              {"d": 2}
            ]
          }
        }));
  });
  test('empty', () {
    expect(flodash.zipObjectDeep([], []), equals({}));
  });
}
