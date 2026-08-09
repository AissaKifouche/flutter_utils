import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//a class containing format functions, for now just one
class Format {

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
}