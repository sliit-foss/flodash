@Deprecated("Use 'object is Error' instead")
bool isError(dynamic object) {
  return object is Error || object is Exception;
}
