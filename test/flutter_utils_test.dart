import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils/flutter_utils.dart';

void main() {
  test('formats TimeOfDay', () {
    final TimeOfDay timeOfDay = TimeOfDay(hour: 18, minute: 30);
    expect(Times.formatTimeOfDay(timeOfDay), "18:30");
  });
}
