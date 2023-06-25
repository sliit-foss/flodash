import '_helpers/main.dart' as helpers;

String _deburrLetter(Match match) =>
    helpers.deburredLetters[match.group(0)] ?? '';

/// Deburrs `String` by converting [Latin-1 Supplement](https://en.wikipedia.org/wiki/Latin-1_Supplement_(Unicode_block)#Character_table) and [Latin Extended-A](https://en.wikipedia.org/wiki/Latin_Extended-A) letters to basic Latin letters and removing [combining diacritical marks](https://en.wikipedia.org/wiki/Combining_Diacritical_Marks).
String deburr(String str) => str.isNotEmpty
    ? str
        .replaceAllMapped(helpers.reLatin, _deburrLetter)
        .replaceAll(helpers.reComboMark, '')
    : '';
