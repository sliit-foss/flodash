import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('with a capitalized word', () {
    String str = flodash.lowerFirst('Fred');
    expect(str, 'fred');
  });
  test('with a lower case word', () {
    String str = flodash.lowerFirst('fred');
    expect(str, 'fred');
  });
  test('with a sentence cased word', () {
    String str = flodash.lowerFirst('FooBar');
    expect(str, 'fooBar');
  });
  test('with a kebab cased word', () {
    String str = flodash.lowerFirst('--foo-bar');
    expect(str, '--foo-bar');
  });
  test('with a snake cased word', () {
    String str = flodash.lowerFirst('__foo_bar__');
    expect(str, '__foo_bar__');
  });
  test('with a all uppercase word', () {
    String str = flodash.lowerFirst('FRED');
    expect(str, 'fRED');
  });
  test('with a Latin letters', () {
    String str = flodash.lowerFirst('Á É');
    expect(str, 'á É');
  });
}
