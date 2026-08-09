import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils/flutter_utils.dart';

void main() {
  test('formats TimeOfDay', () {
    final TimeOfDay timeOfDay = TimeOfDay(hour: 10, minute: 30);
    expect(Format.formatTimeOfDay(timeOfDay), "10:30");
  });
}
