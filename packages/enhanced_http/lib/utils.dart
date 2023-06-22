class Utils {
  Map<String, String> mergeHeaders(Map<String, String>? h1, Map<String, String>? h2) => {...?h1, ...?h2};

  bool isStream(Map<String, String>? headers, [String? responseType = "json"]) {
    if ([headers?["Content-Type"], headers?["content-type"]].contains("multipart/form-data") || responseType == "stream") return true;
    return false;
  }
}
