///Removes trailing whitespace or specified characters from string.
String trimEnd(String str, [String chars = ' ']) {
  if (str.isEmpty) 
    return '';
  int end = str.length - 1;
  while (end >= 0 && chars.contains(str[end])) 
    end--;
  return str.substring(0, end + 1);
}
