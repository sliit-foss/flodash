import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('upper', () {
    int num = flodash.random(5);
    expect(num, greaterThanOrEqualTo(0));
    expect(num, lessThanOrEqualTo(5));
  });
  test('lower', () {
    int num = flodash.random(10, lower: 4);
    expect(num, greaterThanOrEqualTo(4));
    expect(num, lessThanOrEqualTo(10));
    expect(num.runtimeType, int);
  });
  test('floating point numbers', () {
    double num = flodash.random(1.3, lower: 7.5);
    expect(num, greaterThanOrEqualTo(1.3));
    expect(num, lessThanOrEqualTo(7.5));
    expect(num.runtimeType, double);
  });
  test('floating point param', () {
    double num = flodash.random(1, lower: 8, floating: true);
    expect(num, greaterThanOrEqualTo(1));
    expect(num, lessThanOrEqualTo(8));
    expect(num.runtimeType, double);
  });
}
