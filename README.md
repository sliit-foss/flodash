# Flodash
[![Pub](https://img.shields.io/pub/v/flodash.svg)](https://pub.dartlang.org/packages/flodash)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/andresaraujo/flodash/master/LICENSE)
<br/><br/>

This library is a dart specific implementation of the popular JavaScript library [lodash](https://lodash.com/). It is a collection of utility functions that make it easier to work with collections, objects, numbers, strings, etc.
<br/><br/>
While this library exposes almost all the functionality of lodash, it is not an exact match. Some functions have been omitted because they are not applicable to dart and some functions have been marked as deprecated because their functionality is already provided by dart itself. For a complete list of the functions that have been omitted, please refer to the [omitted functions](#omitted-functions) section.
<br/><br/>
## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  flodash: ^1.0.0
```

## Usage

A simple usage example:

```dart
import 'package:flodash/flodash.dart' as flodash;

main() {
  List<int> list = [1, [2, 3]];
  print(flodash.flatten(list)); // [1, 2, 3]
}
```

## Contributing
If you want to contribute to this project, please read the [contributing guidelines](CONTRIBUTING.md).

<br/>

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

<br/>

## Omitted functions
The following functions have been omitted because they are not applicable to dart:
- Array
  - differenceBy
  - intersectionBy
  - pull
  - pullAll
  - pullAllBy
  - pullAllWith
  - pullAt
  - unionBy
  - unzipWith
  - xorBy
  - zipWith

- Collection
  - invokeMap