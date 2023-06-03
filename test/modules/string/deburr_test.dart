import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deburr', () {
    String str = flodash.deburr('déjà vu');
    expect(str, 'deja vu');
  });
  test('deburr', () {
    String str = flodash.deburr('déjà vu');
    expect(str, 'deja vu');
  });
  test('deburr', () {
    String str = flodash.deburr('fooBar');
    expect(str, 'fooBar');
  });
  test('deburr', () {
    String str = flodash.deburr('foo Bar');
    expect(str, 'foo Bar');
  });
}
