class HttpError extends Error {
  int status;
  Map<String, String> headers;
  dynamic data;
  HttpError(this.status, this.headers, this.data);
}
