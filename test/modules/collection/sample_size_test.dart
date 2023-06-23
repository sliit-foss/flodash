import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  List li = [1, 2, 3, 4];
  test('default sample of 1', () {
    expect(flodash.sampleSize(li).length, equals(1));
  });
  test('n samples', () {
    expect(flodash.sampleSize(li, n: 2).length, equals(2));
  });
}
