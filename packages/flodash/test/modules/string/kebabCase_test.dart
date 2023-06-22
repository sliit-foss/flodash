import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('capitalized words with spaces', () {
    String str = flodash.kebabCase('Foo Bar');
    expect(str, 'foo-bar');
  });
  test('words with dashes', () {
    String str = flodash.kebabCase('--foo-bar--');
    expect(str, 'foo-bar');
  });
  test('with camelCase word', () {
    String str = flodash.kebabCase('fooBar');
    expect(str, 'foo-bar');
  });
  test('lowerCase words with spaces', () {
    String str = flodash.kebabCase('foo bar');
    expect(str, 'foo-bar');
  });
  test('with snakeCase word', () {
    String str = flodash.kebabCase('__foo_bar__');
    expect(str, 'foo-bar');
  });
}
