# Flutter Utils

A collection of reusable utility functions and services for Flutter applications.

## Features

The package currently provides:

### `Times`

* Format `TimeOfDay` objects using `intl` date/time formats
* Format `DateTime` objects as `HH:mm`
* Calculate daylight progress between sunrise and sunset
* Calculate nighttime progress between sunset and sunrise

### `LocationService`

* Get the device's current location
* Handle location service and permission states
* Fall back to the last known location if getting the current position fails
* Reverse geocode coordinates into a readable location name

More utilities and services will be added over time.

## Getting started

Add the package to your Flutter project's `pubspec.yaml`:

```yaml
dependencies:
  flutter_utils:
    git:
      url: https://github.com/AissaKifouche/flutter_utils.git
```

Then run:

```bash
flutter pub get
```

Import the package:

```dart
import 'package:flutter_utils/flutter_utils.dart';
```

### Location permissions

`LocationService` uses the `geolocator` package to access the device's location and the `geocoding` package to convert coordinates into a location name.

Make sure your Flutter application has the required location permissions configured for the platforms you support.

For Android, add the appropriate location permission to:

```text
android/app/src/main/AndroidManifest.xml
```

For iOS, add the appropriate location usage description to:

```text
ios/Runner/Info.plist
```

Refer to the `geolocator` documentation for the platform-specific configuration required by your application.

## Usage

### Times

#### `formatTimeOfDay`

Formats a Flutter `TimeOfDay` using the same formatting patterns supported by the `intl` package.

```dart
const time = TimeOfDay(hour: 10, minute: 30);

final formattedTime = Times.formatTimeOfDay(time);

print(formattedTime); // 10:30
```

You can provide a custom format:

```dart
const time = TimeOfDay(hour: 10, minute: 30);

final formattedTime = Times.formatTimeOfDay(
  time,
  format: 'hh:mm a',
);

print(formattedTime); // 10:30 AM
```

The `format` parameter uses `intl`'s `DateFormat` patterns.

#### `formatTimeDateTime`

Formats a `DateTime` object as `HH:mm`.

```dart
final dateTime = DateTime(2026, 8, 9, 14, 30);

final formattedTime = Times.formatTimeDateTime(dateTime);

print(formattedTime); // 14:30
```

#### `getSunProgress`

Calculates the current progress of daylight between sunrise and sunset.

The returned value is between `0.0` and `1.0`:

* `0.0` — before sunrise
* `0.5` — halfway through the daylight period
* `1.0` — after sunset

```dart
final progress = Times.getSunProgress(
  sunrise: DateTime(2026, 8, 9, 5, 30),
  sunset: DateTime(2026, 8, 9, 19, 30),
  now: DateTime(2026, 8, 9, 12, 30),
);

print(progress); // 0.5
```

This can be useful for sun-position indicators and daylight progress bars.

#### `getNightProgress`

Calculates the current progress of nighttime between sunset and sunrise.

The returned value is between `0.0` and `1.0`:

* `0.0` — before sunset
* `0.5` — halfway through the night
* `1.0` — after sunrise

```dart
final progress = Times.getNightProgress(
  sunset: DateTime(2026, 8, 9, 19, 30),
  sunrise: DateTime(2026, 8, 10, 5, 30),
  now: DateTime(2026, 8, 10, 0, 30),
);

print(progress); // 0.5
```

### LocationService

#### `getCurrentPosition`

Attempts to retrieve the device's current location.

The function:

1. Checks whether location services are enabled.
2. Checks the location permission.
3. Requests permission if necessary.
4. Attempts to retrieve the current position.
5. Falls back to the last known position if retrieving the current position fails.

It returns a `Position?`, so it can return `null` if location services are disabled or permission is unavailable.

```dart
final position = await LocationService.getCurrentPosition();

if (position != null) {
  print('Latitude: ${position.latitude}');
  print('Longitude: ${position.longitude}');
}
```

#### `reverseGeocode`

Converts latitude and longitude coordinates into a readable location name.

The function tries to return the most relevant available location in this order:

1. Locality
2. Sub-administrative area
3. Administrative area

If no suitable location is found, it returns:

```text
Unknown Location
```

Example:

```dart
final location = await LocationService.reverseGeocode(
  35.4083,
  7.1433,
);

print(location);
```

## Additional information

This package is maintained as a personal collection of reusable Flutter utilities and services.

The package is open source and available on GitHub. Contributions, suggestions, and bug reports are welcome.

Additional utilities and services will be added as they become useful across different Flutter projects.
