import 'package:flodash/flodash.dart' as flodash;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('capitalize letters with spaces', () {
    String str = flodash.camelCase('Foo Bar');
    expect(str, 'fooBar');
  });
  test('words with dashes', () {
    String str = flodash.camelCase('--foo-bar--');
    expect(str, 'fooBar');
  });
  test('camelCase word', () {
    String str = flodash.camelCase('fooBar');
    expect(str, 'fooBar');
  });
  test('words with underscore', () {
    String str = flodash.camelCase('__FOO_BAR__');
    expect(str, 'fooBar');
  });
  test('camelCase word with dashes on end', () {
    String str = flodash.camelCase('fooBar--');
    expect(str, 'fooBar');
  });
  test('camelCase word with underscores on end', () {
    String str = flodash.camelCase('fooBar__');
    expect(str, 'fooBar');
  });
  test('dashes in between words', () {
    String str = flodash.camelCase('foo--bar');
    expect(str, 'fooBar');
  });
  test('underscores in between words', () {
    String str = flodash.camelCase('foo__bar');
    expect(str, 'fooBar');
  });
  test('dots in between words', () {
    String str = flodash.camelCase('foo..bar');
    expect(str, 'fooBar');
  });
  test('dots with words', () {
    String str = flodash.camelCase('..foo..bar..');
    expect(str, 'fooBar');
  });
  test('words with latin characters', () {
    String str = flodash.camelCase('__foo__déjà vu__');
    expect(str, 'fooDejaVu');
  });
}
