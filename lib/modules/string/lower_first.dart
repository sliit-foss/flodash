/// Converts the first character of `string` to lower case.
String lowerFirst(String string) =>
    string.isNotEmpty ? string[0].toLowerCase() + string.substring(1) : '';
