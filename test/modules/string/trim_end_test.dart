import 'package:flodash/flodash.dart' as flodash;
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('trimEnd with trailing whitespace', () {
    String result = flodash.trimEnd('  abc  ');
    expect(result, '  abc');
  });
  test('trimEnd with specified characters', () {
    String result = flodash.trimEnd('-_-abc-_-', '_-');
    expect(result, '-_-abc');
  });
  test('trimEnd with empty string', () {
    String result = flodash.trimEnd('');
    expect(result, '');
  });
  test('trimEnd with empty string and specified characters', () {
    String result = flodash.trimEnd('', '_-');
    expect(result, '');
  });
  test('trimEnd with no whitespace or specified characters', () {
    String result = flodash.trimEnd('abc');
    expect(result, 'abc');
  });
  test('trimEnd with only whitespace', () {
    String result = flodash.trimEnd('   ');
    expect(result, '');
  });
  test('trimEnd with only specified characters', () {
    String result = flodash.trimEnd('---', '-');
    expect(result, '');
  });
  test('trimEnd with whitespace and specified characters', () {
    String result = flodash.trimEnd('abc -_- ', '_- ');
    expect(result, 'abc');
  });
}