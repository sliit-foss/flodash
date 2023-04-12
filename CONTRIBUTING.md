[![Discord Chat](https://img.shields.io/badge/chat-discord-blue.svg)](https://discord.gg/xSTPEqm)

# Raising Issues in Flodash

If you've found an issue or have any suggestion for this library, feel free to [open an issue](https://github.com/sliit-foss/flodash/issues). Please do make sure to attach any relevant screenshots / stacktraces if it is a bug being reported.

# Contributing Code to Flodash

If you're going to work on an issue, please add a comment to the issue so others know it's being looked at. If there isn't an issue for the work you want to do, please create one. The [good first issue](https://github.com/Dart-Code/Dart-Code/labels/good%20first%20issue%20%3Aoctocat%3A) issues might make good starting points for new contributors.

For general details on developing dart packages see the [Official API docs](https://docs.flutter.dev/development/packages-and-plugins/developing-packages).

## Project Structure

Flodash is written purely in dart and has no dependencies on third party libraries. The functions are grouped into modules all of which are exported through the main entry point in the `lib/flodash.dart` file.

- ### lib/modules

  - Contains all modules with functions grouped as they are in the original Lodash library.

- ### lib/\_utils

  - Contains a set of utility functions which are common to all modules.

- ### test/modules

  - Code for automated unit tests which should not be imported into any files outside of this folder. Run `flutter test` to run these test suites.

## Cloning and Running Dart Code

Running Flodash locally is relatively straight forward. You should:

1. Clone the repository (or your own fork)
2. Run `pub get` to install dependencies
3. Link this package to a consumer project's `pubspec.yaml` as follows:

```yaml
flodash:
  path: ./path_to_package/flodash/
```

## Automated Tests

- All tests will be run via GitHub Actions once a PR is opened to the main branch.

## Code Quality

- The repository is configured with [husky](https://pub.dev/packages/husky) to run the [Dart formatter](https://dart.dev/tools/dart-format) which formats and lints the code before each commit.
