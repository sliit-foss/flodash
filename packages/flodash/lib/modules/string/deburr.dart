import '_helpers/main.dart' as helpers;

String _deburrLetter(Match match) =>
    helpers.deburredLetters[match.group(0)] ?? '';

String deburr(String str) => str.isNotEmpty
    ? str
        .replaceAllMapped(helpers.reLatin, _deburrLetter)
        .replaceAll(helpers.reComboMark, '')
    : '';
