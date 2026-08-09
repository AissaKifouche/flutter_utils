import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//a class containing format functions, for now just one
class Times {

  //a format function for TimeOfDay objects, uses the same formats as DateFormat
  static String formatTimeOfDay(TimeOfDay time, {String format = "HH:mm"}){
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat(format).format(dateTime);
  }

  //format the time for DateTime objects
  static String formatTimeDateTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  //a function to get the sun progress
  static double getSunProgress({
    required DateTime sunrise,
    required DateTime sunset,
    required DateTime now,
  }) {
    // If it's before sunrise, progress is 0.0
    if (now.isBefore(sunrise)) {
      return 0.0;
    }

    // If it's after sunset, progress is 1.0 (100% full)
    if (now.isAfter(sunset)) {
      return 1.0;
    }

    // Total duration of daylight in milliseconds
    final double totalDaylight =
        sunset.millisecondsSinceEpoch - sunrise.millisecondsSinceEpoch.toDouble();

    // Elapsed daylight from sunrise to right now in milliseconds
    final double elapsedDaylight =
        now.millisecondsSinceEpoch - sunrise.millisecondsSinceEpoch.toDouble();

    // Calculate percentage progress between 0.0 and 1.0
    final double progress = elapsedDaylight / totalDaylight;

    return progress.clamp(0.0, 1.0);
  }

  static double getNightProgress({
    required DateTime sunset,
    required DateTime sunrise,
    required DateTime now,
}){
    if (now.isBefore(sunset)){
      return 0;
    }

    if (now.isAfter(sunrise)){
      return 1;
    }

    final double totalNightTime = sunrise.millisecondsSinceEpoch - sunset.millisecondsSinceEpoch.toDouble();
    final double passedFromNight = now.millisecondsSinceEpoch - sunset.millisecondsSinceEpoch.toDouble();

    final progress = passedFromNight / totalNightTime;
    return progress.clamp(0, 1);
  }

}