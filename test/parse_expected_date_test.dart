import 'package:flutter_test/flutter_test.dart';

import 'package:upcoming_mobiles_frontend/model/device.dart';

void main() {
  group('parsing expected date', () {
    test('WHEN date is "-" THEN returns empty string', () {
      expect(parseExpectedDate('-'), '');
    });
    test('WHEN date is "" THEN returns empty string', () {
      expect(parseExpectedDate(''), '');
    });
    test(
        'WHEN date is "Expected Launch:May 20xx" '
        'THEN returns "Launch : May 20xx"', () {
      expect(parseExpectedDate('Expected Launch:May 20xx'), 'Launch : May 20xx');
    });
  });

  group('getting devices data from database', () {});
}
