import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('with all lowercase latin letters', () {
    String str = flodash.deburr('déjà vu');
    expect(str, 'deja vu');
  });
  test('with latin letters mix case', () {
    String str = flodash.deburr('déjà VU');
    expect(str, 'deja VU');
  });
  test('with camel case letters', () {
    String str = flodash.deburr('fooBar');
    expect(str, 'fooBar');
  });
  test('camel case words with spaces', () {
    String str = flodash.deburr('foo Bar');
    expect(str, 'foo Bar');
  });
}
