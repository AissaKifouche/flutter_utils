import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' ;

class LocationService {

  static Future<Position?> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }
    if (permission == LocationPermission.deniedForever) return null;

    try {
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.low, timeLimit: Duration(seconds: 10)),
      );
      return pos;
    } catch (e) {
      try {
        final lastKnown = await Geolocator.getLastKnownPosition();
        return lastKnown;
      } catch (_) {
        return null;
      }
    }
  }

  static Future<String> reverseGeocode(double lat, double lon) async {
    try {
      final placemarks = await Geocoding().placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        // Check if values are non-null and non-empty
        if (place.locality != null && place.locality!.trim().isNotEmpty) {
          return place.locality!;
        }
        if (place.subAdministrativeArea != null && place.subAdministrativeArea!.trim().isNotEmpty) {
          return place.subAdministrativeArea!;
        }
        if (place.administrativeArea != null && place.administrativeArea!.trim().isNotEmpty) {
          return place.administrativeArea!;
        }
      }
    } catch (e) {
      debugPrint("Error in reverse geocoding: $e");
    }

    return 'Unknown Location';
  }

}