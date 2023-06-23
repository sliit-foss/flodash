import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('simple', () {
    expect(flodash.difference([2, 1], [2, 3]), equals([1]));
  });
  test('nested-lists', () {
    expect(
        flodash.difference([
          2,
          1,
          [2, 3]
        ], [
          [2, 3]
        ]),
        equals([2, 1]));
  });
  test('nested-lists-2', () {
    expect(
        flodash.difference([
          2,
          1,
          [2, 3]
        ], [
          [2, 3],
          2
        ]),
        equals([1]));
  });
  test('maps-1', () {
    expect(
        flodash.difference([
          {"a": 1},
          {"b": 2}
        ], [
          {"a": 1}
        ]),
        equals([
          {"b": 2}
        ]));
  });
  test('maps-2', () {
    expect(
        flodash.difference([
          {"a": 1},
          {"b": 2}
        ], [
          {"a": 1},
          {"b": 2}
        ]),
        equals([]));
  });
  test('mixed-types', () {
    expect(
        flodash.difference([
          2,
          1,
          [2, 3],
          {"a": 1},
          {"b": 2}
        ], [
          [2, 3],
          2,
          {"a": 1}
        ]),
        equals([
          1,
          {"b": 2}
        ]));
  });
}
