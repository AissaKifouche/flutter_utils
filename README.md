# Flutter Utils

A collection of reusable utility functions for Flutter applications.

This package provides small, commonly useful utilities that can be reused across Flutter projects instead of rewriting the same code repeatedly.

## Features

* Format `TimeOfDay` values into readable time strings
* More reusable Flutter utilities will be added over time

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

### Format TimeOfDay

Convert a Flutter `TimeOfDay` into a `HH:mm` (or any other format, same formats as the ones used in DateFormat) formatted string:

```dart
const time = TimeOfDay(hour: 10, minute: 30);

final formattedTime = formatTimeOfDay(time);

print(formattedTime); // 10:30
```

## Additional information

This package is maintained as a personal collection of reusable Flutter utilities.

The package is open source and available on GitHub. Contributions, suggestions, and bug reports are welcome.

As the package grows, additional utilities and documentation will be added.
