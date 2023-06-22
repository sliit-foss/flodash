import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  // lowerCase is converts string as space separated words, to lower case.
  test('capitalized words with spaces', () {
    String str = flodash.lowerCase('Foo Bar');
    expect(str, 'foo bar');
  });
  test('words with dashes', () {
    String str = flodash.lowerCase('--foo-bar--');
    expect(str, 'foo bar');
  });
  test('with camelCase word', () {
    String str = flodash.lowerCase('fooBar');
    expect(str, 'foo bar');
  });
  test('with kebabCase word', () {
    String str = flodash.lowerCase('foo-bar');
    expect(str, 'foo bar');
  });
  test('with snakeCase word', () {
    String str = flodash.lowerCase('foo_bar');
    expect(str, 'foo bar');
  });
}
