# Flutter Utils

A collection of reusable utility functions for Flutter applications.

## Features

The package currently provides the `Times` utility class with functions for:

* Formatting `TimeOfDay` objects using `intl` date/time formats
* Formatting `DateTime` objects as `HH:mm`
* Calculating daylight/sun progress between sunrise and sunset
* Calculating nighttime progress between sunset and sunrise

More utilities will be added over time.

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

## Usage

### `formatTimeOfDay`

Formats a Flutter `TimeOfDay` using the same formatting patterns supported by the `intl` package.

```dart
const time = TimeOfDay(hour: 10, minute: 30);

final formattedTime = Times.formatTimeOfDay(time);

print(formattedTime); // 10:30
```

You can also provide a custom format:

```dart
const time = TimeOfDay(hour: 10, minute: 30);

final formattedTime = Times.formatTimeOfDay(
  time,
  format: 'hh:mm a',
);

print(formattedTime); // 10:30 AM
```

The `format` parameter uses `intl`'s `DateFormat` patterns.

### `formatTimeDateTime`

Formats a `DateTime` object as `HH:mm`.

```dart
final dateTime = DateTime(2026, 8, 9, 14, 30);

final formattedTime = Times.formatTimeDateTime(dateTime);

print(formattedTime); // 14:30
```

### `getSunProgress`

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

This can be useful for creating UI elements such as sun-position indicators or daylight progress bars.

### `getNightProgress`

Calculates the current progress of nighttime between sunset and the next sunrise.

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

## Additional information

This package is maintained as a personal collection of reusable Flutter utilities.

The package is open source and available on GitHub. Contributions, suggestions, and bug reports are welcome.

Additional utilities will be added as they become useful across different Flutter projects.
