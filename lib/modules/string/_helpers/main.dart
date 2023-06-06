/// Used to match empty string literals in compiled template source.
final reEmptyStringLeading = RegExp(r"\b__p \+= '';"),
    reEmptyStringMiddle = RegExp(r"\b(__p \+=) '' \+"),
    reEmptyStringTrailing = RegExp(r"(__e\(.*?\)|\b__t\)) \+\n'';");

/// Used to match HTML entities and HTML characters.
final reEscapedHtml = RegExp(r"&(?:amp|lt|gt|quot|#39);"),
    reUnescapedHtml = RegExp(r'[&<>"' '\']'),
    reHasEscapedHtml = RegExp(reEscapedHtml.pattern),
    reHasUnescapedHtml = RegExp(reUnescapedHtml.pattern);

/// Used to match template delimiters.
final reEscape = RegExp(r"<%-([\s\S]+?)%>"),
    reEvaluate = RegExp(r"<%([\s\S]+?)%>"),
    reInterpolate = RegExp(r"<%=([\s\S]+?)%>");

/// Used to match property names within property paths.
final reIsDeepProp =
        RegExp(r"\.|\[(?:[^[\]]*|([" "\"'])(?:(?!\1)[^\\]|\\.)*?\1)\]"),
    reIsPlainProp = RegExp(r"^\w*$"),
    rePropName = RegExp(r'\[^[.\[\]]+\]|\[(?:(-?\d+(?:\.\d+)?)|(["'
        '\'])(?:(?!\2)[^\\]|\\.)*?\2)\]|\.(?!\.|\$)|\[\]');

/// Used to match `RegExp`
final reRegExpChar = RegExp(r"[\\^$.*+?()[\]{}|]"),
    reHasRegExpChar = RegExp(reRegExpChar.pattern);

/// Used to match leading and trailing whitespace.
final reTrim = RegExp(r"^\s+|\s+$"),
    reTrimStart = RegExp(r"^\s+"),
    reTrimEnd = RegExp(r"\s+$");

/// Used to match wrap detail comments.
final reWrapComment = RegExp(r"\{(?:\n\/\* \[wrapped with .+\] \*\/)?\n?"),
    reWrapDetails = RegExp(r"\{\n\/\* \[wrapped with (.+)\] \*"),
    reSplitDetails = RegExp(r",? & ");

/// Used to match words composed of alphanumeric characters.
final reAsciiWord = RegExp(r"[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+");

/// Used to match backslashes in property paths.
final reEscapeChar = RegExp(r"\\(\\)?");

/// Used to match
final reEsTemplate = RegExp(r"\$\{([^\\}]*(?:\\.[^\\}]*)*)\}");

/// Used to match `RegExp` flags from their coerced string values.
final reFlags = RegExp(r"\w*$");

/// Used to detect bad signed hexadecimal string values.
final reIsBadHex = RegExp(r"^[-+]0x[0-9a-f]+$");

/// Used to detect binary string values.
final reIsBinary = RegExp(r"^0b[01]+$");

/// Used to detect host constructors (Safari).
final reIsHostCtor = RegExp(r"^\[object .+?Constructor\]$");

/// Used to detect octal string values.
final reIsOctal = RegExp(r"^0o[0-7]+$");

/// Used to detect unsigned integer values.
final reIsUint = RegExp(r"^(?:0|[1-9]\d*)$");

/// Used to match Latin Unicode letters (excluding mathematical operators).
final reLatin = RegExp(r"[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]");

/// Used to ensure capturing order of template delimiters.
final reNoMatch = RegExp(r"($^)");

/// Used to match unescaped characters in compiled string literals.
final reUnescapedString = RegExp(r"['\n\r\u2028\u2029\\]");

/// Used to compose unicode character classes.
final rsAstralRange = '\\ud800-\\udfff',
    rsComboMarksRange = '\\u0300-\\u036f',
    reComboHalfMarksRange = '\\ufe20-\\ufe2f',
    rsComboSymbolsRange = '\\u20d0-\\u20ff',
    rsComboRange =
        rsComboMarksRange + reComboHalfMarksRange + rsComboSymbolsRange,
    rsDingbatRange = '\\u2700-\\u27bf',
    rsLowerRange = 'a-z\\xdf-\\xf6\\xf8-\\xff',
    rsMathOpRange = '\\xac\\xb1\\xd7\\xf7',
    rsNonCharRange = '\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf',
    rsPunctuationRange = '\\u2000-\\u206f',
    rsSpaceRange =
        ' \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000',
    rsUpperRange = 'A-Z\\xc0-\\xd6\\xd8-\\xde',
    rsVarRange = '\\ufe0e\\ufe0f',
    rsBreakRange =
        rsMathOpRange + rsNonCharRange + rsPunctuationRange + rsSpaceRange;

/// Used to compose unicode capture groups.
final rsApos = "['\u2019]",
    rsAstral = '[$rsAstralRange]',
    rsBreak = '[$rsBreakRange]',
    rsCombo = '[$rsComboRange]',
    rsDigits = '\\d+',
    rsDingbat = '[$rsDingbatRange]',
    rsLower = '[$rsLowerRange]',
    rsMisc =
        '[^$rsAstralRange$rsBreakRange$rsDigits$rsDingbatRange$rsLowerRange$rsUpperRange]',
    rsFitz = '\\ud83c[\\udffb-\\udfff]',
    rsModifier = '(?:$rsCombo|$rsFitz)',
    rsNonAstral = '[^$rsAstralRange]',
    rsRegional = '(?:\\ud83c[\\udde6-\\uddff]){2}',
    rsSurrPair = '[\\ud800-\\udbff][\\udc00-\\udfff]',
    rsUpper = '[$rsUpperRange]',
    rsZWJ = '\\u200d';

/// Used to compose unicode regexes.
final rsMiscLower = '(?:$rsLower|$rsMisc)',
    rsMiscUpper = '(?:$rsUpper|$rsMisc)',
    rsOptContrLower = '(?:$rsApos(?:d|ll|m|re|s|t|ve))?',
    rsOptContrUpper = '(?:$rsApos(?:D|LL|M|RE|S|T|VE))?',
    reOptMod = rsModifier + '?',
    rsOptVar = '[$rsVarRange]?',
    rsOptJoin = '(?:$rsZWJ(?:' +
        [rsNonAstral, rsRegional, rsSurrPair].join('|') +
        ')$rsOptVar $reOptMod)*',
    rsOrdLower = '\\d*(?:1st|2nd|3rd|(?![123])\\dth)(?=\\b|[A-Z_])',
    rsOrdUpper = '\\d*(?:1ST|2ND|3RD|(?![123])\\dTH)(?=\\b|[a-z_])',
    rsSeq = rsOptVar + reOptMod + rsOptJoin,
    rsEmoji =
        '(?:' + [rsDingbat, rsRegional, rsSurrPair].join('|') + ')' + rsSeq,
    rsSymbol = '(?:' +
        [rsNonAstral + rsCombo + '?', rsCombo, rsRegional, rsSurrPair, rsAstral]
            .join('|') +
        ')';

/// Used to match apostrophes.
final reApos = RegExp(rsApos);

/// Used to match [combining diacritical marks](https://en.wikipedia.org/wiki/Combining_Diacritical_Marks) and
/// [combining diacritical marks for symbols](https://en.wikipedia.org/wiki/Combining_Diacritical_Marks_for_Symbols).
final reComboMark = RegExp(rsCombo);

/// Used to match [string symbols](https://mathiasbynens.be/notes/javascript-unicode).
final reUnicode = RegExp('$rsFitz(?=$rsFitz)|$rsSymbol$rsSeq');

/// Used to match complex or compound words.
final reUnicodeWord = RegExp([
  '$rsUpper?$rsLower+$rsOptContrLower(?=' +
      [rsBreak, rsUpper, '\$'].join('|') +
      ')',
  '$rsMiscUpper+$rsOptContrUpper(?=' +
      [rsBreak, rsUpper + rsMiscLower, '\$'].join('|') +
      ')',
  '$rsUpper?$rsMiscLower+$rsOptContrLower',
  '$rsUpper+$rsOptContrUpper',
  rsOrdUpper,
  rsOrdLower,
  rsDigits,
  rsEmoji
].join('|'));

/// Used to detect strings with [zero-width joiners or code points from the astral planes](http://eev.ee/blog/2015/09/12/dark-corners-of-unicode/).
final reHasUnicode = RegExp(r"[$rsZWJ$rsAstralRange$rsComboRange$rsVarRange]");

/// Used to detect strings that need a more robust regexp to match words.
final reHasUnicodeWord = RegExp(
    r"[a-z][A-Z]|[A-Z]{2}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]");

/// Used to make template sourceURLs easier to identify.
const templateCounter = -1;

/// Used to map Latin Unicode letters to basic Latin letters.
final Map deburredLetters = {
  // Latin-1 Supplement block.
  '\xc0': 'A', '\xc1': 'A', '\xc2': 'A', '\xc3': 'A', '\xc4': 'A', '\xc5': 'A',
  '\xe0': 'a', '\xe1': 'a', '\xe2': 'a', '\xe3': 'a', '\xe4': 'a', '\xe5': 'a',
  '\xc7': 'C', '\xe7': 'c',
  '\xd0': 'D', '\xf0': 'd',
  '\xc8': 'E', '\xc9': 'E', '\xca': 'E', '\xcb': 'E',
  '\xe8': 'e', '\xe9': 'e', '\xea': 'e', '\xeb': 'e',
  '\xcc': 'I', '\xcd': 'I', '\xce': 'I', '\xcf': 'I',
  '\xec': 'i', '\xed': 'i', '\xee': 'i', '\xef': 'i',
  '\xd1': 'N', '\xf1': 'n',
  '\xd2': 'O', '\xd3': 'O', '\xd4': 'O', '\xd5': 'O', '\xd6': 'O', '\xd8': 'O',
  '\xf2': 'o', '\xf3': 'o', '\xf4': 'o', '\xf5': 'o', '\xf6': 'o', '\xf8': 'o',
  '\xd9': 'U', '\xda': 'U', '\xdb': 'U', '\xdc': 'U',
  '\xf9': 'u', '\xfa': 'u', '\xfb': 'u', '\xfc': 'u',
  '\xdd': 'Y', '\xfd': 'y', '\xff': 'y',
  '\xc6': 'Ae', '\xe6': 'ae',
  '\xde': 'Th', '\xfe': 'th',
  '\xdf': 'ss',
  // Latin Extended-A block.
  '\u0100': 'A', '\u0102': 'A', '\u0104': 'A',
  '\u0101': 'a', '\u0103': 'a', '\u0105': 'a',
  '\u0106': 'C', '\u0108': 'C', '\u010a': 'C', '\u010c': 'C',
  '\u0107': 'c', '\u0109': 'c', '\u010b': 'c', '\u010d': 'c',
  '\u010e': 'D', '\u0110': 'D', '\u010f': 'd', '\u0111': 'd',
  '\u0112': 'E', '\u0114': 'E', '\u0116': 'E', '\u0118': 'E', '\u011a': 'E',
  '\u0113': 'e', '\u0115': 'e', '\u0117': 'e', '\u0119': 'e', '\u011b': 'e',
  '\u011c': 'G', '\u011e': 'G', '\u0120': 'G', '\u0122': 'G',
  '\u011d': 'g', '\u011f': 'g', '\u0121': 'g', '\u0123': 'g',
  '\u0124': 'H', '\u0126': 'H', '\u0125': 'h', '\u0127': 'h',
  '\u0128': 'I', '\u012a': 'I', '\u012c': 'I', '\u012e': 'I', '\u0130': 'I',
  '\u0129': 'i', '\u012b': 'i', '\u012d': 'i', '\u012f': 'i', '\u0131': 'i',
  '\u0134': 'J', '\u0135': 'j',
  '\u0136': 'K', '\u0137': 'k', '\u0138': 'k',
  '\u0139': 'L', '\u013b': 'L', '\u013d': 'L', '\u013f': 'L', '\u0141': 'L',
  '\u013a': 'l', '\u013c': 'l', '\u013e': 'l', '\u0140': 'l', '\u0142': 'l',
  '\u0143': 'N', '\u0145': 'N', '\u0147': 'N', '\u014a': 'N',
  '\u0144': 'n', '\u0146': 'n', '\u0148': 'n', '\u014b': 'n',
  '\u014c': 'O', '\u014e': 'O', '\u0150': 'O',
  '\u014d': 'o', '\u014f': 'o', '\u0151': 'o',
  '\u0154': 'R', '\u0156': 'R', '\u0158': 'R',
  '\u0155': 'r', '\u0157': 'r', '\u0159': 'r',
  '\u015a': 'S', '\u015c': 'S', '\u015e': 'S', '\u0160': 'S',
  '\u015b': 's', '\u015d': 's', '\u015f': 's', '\u0161': 's',
  '\u0162': 'T', '\u0164': 'T', '\u0166': 'T',
  '\u0163': 't', '\u0165': 't', '\u0167': 't',
  '\u0168': 'U', '\u016a': 'U', '\u016c': 'U', '\u016e': 'U', '\u0170': 'U',
  '\u0172': 'U',
  '\u0169': 'u', '\u016b': 'u', '\u016d': 'u', '\u016f': 'u', '\u0171': 'u',
  '\u0173': 'u',
  '\u0174': 'W', '\u0175': 'w',
  '\u0176': 'Y', '\u0177': 'y', '\u0178': 'Y',
  '\u0179': 'Z', '\u017b': 'Z', '\u017d': 'Z',
  '\u017a': 'z', '\u017c': 'z', '\u017e': 'z',
  '\u0132': 'IJ', '\u0133': 'ij',
  '\u0152': 'Oe', '\u0153': 'oe',
  '\u0149': "'n", '\u017f': 's'
};

/// Used to map characters to HTML entities.
final htmlEscapes = {
  '&': '&amp;',
  '<': '&lt;',
  '>': '&gt;',
  '"': '&quot;',
  "'": '&#39;'
};

/// Used to map HTML entities to characters.
final htmlUnescapes = {
  '&amp;': '&',
  '&lt;': '<',
  '&gt;': '>',
  '&quot;': '"',
  '&#39;': "'"
};

/// Used to escape characters for inclusion in compiled string literals.
final stringEscapes = {
  '\\': '\\',
  "'": "'",
  '\n': 'n',
  '\r': 'r',
  '\u2028': 'u2028',
  '\u2029': 'u2029'
};
