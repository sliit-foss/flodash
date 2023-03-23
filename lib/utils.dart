class Utils {
  Map<String, String> mergeHeaders(
          Map<String, String>? h1, Map<String, String>? h2) =>
      {...?h1, ...?h2};

  bool isFormData(Map<String, String>? headers) {
    if ([headers!["Content-Type"], headers["content-type"]]
        .contains("multipart/form-data")) return true;
    return false;
  }
}
