/// Converts the first character of `String` to upper case and the remaining to lower case.
String capitalize(String string) => string.isNotEmpty
    ? string[0].toUpperCase() + string.substring(1).toLowerCase()
    : '';
