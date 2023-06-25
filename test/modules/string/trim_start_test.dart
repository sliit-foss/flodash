import 'package:flodash/flodash.dart' as flodash;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('trimStart with leading whitespace', () {
    String result = flodash.trimStart('  abc  ');
    expect(result, 'abc  ');
  });
  test('trimStart with specified characters', () {
    String result = flodash.trimStart('-_-abc-_-', '_-');
    expect(result, 'abc-_-');
  });
  test('trimStart with empty string', () {
    String result = flodash.trimStart('');
    expect(result, '');
  });
  test('trimStart with empty string and specified characters', () {
    String result = flodash.trimStart('', '_-');
    expect(result, '');
  });
  test('trimStart with no whitespace or specified characters', () {
    String result = flodash.trimStart('abc');
    expect(result, 'abc');
  });
  test('trimStart with only whitespace', () {
    String result = flodash.trimStart('   ');
    expect(result, '');
  });
  test('trimStart with only specified characters', () {
    String result = flodash.trimStart('---', '-');
    expect(result, '');
  });
  test('trimStart with whitespace and specified characters', () {
    String result = flodash.trimStart(' -_-abc', '_- ');
    expect(result, 'abc');
  });
}
