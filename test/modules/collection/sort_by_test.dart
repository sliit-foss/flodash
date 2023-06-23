import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  List li = [
    {'user': 'fred', 'age': 48},
    {'user': 'barney', 'age': 36},
    {'user': 'fred', 'age': 40},
    {'user': 'barney', 'age': 34},
  ];
  test('shorthand-property-array', () {
    expect(
        flodash.sortBy([...li], ['user', 'age']),
        equals([
          {'user': 'barney', 'age': 34},
          {'user': 'barney', 'age': 36},
          {'user': 'fred', 'age': 40},
          {'user': 'fred', 'age': 48},
        ]));
  });
  test('iterator function', () {
    expect(
        flodash.sortBy([...li], (o) => o['user']),
        equals([
          {'user': 'barney', 'age': 36},
          {'user': 'barney', 'age': 34},
          {'user': 'fred', 'age': 48},
          {'user': 'fred', 'age': 40},
        ]));
  });
}
