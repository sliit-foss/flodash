import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('words with dashes', () {
    List<String> str = flodash.words(string: '--foo-bar--');
    expect(str, ['foo', 'bar']);
  });
  test('words with underscore', () {
    List<String> str = flodash.words(string: '__FOO_BAR__');
    expect(str, ['FOO', 'BAR']);
  });
  test('with camelCase word', () {
    List<String> str = flodash.words(string: 'fooBar');
    expect(str, ['foo', 'Bar']);
  });
  test('words with latin characters', () {
    List<String> str = flodash.words(string: '__foo__déjà vu__');
    expect(str, ['foo', 'déjà', 'vu']);
  });
  test('words with pattern', () {
    List<String> str = flodash.words(
        string: 'fooBar',
        pattern: RegExp(r'[A-Z]+(?![a-z])|\d+|(?![A-Z])[a-z]+',
            caseSensitive: false));
    expect(str, ['fooBar']);
  });
  test('words with pattern with case sensitive', () {
    List<String> str = flodash.words(
        string: 'fooBar',
        pattern: RegExp(r'[A-Z]+(?![a-z])|\d+|(?![A-Z])[a-z]+',
            caseSensitive: true));
    expect(str, ['foo', 'ar']);
  });
  test('words with pattern and guard', () {
    List<String> str = flodash.words(
        string: 'fooBar',
        pattern: RegExp(r'[A-Z]+(?![a-z])|\d+|(?![A-Z])[a-z]+',
            caseSensitive: false),
        guard: true);
    expect(str, ['foo', 'Bar']);
  });
  test('words with custom pattern', () {
    List<String> str = flodash.words(
        string: 'fred, barney, & pebbles', pattern: RegExp(r'[^, ]+'));
    expect(str, ['fred', 'barney', '&', 'pebbles']);
  });
}
