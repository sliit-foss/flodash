import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

runTests() {
  group('truthy', () {
    test('string', () {
      expect(flodash.isTruthy(''), equals(false));
      expect(flodash.isTruthy(' '), equals(true));
      expect(flodash.isTruthy('a'), equals(true));
    });
    test('number', () {
      expect(flodash.isTruthy(0), equals(false));
      expect(flodash.isTruthy(1), equals(true));
      expect(flodash.isTruthy(-1), equals(true));
    });
    test('double', () {
      expect(flodash.isTruthy(0.0), equals(false));
      expect(flodash.isTruthy(1.0), equals(true));
      expect(flodash.isTruthy(-1.0), equals(true));
    });
    test('bool', () {
      expect(flodash.isTruthy(false), equals(false));
      expect(flodash.isTruthy(true), equals(true));
    });
    test('null', () {
      expect(flodash.isTruthy(null), equals(false));
    });
    test('nan', () {
      expect(flodash.isTruthy(double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.isTruthy([]), equals(true));
      expect(flodash.isTruthy([1]), equals(true));
    });
    test('map', () {
      expect(flodash.isTruthy({}), equals(true));
      expect(flodash.isTruthy({'a': 1}), equals(true));
    });
  });
  group('falsy', () {
    test('string', () {
      expect(flodash.isFalsy(''), equals(true));
      expect(flodash.isFalsy(' '), equals(false));
      expect(flodash.isFalsy('a'), equals(false));
    });
    test('number', () {
      expect(flodash.isFalsy(0), equals(true));
      expect(flodash.isFalsy(1), equals(false));
      expect(flodash.isFalsy(-1), equals(false));
    });
    test('double', () {
      expect(flodash.isFalsy(0.0), equals(true));
      expect(flodash.isFalsy(1.0), equals(false));
      expect(flodash.isFalsy(-1.0), equals(false));
    });
    test('bool', () {
      expect(flodash.isFalsy(false), equals(true));
      expect(flodash.isFalsy(true), equals(false));
    });
    test('null', () {
      expect(flodash.isFalsy(null), equals(true));
    });
    test('nan', () {
      expect(flodash.isFalsy(double.nan), equals(true));
    });
    test('list', () {
      expect(flodash.isFalsy([]), equals(false));
      expect(flodash.isFalsy([1]), equals(false));
    });
    test('map', () {
      expect(flodash.isFalsy({}), equals(false));
      expect(flodash.isFalsy({'a': 1}), equals(false));
    });
  });
}
