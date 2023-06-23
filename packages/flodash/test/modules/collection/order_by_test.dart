import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  List li = [
    {'user': 'fred', 'age': 48},
    {'user': 'barney', 'age': 34},
    {'user': 'fred', 'age': 40},
    {'user': 'barney', 'age': 36}
  ];
  test('default order', () {
    expect(
        flodash.orderBy([...li], ['user', 'age']),
        equals([
          {'user': 'barney', 'age': 34},
          {'user': 'barney', 'age': 36},
          {'user': 'fred', 'age': 40},
          {'user': 'fred', 'age': 48},
        ]));
  });
  test('custom order', () {
    expect(
        flodash.orderBy([...li], ['user', 'age'], ['asc', 'desc']),
        equals([
          {'user': 'barney', 'age': 36},
          {'user': 'barney', 'age': 34},
          {'user': 'fred', 'age': 48},
          {'user': 'fred', 'age': 40},
        ]));
  });
}
