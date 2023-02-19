import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  group('cast-array', () {
    test('null', () {
      expect(flodash.castArray(null), equals([null]));
    });
    test('empty', () {
      expect(flodash.castArray([]), equals([]));
    });
    test('list', () {
      expect(flodash.castArray([1]), equals([1]));
    });
    test('map', () {
      expect(
          flodash.castArray({'a': 1}),
          equals([
            {'a': 1}
          ]));
    });
    test('primitive', () {
      expect(flodash.castArray('a'), equals(['a']));
    });
  });
  group('conforms-to', () {
    test('null', () {
      expect(flodash.conformsTo(null, {}), equals(false));
    });
    test('empty', () {
      expect(flodash.conformsTo({}, {}), equals(true));
    });
    test('map', () {
      expect(
          flodash.conformsTo({'a': 1}, {'a': (v) => v == 1}),
          equals(true));
      expect(
          flodash.conformsTo({'a': 1}, {'a': (v) => v == 2}),
          equals(false));
    });
    test('list', () {
      expect(
          flodash.conformsTo([1, 4, 5, 3, 8], [1, 4, 5, 3, (v) => v == 8]),
          equals(true));
      expect(
          flodash.conformsTo([2, 4, 6], [2, 2, (v) => v == 6]),
          equals(false));
    });
  });
  group('eq', () {
    test('string', () {
      expect(flodash.eq('a', 'a'), equals(true));
      expect(flodash.eq('a', 'b'), equals(false));
    });
    test('number', () {
      expect(flodash.eq(1, 1), equals(true));
      expect(flodash.eq(1, 2), equals(false));
    });
    test('double', () {
      expect(flodash.eq(1.0, 1.0), equals(true));
      expect(flodash.eq(1.0, 2.0), equals(false));
    });
    test('bool', () {
      expect(flodash.eq(true, true), equals(true));
      expect(flodash.eq(true, false), equals(false));
    });
    test('null', () {
      expect(flodash.eq(null, null), equals(true));
      expect(flodash.eq(null, 1), equals(false));
    });
    test('nan', () {
      expect(flodash.eq(double.nan, double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.eq([1], [1]), equals(false));
      expect(flodash.eq([1], [2]), equals(false));
    });
    test('map', () {
      expect(flodash.eq({'a': 1}, {'a': 1}), equals(false));
      expect(flodash.eq({'a': 1}, {'a': 2}), equals(false));
    });
  });
  group('gt', () {
    test('string', () {
      expect(flodash.gt('a', 'a'), equals(false));
      expect(flodash.gt('a', 'b'), equals(false));
      expect(flodash.gt('b', 'a'), equals(true));
    });
    test('number', () {
      expect(flodash.gt(1, 1), equals(false));
      expect(flodash.gt(1, 2), equals(false));
      expect(flodash.gt(2, 1), equals(true));
    });
    test('double', () {
      expect(flodash.gt(1.0, 1.0), equals(false));
      expect(flodash.gt(1.0, 2.0), equals(false));
      expect(flodash.gt(2.0, 1.0), equals(true));
    });
    test('nan', () {
      expect(flodash.gt(double.nan, double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.gt([], [1]), equals(false));
      expect(flodash.gt([1], []), equals(true));
    });
    test('map', () {
      expect(flodash.gt({}, {'a': 1}), equals(false));
      expect(flodash.gt({'a': 1}, {}), equals(true));
    });
  });
  group('gte', () {
    test('string', () {
      expect(flodash.gte('a', 'a'), equals(true));
      expect(flodash.gte('a', 'b'), equals(false));
      expect(flodash.gte('b', 'a'), equals(true));
    });
    test('number', () {
      expect(flodash.gte(1, 1), equals(true));
      expect(flodash.gte(1, 2), equals(false));
      expect(flodash.gte(2, 1), equals(true));
    });
    test('double', () {
      expect(flodash.gte(1.0, 1.0), equals(true));
      expect(flodash.gte(1.0, 2.0), equals(false));
      expect(flodash.gte(2.0, 1.0), equals(true));
    });
    test('nan', () {
      expect(flodash.gte(double.nan, double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.gte([], [1]), equals(false));
      expect(flodash.gte([1], []), equals(true));
    });
    test('map', () {
      expect(flodash.gte({}, {'a': 1}), equals(false));
      expect(flodash.gte({'a': 1}, {}), equals(true));
    });
  });
  group('is-array', () {
    test('empty', () {
      expect(flodash.isArray([]), equals(true));
    });
    test('list', () {
      expect(flodash.isArray([1, 2, 3]), equals(true));
    });
    test('map', () {
      expect(flodash.isArray({'a': 1}), equals(false));
    });
  });
  group('is-boolean', () {
    test('true', () {
      expect(flodash.isBoolean(true), equals(true));
    });
    test('false', () {
      expect(flodash.isBoolean(false), equals(true));
    });
    test('null', () {
      expect(flodash.isBoolean(null), equals(false));
    });
    test('number', () {
      expect(flodash.isBoolean(1), equals(false));
    });
    test('string', () {
      expect(flodash.isBoolean('a'), equals(false));
    });
    test('list', () {
      expect(flodash.isBoolean([1, 2, 3]), equals(false));
    });
    test('map', () {
      expect(flodash.isBoolean({'a': 1}), equals(false));
    });
  });
  group('is-nan', () {
    test('nan', () {
      expect(flodash.isNaN(0/0), equals(true));
    });
    test('null', () {
      expect(flodash.isNaN(null), equals(false));
    });
    test('number', () {
      expect(flodash.isNaN(1), equals(false));
    });
    test('string', () {
      expect(flodash.isNaN('a'), equals(false));
    });
  });
  group('lt', () {
    test('string', () {
      expect(flodash.lt('a', 'a'), equals(false));
      expect(flodash.lt('a', 'b'), equals(true));
      expect(flodash.lt('b', 'a'), equals(false));
    });
    test('number', () {
      expect(flodash.lt(1, 1), equals(false));
      expect(flodash.lt(1, 2), equals(true));
      expect(flodash.lt(2, 1), equals(false));
    });
    test('double', () {
      expect(flodash.lt(1.0, 1.0), equals(false));
      expect(flodash.lt(1.0, 2.0), equals(true));
      expect(flodash.lt(2.0, 1.0), equals(false));
    });
    test('nan', () {
      expect(flodash.lt(double.nan, double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.lt([], [1]), equals(true));
      expect(flodash.lt([1], []), equals(false));
    });
    test('map', () {
      expect(flodash.lt({}, {'a': 1}), equals(true));
      expect(flodash.lt({'a': 1}, {}), equals(false));
    });
  });
  group('lte', () {
    test('string', () {
      expect(flodash.lte('a', 'a'), equals(true));
      expect(flodash.lte('a', 'b'), equals(true));
      expect(flodash.lte('b', 'a'), equals(false));
    });
    test('number', () {
      expect(flodash.lte(1, 1), equals(true));
      expect(flodash.lte(1, 2), equals(true));
      expect(flodash.lte(2, 1), equals(false));
    });
    test('double', () {
      expect(flodash.lte(1.0, 1.0), equals(true));
      expect(flodash.lte(1.0, 2.0), equals(true));
      expect(flodash.lte(2.0, 1.0), equals(false));
    });
    test('nan', () {
      expect(flodash.lte(double.nan, double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.lte([], [1]), equals(true));
      expect(flodash.lte([1], []), equals(false));
    });
    test('map', () {
      expect(flodash.lte({}, {'a': 1}), equals(true));
      expect(flodash.lte({'a': 1}, {}), equals(false));
    });
  });
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
  group('isEqual', () {
    test('string', () {
      expect(flodash.isEqual('a', 'a'), equals(true));
      expect(flodash.isEqual('a', 'b'), equals(false));
    });
    test('number', () {
      expect(flodash.isEqual(1, 1), equals(true));
      expect(flodash.isEqual(1, 2), equals(false));
    });
    test('double', () {
      expect(flodash.isEqual(1.0, 1.0), equals(true));
      expect(flodash.isEqual(1.0, 2.0), equals(false));
    });
    test('bool', () {
      expect(flodash.isEqual(true, true), equals(true));
      expect(flodash.isEqual(true, false), equals(false));
    });
    test('null', () {
      expect(flodash.isEqual(null, null), equals(true));
      expect(flodash.isEqual(null, 1), equals(false));
    });
    test('nan', () {
      expect(flodash.isEqual(double.nan, double.nan), equals(false));
    });
    test('list', () {
      expect(flodash.isEqual([], []), equals(true));
      expect(flodash.isEqual([1], [1]), equals(true));
      expect(flodash.isEqual([1], [2]), equals(false));
    });
    test('map', () {
      expect(flodash.isEqual({}, {}), equals(true));
      expect(flodash.isEqual({'a': 1}, {'a': 1}), equals(true));
      expect(flodash.isEqual({'a': 1}, {'a': 2}), equals(false));
    });
  });
  group('to-string', () {
    test('string', () {
      expect(flodash.toString('a'), equals('a'));
    });
    test('number', () {
      expect(flodash.toString(1), equals('1'));
    });
    test('double', () {
      expect(flodash.toString(1.0), equals('1.0'));
    });
    test('bool', () {
      expect(flodash.toString(true), equals('true'));
    });
    test('null', () {
      expect(flodash.toString(null), equals(''));
    });
    test('nan', () {
      expect(flodash.toString(double.nan), equals('NaN'));
    });
    test('list', () {
      expect(flodash.toString([]), equals('[]'));
      expect(flodash.toString([1]), equals('[1]'));
    });
    test('map', () {
      expect(flodash.toString({}), equals('{}'));
      expect(flodash.toString({'a': 1}), equals('{a: 1}'));
    });
  });
}
