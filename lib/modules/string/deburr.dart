import './helpers/main.dart' as helpers;

String deburrLetter(Match match) =>
    helpers.deburredLetters[match.group(0)] ?? '';

String deburr(String str) => str.isNotEmpty
    ? str
        .replaceAllMapped(helpers.reLatin, deburrLetter)
        .replaceAll(helpers.reComboMark, '')
    : '';
