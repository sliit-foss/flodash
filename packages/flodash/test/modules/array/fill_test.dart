import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.fill([4, 6, 8, 10], "*"), equals(["*", "*", "*", "*"]));
  });
  test('start-end', () {
    expect(flodash.fill([4, 6, 8, 10], "*", start: 1, end: 3),
        equals([4, "*", "*", 10]));
  });
}
