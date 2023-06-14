import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('with all caps', () {
    String str = flodash.capitalize('FRED');
    expect(str, 'Fred');
  });
  test('with mixed case', () {
    String str = flodash.capitalize('FrED');
    expect(str, 'Fred');
  });
  test('two words both capitalized', () {
    String str = flodash.capitalize('Deja Vu');
    expect(str, 'Deja vu');
  });
  test('with all lowercase', () {
    String str = flodash.capitalize('kitten');
    expect(str, 'Kitten');
  });
  test('all caps without first letter', () {
    String str = flodash.capitalize('aDIDAS');
    expect(str, 'Adidas');
  });
  test('with a german character', () {
    String str = flodash.capitalize('ßtrasse');
    expect(str, 'SStrasse');
  });
}
