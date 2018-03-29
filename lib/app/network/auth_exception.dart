class AuthenticationException implements Exception {
  String cause;
  AuthenticationException(this.cause);
}