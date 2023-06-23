import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iterator function', () {
    expect(
        flodash.groupBy([6.1, 4.2, 6.3], (value) => value.floor()),
        equals({
          4: [4.2],
          6: [6.1, 6.3]
        }));
  });
  test('shorthand-property', () {
    expect(
        flodash.groupBy([
          {'a': 1},
          {'a': 2},
          {'a': 1}
        ], 'a'),
        equals({
          1: [
            {'a': 1},
            {'a': 1}
          ],
          2: [
            {'a': 2}
          ]
        }));
  });
}
