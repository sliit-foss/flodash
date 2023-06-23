import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  List li = [
    {'dir': 'left', 'code': 97},
    {'dir': 'right', 'code': 100}
  ];
  test('iterator function - 1', () {
    expect(flodash.keyBy([6.1, 4.2, 6.3], (value) => value.floor()),
        equals({4: 4.2, 6: 6.3}));
  });
  test('iterator function - 2', () {
    expect(
        flodash.keyBy(li, (value) => String.fromCharCode(value['code'])),
        equals({
          'a': {'dir': 'left', 'code': 97},
          'd': {'dir': 'right', 'code': 100}
        }));
  });
  test('shorthand-property', () {
    expect(
        flodash.keyBy(li, 'dir'),
        equals({
          'left': {'dir': 'left', 'code': 97},
          'right': {'dir': 'right', 'code': 100}
        }));
  });
}
