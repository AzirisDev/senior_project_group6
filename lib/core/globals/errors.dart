class TokenExpired implements Exception {
  final String? msg;

  TokenExpired({this.msg});

  @override
  String toString() => msg ?? "Token expired";
}
